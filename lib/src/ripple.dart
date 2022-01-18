import 'package:flutter/material.dart';
import 'package:pressable/pressable.dart';

class PressableRipple extends Pressable {
  const PressableRipple({
    Key? key,
    required this.child,
    this.onPressed,
    this.onLongPressed,
    this.theme,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final PressableRippleTheme? theme;

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
      highlightColor: widget.theme?.highlightColor,
      splashColor: widget.theme?.splashColor,
      borderRadius: widget.theme?.borderRadius,
      child: widget.child,
    );
  }
}
