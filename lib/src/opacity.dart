import 'package:equatable/equatable.dart';
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
  final PressableOpacityTheme theme;

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
        opacity: isPressed ? widget.theme.opacityFactor : 1.0,
        duration: widget.theme.duration,
        curve: widget.theme.curve,
        child: widget.child,
      ),
    );
  }
}

class PressableOpacityTheme extends Equatable {
  const PressableOpacityTheme({
    this.duration = const Duration(milliseconds: 100),
    this.curve = Curves.linear,
    this.opacityFactor = 0.6,
    this.backgroundColor = Colors.transparent,
  });

  final Duration duration;
  final double opacityFactor;
  final Curve curve;
  final Color backgroundColor;

  @override
  List<Object?> get props => [duration, opacityFactor, curve, backgroundColor];
}
