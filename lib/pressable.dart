library pressable;

import 'package:flutter/material.dart';
import 'package:pressable/src/builder.dart';
import 'package:pressable/src/fill.dart';
import 'package:pressable/src/opacity.dart';
import 'package:pressable/src/ripple.dart';
import 'package:pressable/src/scale.dart';

export 'package:pressable/src/builder.dart' show PressableBuilderCallback;
export 'package:pressable/src/fill.dart' show PressableFillTheme;
export 'package:pressable/src/opacity.dart' show PressableOpacityTheme;
export 'package:pressable/src/ripple.dart' show PressableRippleTheme;
export 'package:pressable/src/scale.dart' show PressableScaleTheme;

/// Choose named constructors to pick press effect.
abstract class Pressable extends StatefulWidget {
  const Pressable({Key? key}) : super(key: key);

  /// Uses the [InkWell] Widget from Flutter.
  factory Pressable.ripple({
    Key? key,
    required Widget child,
    VoidCallback? onPressed,
    VoidCallback? onLongPressed,
    PressableRippleTheme? theme,
  }) {
    return PressableRipple(
      key: key,
      onPressed: onPressed,
      onLongPressed: onLongPressed,
      theme: theme ?? const PressableRippleTheme(),
      child: child,
    );
  }

  /// Scales the [child] to [PressableScaleTheme.scaleFactor] when tapped.
  factory Pressable.scale({
    Key? key,
    required Widget child,
    VoidCallback? onPressed,
    VoidCallback? onLongPressed,
    PressableScaleTheme? theme,
  }) {
    return PressableScale(
      key: key,
      onPressed: onPressed,
      onLongPressed: onLongPressed,
      theme: theme ?? const PressableScaleTheme(),
      child: child,
    );
  }

  /// Adds [PressableOpacityTheme.opacityFactor] opacity to the [child]
  /// when pressed.
  factory Pressable.opacity({
    Key? key,
    required Widget child,
    VoidCallback? onPressed,
    VoidCallback? onLongPressed,
    PressableOpacityTheme? theme,
  }) {
    return PressableOpacity(
      key: key,
      onPressed: onPressed,
      onLongPressed: onLongPressed,
      theme: theme ?? const PressableOpacityTheme(),
      child: child,
    );
  }

  /// Puts [PressableFillTheme.fillColor] over the [child] when pressed.
  /// [PressableFillTheme.fillColor] needs to be semi-transparent so that
  /// the [child] can be visible.
  ///
  /// Uses [InkWell] for the implementation.
  factory Pressable.fill({
    Key? key,
    required Widget child,
    VoidCallback? onPressed,
    VoidCallback? onLongPressed,
    PressableFillTheme? theme,
  }) {
    return PressableFill(
      key: key,
      onPressed: onPressed,
      onLongPressed: onLongPressed,
      theme: theme ?? const PressableFillTheme(),
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
