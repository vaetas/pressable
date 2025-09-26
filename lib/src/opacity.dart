import 'dart:async' show Timer;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pressable/src/base.dart';
import 'package:pressable/src/theme/provider.dart';
import 'package:pressable/src/theme/theme.dart';

/// Makes [child] semi-transparent when pressed.
class PressableOpacity extends StatefulWidget {
  const PressableOpacity({
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
  final PressableThemeOpacity? theme;

  @override
  State<PressableOpacity> createState() => _PressableOpacityState();
}

class _PressableOpacityState extends State<PressableOpacity>
    with TickerProviderStateMixin {
  late AnimationController _controller = _createAnimationController();
  late Animation<double> _animation = _createAnimation();

  // Touch event handling state from CustomButton
  bool _isLongPressed = false;
  bool _hasActiveGesture = false;
  Timer? _longPressTimer;

  // Track the pointer that started the gesture to ignore subsequent ones
  int? _activePointerId;

  PressableThemeOpacity get theme {
    return widget.theme ??
        DefaultPressableTheme.of(context)?.opacityTheme ??
        const PressableThemeOpacity();
  }

  @override
  void dispose() {
    _longPressTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _handlePointerDown(PointerDownEvent event) {
    // Only handle the first pointer, ignore subsequent ones
    if (_hasActiveGesture) return;

    _hasActiveGesture = true;
    _activePointerId = event.pointer;

    // setState is not needed here as we use animation for visual feedback

    // Start opacity animation
    _controller.animateTo(0.0);

    // Start long press timer
    _longPressTimer?.cancel();
    _longPressTimer = Timer(widget.longPressDuration, () {
      if (_hasActiveGesture && !_isLongPressed) {
        // print(
        //   '[PressableOpacityState._handlePointerDown] '
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

    if (_isLongPressed) {
      // Long press was active, call end callback
      // print('[PressableOpacityState._handlePointerUp] Ending long press');
      widget.onLongPressEnd?.call();
    } else {
      // Normal tap, call pressed callback
      // print('[PressableOpacityState._handlePointerUp] Normal tap');
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
      //   '[PressableOpacityState._handlePointerCancel] '
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
      //   '[PressableOpacityState._handleMouseExit] '
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

    // Revert opacity animation
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

  @override
  Widget build(BuildContext context) {
    assert(theme.opacityFactor < 1.0, 'Opacity factor must be less than 1.0');

    return Listener(
      onPointerDown: _handlePointerDown,
      onPointerUp: _handlePointerUp,
      onPointerCancel: _handlePointerCancel,
      child: MouseRegion(
        cursor: (widget.onPressed != null || widget.onLongPressStart != null)
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        onExit: _handleMouseExit,
        child: FadeTransition(opacity: _animation, child: widget.child),
      ),
    );
  }

  AnimationController _createAnimationController() {
    return AnimationController(
      duration: theme.duration,
      vsync: this,
      value: 1.0,
      lowerBound: theme.opacityFactor,
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
  void didUpdateWidget(covariant PressableOpacity oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.theme != widget.theme) {
      _controller.dispose();
      _controller = _createAnimationController();
      _animation = _createAnimation();
    }
  }
}
