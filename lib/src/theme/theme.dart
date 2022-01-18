import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme.freezed.dart';

@freezed
class PressableTheme with _$PressableTheme {
  const factory PressableTheme.ripple({
    Color? splashColor,
    Color? highlightColor,
    BorderRadius? borderRadius,
  }) = PressableRippleTheme;

  const factory PressableTheme.scale({
    @Default(0.8) double scaleFactor,
    @Default(Duration(milliseconds: 100)) Duration duration,
    @Default(Curves.easeInOut) Curve curve,
  }) = PressableScaleTheme;

  const factory PressableTheme.opacity({
    @Default(Duration(milliseconds: 100)) Duration duration,
    @Default(0.6) double opacityFactor,
    @Default(Curves.linear) Curve curve,
    @Default(Colors.transparent) Color backgroundColor,
  }) = PressableOpacityTheme;

  const factory PressableTheme.fill({
    @Default(Colors.black38) Color fillColor,
    @Default(BorderRadius.zero) BorderRadius borderRadius,
  }) = PressableFillTheme;
}
