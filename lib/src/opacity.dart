import 'package:flutter/material.dart';
import 'package:pressable/pressable.dart';
import 'package:pressable/src/base.dart';

/// Makes [child] transparent.
class PressableOpacity extends Pressable {
  const PressableOpacity({
    Key? key,
    required this.child,
    this.onPressed,
    this.onLongPressed,
    this.theme = const PressableOpacityTheme(),
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final PressableOpacityTheme? theme;

  @override
  PressableBaseState<PressableOpacity> createState() =>
      _PressableOpacityState();
}

class _PressableOpacityState extends PressableBaseState<PressableOpacity>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: theme.duration,
    vsync: this,
    value: 1.0,
    lowerBound: theme.opacityFactor,
    upperBound: 1.0,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: theme.curve,
    reverseCurve: theme.reverseCurve,
  );

  PressableOpacityTheme get theme {
    return widget.theme ??
        DefaultPressableTheme.of(context)?.opacityTheme ??
        const PressableOpacityTheme();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
      child: FadeTransition(
        opacity: _animation,
        child: widget.child,
      ),
    );
  }

  @override
  void onPressStarted(TapDownDetails details) {
    super.onPressStarted(details);
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
    if (_controller.isAnimating) {
      _controller.addListener(_animationFinishedListener);
    } else {
      _revertAnimation();
    }
  }

  @override
  void onPressCanceled() {
    super.onPressCanceled();
    _revertAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
