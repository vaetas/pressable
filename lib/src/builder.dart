import 'dart:async' show Timer;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pressable/src/base.dart' show kLongPressDuration;

/// Builds [Widget] inside [PressableBuilder].
typedef PressableBuilderCallback = Widget Function(
  BuildContext context,
  bool isPressed,
  bool isLongPressed,
);

/// Use [PressableBuilder] to define your own pressable animation. Simplifies
/// working with [GestureDetector].
class PressableBuilder extends StatefulWidget {
  const PressableBuilder({
    super.key,
    required this.builder,
    this.onPressed,
    this.onLongPressStart,
    this.onLongPressEnd,
    this.longPressDuration = kLongPressDuration,
  });

  /// [builder] can have the following states:
  ///
  /// - `isPressed` is true when the widget is pressed
  /// - `isLongPressed` is true when the widget is long pressed. Remember
  ///   that when `isLongPressed` is true, `isPressed` is also true.
  final PressableBuilderCallback builder;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressStart;
  final VoidCallback? onLongPressEnd;
  final Duration longPressDuration;

  @override
  State<PressableBuilder> createState() => _PressableBuilderState();
}

class _PressableBuilderState extends State<PressableBuilder> {
  // Touch event handling state
  bool _isPressed = false;
  bool _isLongPressed = false;
  bool _hasActiveGesture = false;
  Timer? _longPressTimer;

  // Track the pointer that started the gesture to ignore subsequent ones
  int? _activePointerId;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _handlePointerDown,
      onPointerUp: _handlePointerUp,
      onPointerCancel: _handlePointerCancel,
      child: MouseRegion(
        cursor: (widget.onPressed != null || widget.onLongPressStart != null)
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        onExit: _handleMouseExit,
        child: widget.builder(
          context,
          _isPressed,
          _isLongPressed,
        ),
      ),
    );
  }

  void _handlePointerDown(PointerDownEvent event) {
    // Only handle the first pointer, ignore subsequent ones
    if (_hasActiveGesture) return;

    // print('[_PressableBuilderState._handlePointerDown] Starting gesture');
    _hasActiveGesture = true;
    _activePointerId = event.pointer;

    setState(() {
      _isPressed = true;
    });

    // Start long press timer
    _longPressTimer?.cancel();
    _longPressTimer = Timer(widget.longPressDuration, () {
      if (_hasActiveGesture && !_isLongPressed) {
        // print(
        //   '[_PressableBuilderState._handlePointerDown] '
        //   'Starting long press',
        // );
        setState(() {
          _isLongPressed = true;
        });
        widget.onLongPressStart?.call();
      }
    });
  }

  void _handlePointerUp(PointerUpEvent event) {
    // Only handle the pointer that started the gesture
    if (!_hasActiveGesture || event.pointer != _activePointerId) return;

    // print('[_PressableBuilderState._handlePointerUp] Pointer up');
    _longPressTimer?.cancel();

    if (_isLongPressed) {
      // Long press was active, call end callback
      // print('[_PressableBuilderState._handlePointerUp] Ending long press');
      widget.onLongPressEnd?.call();
    } else {
      // Normal tap, call pressed callback
      // print('[_PressableBuilderState._handlePointerUp] Normal tap');
      widget.onPressed?.call();
    }

    _resetState();
  }

  void _handlePointerCancel(PointerCancelEvent event) {
    // Only handle the pointer that started the gesture
    if (!_hasActiveGesture || event.pointer != _activePointerId) return;

    // print('[_PressableBuilderState._handlePointerCancel] Pointer cancel');
    _longPressTimer?.cancel();

    if (_isLongPressed) {
      // print(
      //   '[_PressableBuilderState._handlePointerCancel] '
      //   'Cancelling long press',
      // );
      widget.onLongPressEnd?.call();
    }

    _resetState();
  }

  void _handleMouseExit(PointerExitEvent event) {
    // Only handle if we have an active gesture
    if (!_hasActiveGesture || event.pointer != _activePointerId) return;

    // print('[_PressableBuilderState._handleMouseExit] Mouse exit');
    _longPressTimer?.cancel();

    if (_isLongPressed) {
      // print(
      //   '[_PressableBuilderState._handleMouseExit] '
      //   'Mouse exit during long press',
      // );
      widget.onLongPressEnd?.call();
    }

    _resetState();
  }

  void _resetState() {
    // print('[_PressableBuilderState._resetState] Resetting state');
    setState(() {
      _isPressed = false;
      _isLongPressed = false;
    });
    _hasActiveGesture = false;
    _activePointerId = null;
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
    super.dispose();
  }
}
