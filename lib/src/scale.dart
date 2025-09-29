import 'dart:async' show Timer;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pressable/pressable.dart';

/// Scales [child] down when pressed.
class PressableScale extends StatefulWidget {
  const PressableScale({
    super.key,
    required this.child,
    this.onPressed,
    this.onLongPressStart,
    this.onLongPressEnd,
    this.longPressDuration = kLongPressDuration,
    this.theme,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressStart;
  final VoidCallback? onLongPressEnd;
  final Duration longPressDuration;
  final PressableThemeScale? theme;

  @override
  State<PressableScale> createState() => _PressableScaleState();
}

class _PressableScaleState extends State<PressableScale>
    with TickerProviderStateMixin {
  late AnimationController _controller = _createAnimationController();
  late Animation<double> _animation = _createAnimation();

  // Touch event handling state from PressableOpacity
  bool _isLongPressed = false;
  bool _hasActiveGesture = false;
  Timer? _longPressTimer;

  // Track the pointer that started the gesture to ignore subsequent ones
  int? _activePointerId;

  PressableThemeScale get theme {
    return widget.theme ??
        DefaultPressableTheme.of(context)?.scaleTheme ??
        const PressableThemeScale();
  }

  @override
  Widget build(BuildContext context) {
    assert(theme.scaleFactor < 1.0, 'Scale factor must be less than 1.0');

    return Listener(
      onPointerDown: _handlePointerDown,
      onPointerUp: _handlePointerUp,
      onPointerCancel: _handlePointerCancel,
      child: MouseRegion(
        cursor: (widget.onPressed != null || widget.onLongPressStart != null)
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        onExit: _handleMouseExit,
        child: ScaleTransition(scale: _animation, child: widget.child),
      ),
    );
  }

  void _handlePointerDown(PointerDownEvent event) {
    // Only handle the first pointer, ignore subsequent ones
    if (_hasActiveGesture) return;

    _hasActiveGesture = true;
    _activePointerId = event.pointer;

    // setState is not needed here as we use animation for visual feedback

    // Start scale animation
    _controller.animateTo(theme.scaleFactor);

    // Start long press timer
    _longPressTimer?.cancel();
    _longPressTimer = Timer(widget.longPressDuration, () {
      if (_hasActiveGesture && !_isLongPressed) {
        // print(
        //   '[_PressableScaleState._handlePointerDown] '
        //   'Starting long press',
        // );
        _isLongPressed = true;
        widget.onLongPressStart?.call();
      }
    });
  }

  void _handlePointerUp(PointerUpEvent event) {
    // Only handle the pointer that started the gesture
    if (!_hasActiveGesture || event.pointer != _activePointerId) return;

    _longPressTimer?.cancel();

    if (_isLongPressed && widget.onLongPressEnd != null) {
      // Long press was active, call end callback
      // print('[_PressableScaleState._handlePointerUp] Ending long press');
      widget.onLongPressEnd?.call();
    } else {
      // Normal tap, call pressed callback
      // print('[_PressableScaleState._handlePointerUp] Normal tap');
      widget.onPressed?.call();
    }

    _resetState();
  }

  void _handlePointerCancel(PointerCancelEvent event) {
    // Only handle the pointer that started the gesture
    if (!_hasActiveGesture || event.pointer != _activePointerId) return;

    _longPressTimer?.cancel();

    if (_isLongPressed) {
      // print(
      //   '[_PressableScaleState._handlePointerCancel] '
      //   'Cancelling long press',
      // );
      widget.onLongPressEnd?.call();
    }

    _resetState();
  }

  void _handleMouseExit(PointerExitEvent event) {
    // Only handle if we have an active gesture
    if (!_hasActiveGesture || event.pointer != _activePointerId) return;

    _longPressTimer?.cancel();

    if (_isLongPressed) {
      // print(
      //   '[_PressableScaleState._handleMouseExit] '
      //   'Mouse exit during long press',
      // );
      widget.onLongPressEnd?.call();
    }

    _resetState();
  }

  void _resetState() {
    _isLongPressed = false;
    _hasActiveGesture = false;
    _activePointerId = null;

    // Revert scale animation
    _revertAnimation();
  }

  void _revertAnimation() {
    if (_controller.isAnimating) {
      _controller.addListener(_animationFinishedListener);
    } else {
      _controller.animateTo(1.0);
    }
  }

  /// Wait for animation end before animating back to the default state.
  ///
  /// Used when press is too short to make the animation still visible.
  void _animationFinishedListener() {
    if (_controller.isCompleted) {
      _controller
        ..animateTo(1.0)
        ..removeListener(_animationFinishedListener);
    }
  }

  AnimationController _createAnimationController() {
    return AnimationController(
      duration: theme.duration,
      vsync: this,
      value: 1.0,
      lowerBound: theme.scaleFactor,
      upperBound: 1.0,
    );
  }

  CurvedAnimation _createAnimation() {
    return CurvedAnimation(
      parent: _controller,
      curve: theme.curve,
      reverseCurve: theme.reverseCurve,
    );
  }

  @override
  void didUpdateWidget(covariant PressableScale oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.theme != widget.theme) {
      _controller.dispose();
      _controller = _createAnimationController();
      _animation = _createAnimation();
    }
  }

  @override
  void dispose() {
    if (_isLongPressed) {
      widget.onLongPressEnd?.call();
      _isLongPressed = false;
      _hasActiveGesture = false;
      _activePointerId = null;
    }
    _longPressTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }
}
