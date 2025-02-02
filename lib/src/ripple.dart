import 'package:flutter/material.dart';
import 'package:pressable/pressable.dart';

/// Uses default [InkWell] animation.
class PressableRipple extends Pressable {
  const PressableRipple({
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
  final VoidCallback? onPressStarted;
  final VoidCallback? onPressEnded;
  final VoidCallback? onPressCanceled;
  final PressableRippleTheme? theme;

  @override
  State<PressableRipple> createState() => _PressableRippleState();
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
      onTapDown:
          widget.onPressed != null ? (details) => widget.onPressStarted : null,
      onTapUp:
          widget.onPressed != null ? (details) => widget.onPressEnded : null,
      onTapCancel: widget.onPressed != null ? widget.onPressCanceled : null,
      splashFactory: InkRipple.splashFactory,
      highlightColor: theme?.highlightColor,
      splashColor: theme?.splashColor,
      borderRadius: theme?.borderRadius,
      child: widget.child,
    );
  }
}
