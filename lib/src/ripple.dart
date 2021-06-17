import 'package:flutter/material.dart';
import 'package:pressable/pressable.dart';

class PressableRipple extends Pressable {
  const PressableRipple({
    Key? key,
    required this.child,
    this.onPressed,
    this.onLongPressed,
    this.splashColor,
    this.highlightColor,
    this.borderRadius,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final Color? splashColor;
  final Color? highlightColor;
  final BorderRadius? borderRadius;

  @override
  _PressableRippleState createState() => _PressableRippleState();
}

class _PressableRippleState extends State<PressableRipple> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      onLongPress: widget.onLongPressed,
      splashFactory: InkRipple.splashFactory,
      highlightColor: widget.highlightColor,
      splashColor: widget.splashColor,
      borderRadius: widget.borderRadius,
      child: widget.child,
    );
  }
}
