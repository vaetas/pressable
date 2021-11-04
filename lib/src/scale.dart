import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pressable/pressable.dart';
import 'package:pressable/src/base.dart';

class PressableScale extends Pressable {
  const PressableScale({
    Key? key,
    required this.child,
    this.onPressed,
    this.onLongPressed,
    this.theme = const PressableScaleTheme(),
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final PressableScaleTheme theme;

  @override
  _PressableScaleState createState() => _PressableScaleState();
}

class _PressableScaleState extends PressableBaseState<PressableScale>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: widget.theme.duration,
    vsync: this,
    value: 1.0,
    lowerBound: widget.theme.scaleFactor,
    upperBound: 1.0,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: widget.theme.curve,
  );

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
      behavior: HitTestBehavior.opaque,
      excludeFromSemantics: true,
      child: Builder(
        builder: (context) {
          return ScaleTransition(
            scale: _animation,
            child: widget.child,
          );
        },
      ),
    );
  }

  @override
  void onPressStarted(TapDownDetails details) {
    super.onPressStarted(details);
    _controller.animateTo(widget.theme.scaleFactor);
  }

  @override
  void onPressEnded(TapUpDetails details) {
    super.onPressEnded(details);
    _controller.animateTo(1.0);
  }

  @override
  void onPressCanceled() {
    super.onPressCanceled();
    _controller.animateTo(1.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class PressableScaleTheme extends Equatable {
  const PressableScaleTheme({
    this.scaleFactor = 0.6,
    this.duration = const Duration(milliseconds: 100),
    this.curve = Curves.easeInOut,
  });

  final double scaleFactor;
  final Duration duration;
  final Curve curve;

  @override
  List<Object?> get props => [scaleFactor, duration, curve];
}
