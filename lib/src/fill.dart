import 'package:flutter/material.dart';
import 'package:pressable/pressable.dart';
import 'package:pressable/src/base.dart';

class PressableFill extends Pressable {
  const PressableFill({
    Key? key,
    required this.child,
    this.onPressed,
    this.onLongPressed,
    required this.duration,
    required this.fillColor,
    required this.curve,
    this.borderRadius,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final Duration duration;
  final Color fillColor;
  final Curve curve;
  final BorderRadius? borderRadius;

  @override
  _PressableFillState createState() => _PressableFillState();
}

class _PressableFillState extends PressableBaseState<PressableFill> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      onLongPress: widget.onLongPressed,
      splashFactory: InkRipple.splashFactory,
      highlightColor: widget.fillColor,
      splashColor: Colors.transparent,
      borderRadius: widget.borderRadius,
      child: widget.child,
    );
  }
}
