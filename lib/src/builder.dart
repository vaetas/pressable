import 'package:flutter/material.dart';
import 'package:pressable/src/base.dart';
import 'package:pressable/src/coordination.dart';

/// Builds [Widget] inside [PressableBuilder].
typedef PressableBuilderCallback =
    Widget Function(BuildContext context, bool isPressed);

/// Use [PressableBuilder] to define your own pressable animation. Simplifies
/// working with [GestureDetector].
class PressableBuilder extends StatefulWidget {
  const PressableBuilder({
    super.key,
    required this.builder,
    this.onPressed,
    this.onLongPressed,
    this.coordinationConfig,
  });

  final PressableBuilderCallback builder;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  
  /// Configuration for pointer coordination behavior.
  /// If null, uses the global configuration from [PressableCoordinator].
  final PressableCoordinationConfig? coordinationConfig;

  @override
  PressableBaseState<PressableBuilder> createState() =>
      _PressableBuilderState();
}

class _PressableBuilderState extends PressableBaseState<PressableBuilder> {
  @override
  PressableCoordinationConfig get coordinationConfig {
    return widget.coordinationConfig ?? super.coordinationConfig;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor:
          (widget.onPressed != null || widget.onLongPressed != null)
              ? SystemMouseCursors.click
              : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.onPressed,
        onTapDown: widget.onPressed != null ? onPressStarted : null,
        onTapUp: widget.onPressed != null ? onPressEnded : null,
        onTapCancel: widget.onPressed != null ? onPressCanceled : null,
        onLongPress: widget.onLongPressed,
        child: widget.builder(context, isPressed),
      ),
    );
  }
}
