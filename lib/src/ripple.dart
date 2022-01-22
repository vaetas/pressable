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
  PressableRippleTheme? get theme {
    return widget.theme ?? DefaultPressableTheme.of(context)?.rippleTheme;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      onLongPress: widget.onLongPressed,
      splashFactory: InkRipple.splashFactory,
      highlightColor: theme?.highlightColor,
      splashColor: theme?.splashColor,
      borderRadius: theme?.borderRadius,
      child: widget.child,
    );
  }
}
