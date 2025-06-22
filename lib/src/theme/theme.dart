import 'package:flutter/material.dart';
import 'package:pressable/pressable.dart';

/// Base class for all pressable themes.
abstract class PressableTheme {}

/// Customize [PressableRipple] animations.
class PressableThemeRipple implements PressableTheme {
  const PressableThemeRipple({
    this.splashColor,
    this.highlightColor,
    this.borderRadius,
  });

  final Color? splashColor;
  final Color? highlightColor;
  final BorderRadius? borderRadius;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PressableThemeRipple &&
        other.splashColor == splashColor &&
        other.highlightColor == highlightColor &&
        other.borderRadius == borderRadius;
  }

  @override
  int get hashCode => Object.hash(splashColor, highlightColor, borderRadius);

  @override
  String toString() {
    return 'PressableThemeRipple('
        'splashColor: $splashColor, '
        'highlightColor: $highlightColor, '
        'borderRadius: $borderRadius)';
  }
}

/// Customize [PressableScale] animations.
class PressableThemeScale implements PressableTheme {
  const PressableThemeScale({
    this.scaleFactor = 0.8,
    this.duration = const Duration(milliseconds: 100),
    this.curve = Curves.easeInOut,
    this.reverseCurve = Curves.easeInOut,
  });

  final double scaleFactor;
  final Duration duration;
  final Curve curve;
  final Curve reverseCurve;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PressableThemeScale &&
        other.scaleFactor == scaleFactor &&
        other.duration == duration &&
        other.curve == curve &&
        other.reverseCurve == reverseCurve;
  }

  @override
  int get hashCode => Object.hash(scaleFactor, duration, curve, reverseCurve);

  @override
  String toString() {
    return 'PressableThemeScale('
        'scaleFactor: $scaleFactor, '
        'duration: $duration, '
        'curve: $curve, '
        'reverseCurve: $reverseCurve)';
  }
}

/// Customize [PressableOpacity] animations.
class PressableThemeOpacity implements PressableTheme {
  const PressableThemeOpacity({
    this.duration = const Duration(milliseconds: 100),
    this.opacityFactor = 0.6,
    this.curve = Curves.easeInOut,
    this.reverseCurve = Curves.easeInOut,
  });

  final Duration duration;
  final double opacityFactor;
  final Curve curve;
  final Curve reverseCurve;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PressableThemeOpacity &&
        other.duration == duration &&
        other.opacityFactor == opacityFactor &&
        other.curve == curve &&
        other.reverseCurve == reverseCurve;
  }

  @override
  int get hashCode => Object.hash(duration, opacityFactor, curve, reverseCurve);

  @override
  String toString() {
    return 'PressableThemeOpacity('
        'duration: $duration, '
        'opacityFactor: $opacityFactor, '
        'curve: $curve, '
        'reverseCurve: $reverseCurve)';
  }
}

/// Customize [PressableFill] animations.
class PressableThemeFill implements PressableTheme {
  const PressableThemeFill({
    this.fillColor = Colors.black38,
    this.borderRadius = BorderRadius.zero,
  });

  final Color fillColor;
  final BorderRadius borderRadius;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PressableThemeFill &&
        other.fillColor == fillColor &&
        other.borderRadius == borderRadius;
  }

  @override
  int get hashCode => Object.hash(fillColor, borderRadius);

  @override
  String toString() {
    return 'PressableThemeFill('
        'fillColor: $fillColor, '
        'borderRadius: $borderRadius)';
  }
}
