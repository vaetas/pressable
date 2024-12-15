import 'package:flutter/material.dart';
import 'package:pressable/pressable.dart';

/// Define default values for Pressable theme for Widget subtree.
class DefaultPressableTheme extends InheritedWidget {
  const DefaultPressableTheme({
    super.key,
    this.rippleTheme = const PressableRippleTheme(),
    this.scaleTheme = const PressableScaleTheme(),
    this.opacityTheme = const PressableOpacityTheme(),
    this.fillTheme = const PressableFillTheme(),
    required super.child,
  });

  final PressableRippleTheme rippleTheme;
  final PressableScaleTheme scaleTheme;
  final PressableOpacityTheme opacityTheme;
  final PressableFillTheme fillTheme;

  /// Get closest [DefaultPressableTheme] above in the Widget tree.
  static DefaultPressableTheme? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DefaultPressableTheme>();
  }

  @override
  bool updateShouldNotify(DefaultPressableTheme oldWidget) =>
      rippleTheme != oldWidget.rippleTheme ||
      scaleTheme != oldWidget.scaleTheme ||
      opacityTheme != oldWidget.opacityTheme ||
      fillTheme != oldWidget.fillTheme;
}
