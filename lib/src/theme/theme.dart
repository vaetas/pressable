import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pressable/pressable.dart';

part 'theme.freezed.dart';

/// Customize pressable animations.
@freezed
sealed class PressableTheme with _$PressableTheme {
  /// Customize [PressableRipple] animations.
  const factory PressableTheme.ripple({
    Color? splashColor,
    Color? highlightColor,
    BorderRadius? borderRadius,
  }) = PressableRippleTheme;

  /// Customize [PressableScale] animations.
  const factory PressableTheme.scale({
    @Default(0.8) double scaleFactor,
    @Default(Duration(milliseconds: 100)) Duration duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(Curves.easeInOut) Curve reverseCurve,
  }) = PressableScaleTheme;

  /// Customize [PressableOpacity] animations.
  const factory PressableTheme.opacity({
    @Default(Duration(milliseconds: 100)) Duration duration,
    @Default(0.6) double opacityFactor,
    @Default(Curves.easeInOut) Curve curve,
    @Default(Curves.easeInOut) Curve reverseCurve,
  }) = PressableOpacityTheme;

  /// Customize [PressableFill] animations.
  const factory PressableTheme.fill({
    @Default(Colors.black38) Color fillColor,
    @Default(BorderRadius.zero) BorderRadius borderRadius,
  }) = PressableFillTheme;
}
