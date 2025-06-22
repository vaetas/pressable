import 'package:flutter/material.dart';
import 'package:pressable/pressable.dart';

/// Define default values for Pressable theme for Widget subtree.
class DefaultPressableTheme extends InheritedWidget {
  const DefaultPressableTheme({
    super.key,
    this.rippleTheme = const PressableThemeRipple(),
    this.scaleTheme = const PressableThemeScale(),
    this.opacityTheme = const PressableThemeOpacity(),
    this.fillTheme = const PressableThemeFill(),
    required super.child,
  });

  final PressableThemeRipple rippleTheme;
  final PressableThemeScale scaleTheme;
  final PressableThemeOpacity opacityTheme;
  final PressableThemeFill fillTheme;

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
