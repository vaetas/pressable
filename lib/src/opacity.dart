import 'package:flutter/material.dart';
import 'package:pressable/pressable.dart';
import 'package:pressable/src/base.dart';

/// Makes [child] semi-transparent when pressed.
class PressableOpacity extends StatefulWidget {
  const PressableOpacity({
    super.key,
    required this.child,
    this.onPressed,
    this.onLongPressed,
    this.onPressStarted,
    this.onPressEnded,
    this.onPressCanceled,
    this.theme,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final PressableThemeOpacity? theme;
  final VoidCallback? onPressStarted;
  final VoidCallback? onPressEnded;
  final VoidCallback? onPressCanceled;

  @override
  PressableBaseState<PressableOpacity> createState() =>
      _PressableOpacityState();
}

class _PressableOpacityState extends PressableBaseState<PressableOpacity>
    with TickerProviderStateMixin {
  late AnimationController _controller = _createAnimationController();

  late Animation<double> _animation = _createAnimation();

  PressableThemeOpacity get theme {
    return widget.theme ??
        DefaultPressableTheme.of(context)?.opacityTheme ??
        const PressableThemeOpacity();
  }

  @override
  Widget build(BuildContext context) {
    assert(theme.opacityFactor < 1.0, 'Opacity factor must be less than 1.0');

    return MouseRegion(
      cursor:
          (widget.onPressed != null || widget.onLongPressed != null)
              ? SystemMouseCursors.click
              : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.onPressed,
        onTapDown: widget.onPressed != null ? onPressStarted : null,
        onTapUp: widget.onPressed != null ? onPressEnded : null,
        onTapCancel: widget.onPressed != null ? onPressCanceled : null,
        onLongPress: widget.onLongPressed,
        onLongPressStart:
            widget.onLongPressed != null ? super.onLongPressStarted : null,
        onLongPressEnd:
            widget.onLongPressed != null ? super.onLongPressEnded : null,
        behavior: HitTestBehavior.opaque,
        excludeFromSemantics: true,
        child: FadeTransition(opacity: _animation, child: widget.child),
      ),
    );
  }

  @override
  void onPressStarted(TapDownDetails details) {
    super.onPressStarted(details);
    widget.onPressStarted?.call();
    _controller.animateTo(0.0);
  }

  void _revertAnimation() {
    _controller.animateTo(1.0);
  }

  /// Wait for animation end before animating back to the default state.
  ///
  /// Used when press is too short to make the animation still visible.
  void _animationFinishedListener() {
    if (_controller.isCompleted) {
      _revertAnimation();
      _controller.removeListener(_animationFinishedListener);
    }
  }

  @override
  void onPressEnded(TapUpDetails details) {
    super.onPressEnded(details);
    widget.onPressEnded?.call();
    if (_controller.isAnimating) {
      _controller.addListener(_animationFinishedListener);
    } else {
      _revertAnimation();
    }
  }

  @override
  void onPressCanceled() {
    super.onPressCanceled();
    widget.onPressCanceled?.call();
    _revertAnimation();
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
