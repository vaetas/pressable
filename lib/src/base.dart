import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pressable/src/coordination.dart';
import 'package:pressable/src/pointer_detector.dart';

/// Default [State] for more complex pressable Widgets.
abstract class PressableBaseState<T extends StatefulWidget> extends State<T> {
  bool isPressed = false;
  late final GlobalKey _coordinationKey;
  Timer? _stuckStateTimer;

  /// Configuration for pointer coordination behavior.
  /// Override this in subclasses to customize behavior per widget type.
  PressableCoordinationConfig get coordinationConfig => 
      PressableCoordinator.instance.config;

  @override
  void initState() {
    super.initState();
    _coordinationKey = GlobalKey();
  }

  @override
  void dispose() {
    _stuckStateTimer?.cancel();
    // Ensure we clean up any active presses when the widget is disposed
    PressableCoordinator.instance.endPress(_coordinationKey);
    super.dispose();
  }

  /// Check if a press should be allowed based on coordination rules
  bool _shouldAllowPress(TapDownDetails details) {
    final pointerKind = details.pointerKind;
    
    return PressableCoordinator.instance.canStartPress(
      widgetKey: _coordinationKey,
      pointerKind: pointerKind,
    );
  }

  /// Start a press with coordination
  void _startPressWithCoordination(PointerDeviceKind pointerKind) {
    if (!coordinationConfig.enabled) {
      _startPress();
      return;
    }

    PressableCoordinator.instance.startPress(
      widgetKey: _coordinationKey,
      pointerKind: pointerKind,
    );
    
    // Track the active pointer kind for coordination
    _startPress();
    _startStuckStateTimer();
  }

  /// End a press with coordination
  void _endPressWithCoordination() {
    if (coordinationConfig.enabled) {
      PressableCoordinator.instance.endPress(_coordinationKey);
    }
    
    // Clear the active pointer tracking
    _endPress();
    _cancelStuckStateTimer();
  }

  /// Internal press start
  void _startPress() {
    if (mounted) {
      setState(() {
        isPressed = true;
      });
    }
  }

  /// Internal press end
  void _endPress() {
    if (mounted) {
      setState(() {
        isPressed = false;
      });
    }
  }

  /// Start the stuck state timer
  void _startStuckStateTimer() {
    _cancelStuckStateTimer();
    
    if (coordinationConfig.enabled && 
        coordinationConfig.stuckStateTimeout.inMilliseconds > 0) {
      _stuckStateTimer = Timer(coordinationConfig.stuckStateTimeout, () {
        if (mounted && isPressed) {
          _debugLog('Auto-recovering from stuck state');
          _forceEndPress();
        }
      });
    }
  }

  /// Cancel the stuck state timer
  void _cancelStuckStateTimer() {
    _stuckStateTimer?.cancel();
    _stuckStateTimer = null;
  }

  /// Force end the press (emergency cleanup)
  void _forceEndPress() {
    _endPressWithCoordination();
    onPressCanceled();
  }

  /// Debug logging
  void _debugLog(String message) {
    if (coordinationConfig.debugLogging && kDebugMode) {
      debugPrint('[${widget.runtimeType}] $message');
    }
  }

  // Public interface methods that subclasses override
  void onPressStarted(TapDownDetails details) {
    if (!_shouldAllowPress(details)) {
      _debugLog('Press blocked by coordination system');
      return;
    }

    final pointerKind = details.pointerKind;
    _startPressWithCoordination(pointerKind);
  }

  void onPressEnded(TapUpDetails details) {
    if (isPressed) {
      _endPressWithCoordination();
    }
  }

  void onPressCanceled() {
    if (isPressed) {
      _endPressWithCoordination();
    }
  }

  void onLongPressStarted(LongPressStartDetails details) {
    // LongPressStartDetails doesn't expose pointer kind directly
    // We'll use a default assumption or try to infer from context
    // Default assumption for long press
    const pointerKind = PointerDeviceKind.touch;
    
    // For long press, we need to check if we can start the press
    if (!PressableCoordinator.instance.canStartPress(
      widgetKey: _coordinationKey,
      pointerKind: pointerKind,
    )) {
      _debugLog('Long press blocked by coordination system');
      return;
    }

    _startPressWithCoordination(pointerKind);
  }

  void onLongPressEnded(LongPressEndDetails details) {
    if (isPressed) {
      _endPressWithCoordination();
    }
  }
}

/// Extension to get pointer kind from TapDownDetails using improved detection
extension TapDownDetailsPointerKind on TapDownDetails {
  PointerDeviceKind get pointerKind {
    return PointerDetector.detectPointerKind(this);
  }
}
