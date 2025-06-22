import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pressable/pressable.dart';

void main() {
  group('Pressable Animation Tests', () {
    testWidgets('Scale animation completes correctly', (tester) async {
      const theme = PressableScaleTheme(
        scaleFactor: 0.5,
        duration: Duration(milliseconds: 100),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Pressable.scale(
              theme: theme,
              onPressed: () {},
              child: const Text('Scale Animation'),
            ),
          ),
        ),
      );

      // Find the pressable widget
      final pressableFinder = find.byType(PressableScale);
      expect(pressableFinder, findsOneWidget);

      // Get initial scale value
      var scaleTransition = tester.widget<ScaleTransition>(
        find.descendant(
          of: pressableFinder,
          matching: find.byType(ScaleTransition),
        ),
      );

      // Initially should be at scale 1.0
      expect(scaleTransition.scale.value, equals(1.0));

      // Start gesture
      final gesture = await tester.startGesture(
        tester.getCenter(find.text('Scale Animation')),
      );
      await tester.pump();

      // Should start animating
      await tester.pump(const Duration(milliseconds: 50));
      scaleTransition = tester.widget<ScaleTransition>(
        find.descendant(
          of: pressableFinder,
          matching: find.byType(ScaleTransition),
        ),
      );
      expect(scaleTransition.scale.value, lessThan(1.0));

      // Complete the gesture
      await gesture.up();
      await tester.pumpAndSettle();

      // Should return to scale 1.0
      scaleTransition = tester.widget<ScaleTransition>(
        find.descendant(
          of: pressableFinder,
          matching: find.byType(ScaleTransition),
        ),
      );
      expect(scaleTransition.scale.value, equals(1.0));
    });

    testWidgets('Opacity animation completes correctly', (tester) async {
      const theme = PressableOpacityTheme(
        opacityFactor: 0.3,
        duration: Duration(milliseconds: 100),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Pressable.opacity(
              theme: theme,
              onPressed: () {},
              child: const Text('Opacity Animation'),
            ),
          ),
        ),
      );

      // Find the pressable widget
      final pressableFinder = find.byType(PressableOpacity);
      expect(pressableFinder, findsOneWidget);

      // Get initial opacity value
      var fadeTransition = tester.widget<FadeTransition>(
        find.descendant(
          of: pressableFinder,
          matching: find.byType(FadeTransition),
        ),
      );

      // Initially should be at opacity 1.0
      expect(fadeTransition.opacity.value, equals(1.0));

      // Start gesture
      final gesture = await tester.startGesture(
        tester.getCenter(find.text('Opacity Animation')),
      );
      await tester.pump();

      // Should start animating toward the opacity factor
      await tester.pump(const Duration(milliseconds: 50));
      fadeTransition = tester.widget<FadeTransition>(
        find.descendant(
          of: pressableFinder,
          matching: find.byType(FadeTransition),
        ),
      );
      expect(fadeTransition.opacity.value, lessThan(1.0));

      // Complete the gesture
      await gesture.up();
      await tester.pumpAndSettle();

      // Should return to opacity 1.0
      fadeTransition = tester.widget<FadeTransition>(
        find.descendant(
          of: pressableFinder,
          matching: find.byType(FadeTransition),
        ),
      );
      expect(fadeTransition.opacity.value, equals(1.0));
    });

    testWidgets('Scale animation with custom curve works', (tester) async {
      const theme = PressableScaleTheme(
        scaleFactor: 0.8,
        duration: Duration(milliseconds: 200),
        curve: Curves.bounceIn,
        reverseCurve: Curves.bounceOut,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Pressable.scale(
              theme: theme,
              onPressed: () {},
              child: const Text('Curve Test'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Curve Test'));
      await tester.pumpAndSettle();

      // Should complete without errors
      expect(find.text('Curve Test'), findsOneWidget);
    });

    testWidgets('Multiple rapid taps handle correctly', (tester) async {
      var pressed = false;
      var pressCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Pressable.scale(
              onPressed: () {
                pressed = true;
                pressCount++;
              },
              child: const Text('Rapid Tap'),
            ),
          ),
        ),
      );

      // Rapid taps
      for (var i = 0; i < 5; i++) {
        await tester.tap(find.text('Rapid Tap'));
        await tester.pump(const Duration(milliseconds: 10));
      }

      await tester.pumpAndSettle();

      expect(pressed, isTrue);
      expect(pressCount, equals(5));
    });

    testWidgets('Animation continues when theme changes', (tester) async {
      const initialTheme = PressableScaleTheme(scaleFactor: 0.5);
      const newTheme = PressableScaleTheme(scaleFactor: 0.8);

      await tester.pumpWidget(
        const MaterialApp(
          home: _AnimationThemeTestWidget(
            initialTheme: initialTheme,
            newTheme: newTheme,
          ),
        ),
      );

      // Press and hold
      final gesture = await tester.startGesture(
        tester.getCenter(find.text('Theme Change Test')),
      );
      await tester.pump();

      // Change theme while pressed
      await tester.tap(find.text('Change Theme'));
      await tester.pump();

      // Complete gesture
      await gesture.up();
      await tester.pumpAndSettle();

      expect(find.text('Theme Change Test'), findsOneWidget);
    });

    testWidgets('Long animation duration works correctly', (tester) async {
      const theme = PressableScaleTheme(
        duration: Duration(seconds: 1), // Long duration
        scaleFactor: 0.7,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Pressable.scale(
              theme: theme,
              onPressed: () {},
              child: const Text('Long Animation'),
            ),
          ),
        ),
      );

      final pressableFinder = find.byType(PressableScale);

      // Start a gesture
      final gesture = await tester.startGesture(
        tester.getCenter(find.text('Long Animation')),
      );
      await tester.pump();

      // After half the duration, should still be animating
      await tester.pump(const Duration(milliseconds: 500));

      var scaleTransition = tester.widget<ScaleTransition>(
        find.descendant(
          of: pressableFinder,
          matching: find.byType(ScaleTransition),
        ),
      );
      expect(scaleTransition.scale.value, lessThan(1.0));

      // Complete the gesture
      await gesture.up();
      await tester.pumpAndSettle();

      scaleTransition = tester.widget<ScaleTransition>(
        find.descendant(
          of: pressableFinder,
          matching: find.byType(ScaleTransition),
        ),
      );
      expect(scaleTransition.scale.value, equals(1.0));
    });

    testWidgets('Very short press still shows animation', (tester) async {
      const theme = PressableScaleTheme(
        duration: Duration(milliseconds: 300),
        scaleFactor: 0.5,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Pressable.scale(
              theme: theme,
              onPressed: () {},
              child: const Text('Short Press'),
            ),
          ),
        ),
      );

      final pressableFinder = find.byType(PressableScale);

      // Very quick tap
      await tester.tap(find.text('Short Press'));
      await tester.pumpAndSettle();

      final scaleTransition = tester.widget<ScaleTransition>(
        find.descendant(
          of: pressableFinder,
          matching: find.byType(ScaleTransition),
        ),
      );
      expect(scaleTransition.scale.value, equals(1.0));
    });

    testWidgets('Animation controller disposes properly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Pressable.scale(
              onPressed: () {},
              child: const Text('Dispose Test'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Dispose Test'));
      await tester.pump();

      // Remove the widget
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: Text('Empty'))),
      );

      // Should not throw any errors about disposed controllers
      await tester.pumpAndSettle();
      expect(find.text('Empty'), findsOneWidget);
    });
  });
}

class _AnimationThemeTestWidget extends StatefulWidget {
  const _AnimationThemeTestWidget({
    required this.initialTheme,
    required this.newTheme,
  });

  final PressableScaleTheme initialTheme;
  final PressableScaleTheme newTheme;

  @override
  State<_AnimationThemeTestWidget> createState() =>
      _AnimationThemeTestWidgetState();
}

class _AnimationThemeTestWidgetState extends State<_AnimationThemeTestWidget> {
  late PressableScaleTheme currentTheme;

  @override
  void initState() {
    super.initState();
    currentTheme = widget.initialTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Pressable.scale(
            theme: currentTheme,
            onPressed: () {},
            child: const Text('Theme Change Test'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                currentTheme = widget.newTheme;
              });
            },
            child: const Text('Change Theme'),
          ),
        ],
      ),
    );
  }
}
