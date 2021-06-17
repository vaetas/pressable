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
      child: Stack(
        children: [
          widget.child,
          Positioned.fill(
            child: AnimatedContainer(
              duration: widget.duration,
              curve: widget.curve,
              decoration: BoxDecoration(
                borderRadius: widget.borderRadius,
                color: isPressed ? widget.fillColor : Colors.transparent,
              ),
              child: const SizedBox.expand(),
            ),
          ),
        ],
      ),
    );
  }
}
