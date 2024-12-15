import 'package:flutter/material.dart';
import 'package:pressable/pressable.dart';
import 'package:pressable/src/base.dart';

/// Fills [child] with selected color when pressed.
class PressableFill extends Pressable {
  const PressableFill({
    super.key,
    required this.child,
    this.onPressed,
    this.onLongPressed,
    required this.theme,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final PressableFillTheme? theme;

  @override
  PressableBaseState<PressableFill> createState() => _PressableFillState();
}

class _PressableFillState extends PressableBaseState<PressableFill> {
  PressableFillTheme get theme {
    return widget.theme ??
        DefaultPressableTheme.of(context)?.fillTheme ??
        const PressableFillTheme();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      onLongPress: widget.onLongPressed,
      splashFactory: InkRipple.splashFactory,
      highlightColor: theme.fillColor,
      splashColor: Colors.transparent,
      borderRadius: theme.borderRadius,
      child: widget.child,
    );
  }
}
