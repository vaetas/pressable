library;

import 'package:flutter/material.dart';
import 'package:pressable/src/builder.dart';
import 'package:pressable/src/fill.dart';
import 'package:pressable/src/opacity.dart';
import 'package:pressable/src/platform.dart';
import 'package:pressable/src/ripple.dart';
import 'package:pressable/src/scale.dart';
import 'package:pressable/src/theme/theme.dart';

export 'package:pressable/src/builder.dart';
export 'package:pressable/src/fill.dart';
export 'package:pressable/src/opacity.dart';
export 'package:pressable/src/provider.dart';
export 'package:pressable/src/ripple.dart';
export 'package:pressable/src/scale.dart';
export 'package:pressable/src/theme/theme.dart';

/// Choose named constructors to pick press effect.
abstract class Pressable extends StatefulWidget {
  const Pressable({super.key});

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
      theme: theme,
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
      theme: theme,
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
      theme: theme,
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
      theme: theme,
      child: child,
    );
  }

  /// Provide platform specific [PressableTheme]. You must provide theme for
  /// current platform otherwise error is thrown.
  factory Pressable.platform({
    Key? key,
    required Widget child,
    VoidCallback? onPressed,
    VoidCallback? onLongPressed,
    PressableTheme? ios,
    PressableTheme? android,
    PressableTheme? macOS,
    PressableTheme? windows,
    PressableTheme? linux,
  }) {
    return PressablePlatform(
      key: key,
      ios: ios,
      macOS: macOS,
      windows: windows,
      linux: linux,
      android: android,
      onPressed: onPressed,
      onLongPressed: onLongPressed,
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
