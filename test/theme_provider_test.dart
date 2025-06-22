import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pressable/pressable.dart';

void main() {
  group('Theme Provider Tests', () {
    testWidgets('DefaultPressableTheme provides themes to child widgets', (
      tester,
    ) async {
      const customScaleTheme = PressableThemeScale(
        scaleFactor: 0.7,
        duration: Duration(milliseconds: 250),
      );
      const customOpacityTheme = PressableThemeOpacity(
        opacityFactor: 0.4,
        duration: Duration(milliseconds: 200),
      );
      const customRippleTheme = PressableThemeRipple(
        splashColor: Colors.red,
        highlightColor: Colors.blue,
      );
      const customFillTheme = PressableThemeFill(fillColor: Colors.green);

      await tester.pumpWidget(
        MaterialApp(
          home: DefaultPressableTheme(
            scaleTheme: customScaleTheme,
            opacityTheme: customOpacityTheme,
            rippleTheme: customRippleTheme,
            fillTheme: customFillTheme,
            child: Scaffold(
              body: Column(
                children: [
                  PressableScale(onPressed: () {}, child: const Text('Scale')),
                  PressableOpacity(
                    onPressed: () {},
                    child: const Text('Opacity'),
                  ),
                  PressableRipple(
                    onPressed: () {},
                    child: const Text('Ripple'),
                  ),
                  PressableFill(onPressed: () {}, child: const Text('Fill')),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text('Scale'), findsOneWidget);
      expect(find.text('Opacity'), findsOneWidget);
      expect(find.text('Ripple'), findsOneWidget);
      expect(find.text('Fill'), findsOneWidget);
    });

    testWidgets('DefaultPressableTheme.of returns correct theme', (
      tester,
    ) async {
      const customScaleTheme = PressableThemeScale(scaleFactor: 0.6);
      DefaultPressableTheme? capturedTheme;

      await tester.pumpWidget(
        MaterialApp(
          home: DefaultPressableTheme(
            scaleTheme: customScaleTheme,
            child: Scaffold(
              body: Builder(
                builder: (context) {
                  capturedTheme = DefaultPressableTheme.of(context);
                  return const Text('Test');
                },
              ),
            ),
          ),
        ),
      );

      expect(capturedTheme, isNotNull);
      expect(capturedTheme!.scaleTheme.scaleFactor, equals(0.6));
    });

    testWidgets('DefaultPressableTheme.of returns null when no provider', (
      tester,
    ) async {
      DefaultPressableTheme? capturedTheme;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                capturedTheme = DefaultPressableTheme.of(context);
                return const Text('Test');
              },
            ),
          ),
        ),
      );

      expect(capturedTheme, isNull);
    });

    testWidgets('Nested DefaultPressableTheme providers work correctly', (
      tester,
    ) async {
      const outerScaleTheme = PressableThemeScale(scaleFactor: 0.5);
      const innerScaleTheme = PressableThemeScale(scaleFactor: 0.8);

      DefaultPressableTheme? outerCapturedTheme;
      DefaultPressableTheme? innerCapturedTheme;

      await tester.pumpWidget(
        MaterialApp(
          home: DefaultPressableTheme(
            scaleTheme: outerScaleTheme,
            child: Scaffold(
              body: Column(
                children: [
                  Builder(
                    builder: (context) {
                      outerCapturedTheme = DefaultPressableTheme.of(context);
                      return const Text('Outer');
                    },
                  ),
                  DefaultPressableTheme(
                    scaleTheme: innerScaleTheme,
                    child: Builder(
                      builder: (context) {
                        innerCapturedTheme = DefaultPressableTheme.of(context);
                        return const Text('Inner');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(outerCapturedTheme!.scaleTheme.scaleFactor, equals(0.5));
      expect(innerCapturedTheme!.scaleTheme.scaleFactor, equals(0.8));
    });

    testWidgets('Widgets use default themes when no specific theme provided', (
      tester,
    ) async {
      const customScaleTheme = PressableThemeScale(scaleFactor: 0.7);
      var pressedScale = false;

      await tester.pumpWidget(
        MaterialApp(
          home: DefaultPressableTheme(
            scaleTheme: customScaleTheme,
            child: Scaffold(
              body: PressableScale(
                onPressed: () => pressedScale = true,
                child: const Text('Scale Test'),
              ),
            ),
          ),
        ),
      );

      // The widget should use the default theme from context
      final scaleWidget = tester.widget<PressableScale>(
        find.byType(PressableScale),
      );
      expect(
        scaleWidget.theme,
        isNull,
      ); // Widget theme should be null, uses context

      await tester.tap(find.text('Scale Test'));
      expect(pressedScale, isTrue);
    });

    testWidgets('Widget-specific themes override default themes', (
      tester,
    ) async {
      const defaultScaleTheme = PressableThemeScale(scaleFactor: 0.5);
      const overrideScaleTheme = PressableThemeScale(scaleFactor: 0.9);

      await tester.pumpWidget(
        MaterialApp(
          home: DefaultPressableTheme(
            scaleTheme: defaultScaleTheme,
            child: Scaffold(
              body: Column(
                children: [
                  PressableScale(
                    onPressed: () {},
                    child: const Text('Default Scale'),
                  ),
                  PressableScale(
                    theme: overrideScaleTheme,
                    onPressed: () {},
                    child: const Text('Override Scale'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      final scaleWidgets =
          tester
              .widgetList<PressableScale>(find.byType(PressableScale))
              .toList();

      // First widget uses default theme (null passed to widget)
      expect(scaleWidgets[0].theme, isNull);

      // Second widget uses override theme
      expect(scaleWidgets[1].theme, equals(overrideScaleTheme));
    });
  });
}
