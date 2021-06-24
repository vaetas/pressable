import 'package:flutter/material.dart';
import 'package:pressable/pressable.dart';
import 'package:pressable/src/base.dart';

class PressableOpacity extends Pressable {
  const PressableOpacity({
    Key? key,
    required this.child,
    this.onPressed,
    this.onLongPressed,
    required this.duration,
    required this.opacityFactor,
    required this.curve,
    required this.backgroundColor,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final Duration duration;
  final double opacityFactor;
  final Curve curve;
  final Color backgroundColor;

  @override
  _PressableOpacityState createState() => _PressableOpacityState();
}

class _PressableOpacityState extends PressableBaseState<PressableOpacity> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      onTapDown: widget.onPressed != null ? onPressStarted : null,
      onTapUp: widget.onPressed != null ? onPressEnded : null,
      onTapCancel: widget.onPressed != null ? onPressCanceled : null,
      onLongPress: widget.onLongPressed,
      behavior: HitTestBehavior.opaque,
      child: AnimatedOpacity(
        opacity: isPressed ? widget.opacityFactor : 1.0,
        duration: widget.duration,
        curve: widget.curve,
        child: widget.child,
      ),
    );
  }
}
