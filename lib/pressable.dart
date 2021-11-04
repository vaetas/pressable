library pressable;

import 'package:flutter/material.dart';
import 'package:pressable/src/builder.dart';
import 'package:pressable/src/fill.dart';
import 'package:pressable/src/opacity.dart';
import 'package:pressable/src/ripple.dart';
import 'package:pressable/src/scale.dart';

export 'package:pressable/src/builder.dart' show PressableBuilderCallback;

/// Choose named constructors to pick press effect.
abstract class Pressable extends StatefulWidget {
  const Pressable({Key? key}) : super(key: key);

  /// Uses the [InkWell] Widget from Flutter.
  factory Pressable.ripple({
    Key? key,
    required Widget child,
    VoidCallback? onPressed,
    VoidCallback? onLongPressed,
    BorderRadius? borderRadius,
    Color? splashColor,
    Color? highlightColor,
  }) {
    return PressableRipple(
      key: key,
      onPressed: onPressed,
      onLongPressed: onLongPressed,
      borderRadius: borderRadius,
      splashColor: splashColor,
      highlightColor: highlightColor,
      child: child,
    );
  }

  /// Scales the [child] by [scaleFactor] when tapped.
  factory Pressable.scale({
    Key? key,
    required Widget child,
    VoidCallback? onPressed,
    VoidCallback? onLongPressed,
    Duration duration = const Duration(milliseconds: 100),
    Curve curve = Curves.easeInOut,
    double scaleFactor = 0.6,
  }) {
    return PressableScale(
      key: key,
      onPressed: onPressed,
      onLongPressed: onLongPressed,
      curve: curve,
      duration: duration,
      scaleFactor: scaleFactor,
      child: child,
    );
  }

  /// Adds [opacityFactor] opacity to the [child] when pressed.
  factory Pressable.opacity({
    Key? key,
    required Widget child,
    VoidCallback? onPressed,
    VoidCallback? onLongPressed,
    Duration duration = const Duration(milliseconds: 100),
    Curve curve = Curves.linear,
    double opacityFactor = 0.6,
    Color backgroundColor = Colors.transparent,
  }) {
    return PressableOpacity(
      key: key,
      onPressed: onPressed,
      onLongPressed: onLongPressed,
      duration: duration,
      curve: curve,
      opacityFactor: opacityFactor,
      backgroundColor: backgroundColor,
      child: child,
    );
  }

  /// Puts [fillColor] over the [child] when pressed. [fillColor] needs to be
  /// semi-transparent so that the [child] can be visible.
  ///
  /// Uses [InkWell] for the implementation.
  factory Pressable.fill({
    Key? key,
    required Widget child,
    VoidCallback? onPressed,
    VoidCallback? onLongPressed,
    Duration duration = const Duration(milliseconds: 100),
    Curve curve = Curves.linear,
    Color fillColor = Colors.black38,
    BorderRadius? borderRadius,
  }) {
    return PressableFill(
      key: key,
      onPressed: onPressed,
      onLongPressed: onLongPressed,
      duration: duration,
      curve: curve,
      fillColor: fillColor,
      borderRadius: borderRadius,
      child: child,
    );
  }

  /// Use builder to define your own effect.
  factory Pressable.builder({
    Key? key,
    required PressableBuilderCallback builder,
    VoidCallback? onPressed,
    VoidCallback? onLongPressed,
  }) {
    return PressableBuilder(
      key: key,
      builder: builder,
      onPressed: onPressed,
      onLongPressed: onLongPressed,
    );
  }
}
