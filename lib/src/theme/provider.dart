import 'package:flutter/material.dart';
import 'package:pressable/pressable.dart';

/// Define default values for Pressable theme for Widget subtree.
class DefaultPressableTheme extends InheritedWidget {
  const DefaultPressableTheme({
    super.key,
    this.scaleTheme = const PressableThemeScale(),
    this.opacityTheme = const PressableThemeOpacity(),
    required super.child,
  });

  final PressableThemeScale scaleTheme;
  final PressableThemeOpacity opacityTheme;

  /// Get closest [DefaultPressableTheme] above in the Widget tree.
  static DefaultPressableTheme? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DefaultPressableTheme>();
  }

  @override
  bool updateShouldNotify(DefaultPressableTheme oldWidget) =>
      scaleTheme != oldWidget.scaleTheme ||
      opacityTheme != oldWidget.opacityTheme;
}
