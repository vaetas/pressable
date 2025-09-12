import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// A robust gesture detector that combines GestureDetector with fallback pointer handling
/// for better cross-platform compatibility, especially on Linux desktop touch screens.
class CustomGestureDetector extends StatefulWidget {
  const CustomGestureDetector({
    super.key,
    required this.child,
    this.onTap,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onLongPress,
    this.onLongPressStart,
    this.onLongPressEnd,
    this.behavior,
    this.excludeFromSemantics = false,
  });

  final Widget child;
  final VoidCallback? onTap;
  final GestureTapDownCallback? onTapDown;
  final GestureTapUpCallback? onTapUp;
  final VoidCallback? onTapCancel;
  final VoidCallback? onLongPress;
  final GestureLongPressStartCallback? onLongPressStart;
  final GestureLongPressEndCallback? onLongPressEnd;
  final HitTestBehavior? behavior;
  final bool excludeFromSemantics;

  @override
  State<CustomGestureDetector> createState() => _CustomGestureDetectorState();
}

class _CustomGestureDetectorState extends State<CustomGestureDetector> {
  bool _isPressed = false;
  int? _activePointerId;
  bool _gestureHandled = false;

  // Track if we're on a platform that might have touch issues
  bool get _needsPointerFallback => 
      defaultTargetPlatform == TargetPlatform.linux;

  void _handlePointerDown(PointerDownEvent event) {
    if (_needsPointerFallback && _activePointerId == null) {
      _activePointerId = event.pointer;
      _isPressed = true;
      _gestureHandled = false;
    }
  }

  void _handlePointerUp(PointerUpEvent event) {
    if (_needsPointerFallback && 
        _activePointerId == event.pointer && 
        _isPressed && 
        !_gestureHandled) {
      
      _activePointerId = null;
      _isPressed = false;
      
      // Only trigger fallback if gesture detector didn't handle it
      widget.onTapUp?.call(TapUpDetails(
        kind: PointerDeviceKind.touch,
        globalPosition: event.position,
        localPosition: event.localPosition,
      ));
      widget.onTap?.call();
    }
  }

  void _handlePointerCancel(PointerCancelEvent event) {
    if (_needsPointerFallback && 
        _activePointerId == event.pointer && 
        _isPressed && 
        !_gestureHandled) {
      
      _activePointerId = null;
      _isPressed = false;
      widget.onTapCancel?.call();
    }
  }

  void _onGestureTapDown(TapDownDetails details) {
    _gestureHandled = true;
    widget.onTapDown?.call(details);
  }

  void _onGestureTapUp(TapUpDetails details) {
    _gestureHandled = true;
    _isPressed = false;
    widget.onTapUp?.call(details);
  }

  void _onGestureTapCancel() {
    _gestureHandled = true;
    _isPressed = false;
    widget.onTapCancel?.call();
  }

  void _onGestureTap() {
    _gestureHandled = true;
    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    Widget child = GestureDetector(
      onTap: widget.onTap != null ? _onGestureTap : null,
      onTapDown: widget.onTapDown != null ? _onGestureTapDown : null,
      onTapUp: widget.onTapUp != null ? _onGestureTapUp : null,
      onTapCancel: widget.onTapCancel != null ? _onGestureTapCancel : null,
      onLongPress: widget.onLongPress,
      onLongPressStart: widget.onLongPressStart,
      onLongPressEnd: widget.onLongPressEnd,
      behavior: widget.behavior ?? HitTestBehavior.opaque,
      excludeFromSemantics: widget.excludeFromSemantics,
      child: widget.child,
    );

    // Only add pointer fallback on platforms that need it
    if (_needsPointerFallback) {
      child = Listener(
        onPointerDown: _handlePointerDown,
        onPointerUp: _handlePointerUp,
        onPointerCancel: _handlePointerCancel,
        child: child,
      );
    }

    return child;
  }
}
