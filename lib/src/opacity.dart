import 'package:flutter/material.dart';
import 'package:pressable/pressable.dart';
import 'package:pressable/src/base.dart';

class PressableOpacity extends Pressable {
  const PressableOpacity({
    Key? key,
    required this.child,
    this.onPressed,
    this.onLongPressed,
    required this.theme,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final PressableOpacityTheme? theme;

  @override
  _PressableOpacityState createState() => _PressableOpacityState();
}

class _PressableOpacityState extends PressableBaseState<PressableOpacity> {
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
      behavior: HitTestBehavior.opaque,
      child: AnimatedOpacity(
        opacity: isPressed ? theme.opacityFactor : 1.0,
        duration: theme.duration,
        curve: theme.curve,
        child: widget.child,
      ),
    );
  }
}
