import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pressable/pressable.dart';

void main() {
  group('Pressable Widget Tests', () {
    testWidgets('Pressable.ripple renders correctly', (tester) async {
      var pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PressableRipple(
              onPressed: () => pressed = true,
              child: const Text('Test'),
            ),
          ),
        ),
      );

      expect(find.text('Test'), findsOneWidget);
      expect(find.byType(InkWell), findsOneWidget);

      await tester.tap(find.text('Test'));
      expect(pressed, isTrue);
    });

    testWidgets('Pressable.scale renders and animates correctly', (
      tester,
    ) async {
      var pressed = false;
      var pressStarted = false;
      var pressEnded = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PressableScale(
              onPressed: () => pressed = true,
              onPressStarted: () => pressStarted = true,
              onPressEnded: () => pressEnded = true,
              child: const Text('Scale Test'),
            ),
          ),
        ),
      );

      expect(find.text('Scale Test'), findsOneWidget);
      expect(find.byType(ScaleTransition), findsWidgets);

      // Test full tap cycle
      final gesture = await tester.startGesture(
        tester.getCenter(find.text('Scale Test')),
      );
      await tester.pump();
      expect(pressStarted, isTrue);

      // Complete the gesture
      await gesture.up();
      await tester.pumpAndSettle();
      expect(pressed, isTrue);
      expect(pressEnded, isTrue);
    });

    testWidgets('Pressable.opacity renders and animates correctly', (
      tester,
    ) async {
      var pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PressableOpacity(
              onPressed: () => pressed = true,
              child: const Text('Opacity Test'),
            ),
          ),
        ),
      );

      expect(find.text('Opacity Test'), findsOneWidget);
      expect(find.byType(FadeTransition), findsOneWidget);

      await tester.tap(find.text('Opacity Test'));
      await tester.pumpAndSettle();
      expect(pressed, isTrue);
    });

    testWidgets('Pressable.fill renders correctly', (tester) async {
      var pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PressableFill(
              onPressed: () => pressed = true,
              child: const Text('Fill Test'),
            ),
          ),
        ),
      );

      expect(find.text('Fill Test'), findsOneWidget);
      expect(find.byType(InkWell), findsOneWidget);

      await tester.tap(find.text('Fill Test'));
      expect(pressed, isTrue);
    });

    testWidgets('Pressable.builder provides correct pressed state', (
      tester,
    ) async {
      var pressed = false;
      var builderPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PressableBuilder(
              onPressed: () => pressed = true,
              builder: (context, isPressed) {
                builderPressed = isPressed;
                return Text(isPressed ? 'Pressed' : 'Not Pressed');
              },
            ),
          ),
        ),
      );

      expect(find.text('Not Pressed'), findsOneWidget);
      expect(builderPressed, isFalse);

      // Press down but don't release
      final gesture = await tester.startGesture(
        tester.getCenter(find.text('Not Pressed')),
      );
      await tester.pump();

      expect(find.text('Pressed'), findsOneWidget);
      expect(builderPressed, isTrue);

      // Release the gesture
      await gesture.up();

      // Release
      await tester.pumpAndSettle();
      expect(pressed, isTrue);
    });

    testWidgets('Long press callbacks work correctly', (tester) async {
      var longPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PressableScale(
              onLongPressed: () => longPressed = true,
              child: const Text('Long Press Test'),
            ),
          ),
        ),
      );

      await tester.longPress(find.text('Long Press Test'));
      await tester.pumpAndSettle();
      expect(longPressed, isTrue);
    });

    testWidgets('Scale theme customization works', (tester) async {
      const customTheme = PressableThemeScale(
        scaleFactor: 0.5,
        duration: Duration(milliseconds: 200),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PressableScale(
              theme: customTheme,
              onPressed: () {},
              child: const Text('Custom Theme'),
            ),
          ),
        ),
      );

      final scaleWidget = tester.widget<PressableScale>(
        find.byType(PressableScale),
      );
      expect(scaleWidget.theme, equals(customTheme));
    });

    testWidgets('Opacity theme customization works', (tester) async {
      const customTheme = PressableThemeOpacity(
        opacityFactor: 0.3,
        duration: Duration(milliseconds: 150),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PressableOpacity(
              theme: customTheme,
              onPressed: () {},
              child: const Text('Custom Opacity'),
            ),
          ),
        ),
      );

      final opacityWidget = tester.widget<PressableOpacity>(
        find.byType(PressableOpacity),
      );
      expect(opacityWidget.theme, equals(customTheme));
    });

    testWidgets('Ripple theme customization works', (tester) async {
      const customTheme = PressableThemeRipple(
        splashColor: Colors.red,
        highlightColor: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PressableRipple(
              theme: customTheme,
              onPressed: () {},
              child: const Text('Custom Ripple'),
            ),
          ),
        ),
      );

      final rippleWidget = tester.widget<PressableRipple>(
        find.byType(PressableRipple),
      );
      expect(rippleWidget.theme, equals(customTheme));
    });

    testWidgets('Fill theme customization works', (tester) async {
      const customTheme = PressableThemeFill(
        fillColor: Colors.green,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PressableFill(
              theme: customTheme,
              onPressed: () {},
              child: const Text('Custom Fill'),
            ),
          ),
        ),
      );

      final fillWidget = tester.widget<PressableFill>(
        find.byType(PressableFill),
      );
      expect(fillWidget.theme, equals(customTheme));
    });

    testWidgets('Disabled pressable does not respond to taps', (tester) async {
      const pressed = false;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PressableScale(
              onPressed: null, // Disabled
              child: Text('Disabled'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Disabled'));
      expect(pressed, isFalse);
    });

    testWidgets('Press cancel callback works', (tester) async {
      var pressCanceled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PressableScale(
              onPressed: () {},
              onPressCanceled: () => pressCanceled = true,
              child: const Text('Cancel Test'),
            ),
          ),
        ),
      );

      // Start press but move away to cancel
      final gesture = await tester.startGesture(
        tester.getCenter(find.text('Cancel Test')),
      );
      await tester.pump();

      // Move away to cancel
      await gesture.moveBy(const Offset(1000, 1000));
      await tester.pump();

      await gesture.up();
      await tester.pumpAndSettle();

      expect(pressCanceled, isTrue);
    });
  });
}
