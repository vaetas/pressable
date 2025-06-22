// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:pressable/pressable.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example')),
      body: Column(
        children: [
          PressableBuilder(
            onPressed: () {
              print('[HomeScreen.build] Builder pressed');
            },
            builder: (context, isPressed) {
              return AnimatedContainer(
                width: 200,
                height: 50,
                color: isPressed ? Colors.blue : const Color(0xFFd6d6d6),
                duration: const Duration(milliseconds: 100),
                child: const Center(child: Text('Custom Builder')),
              );
            },
          ),
          PressableRipple(
            onPressed: () {
              print('[HomeScreen.build] Ripple pressed');
            },
            child: const ExampleButton(title: 'Ripple'),
          ),
          PressableScale(
            onPressed: () {
              print('[HomeScreen.build] Scale pressed');
            },
            onPressStarted: () {
              print('[HomeScreen.build] Scale started');
            },
            onPressEnded: () {
              print('[HomeScreen.build] Scale ended');
            },
            onPressCanceled: () {
              print('[HomeScreen.build] Scale canceled');
            },
            theme: const PressableThemeScale(scaleFactor: 0.8),
            child: const ExampleButton(title: 'Scale'),
          ),
          PressableOpacity(
            onPressed: () {
              print('[HomeScreen.build] Opacity pressed');
            },
            onPressStarted: () {
              print('[HomeScreen.build] Opacity started');
            },
            theme: const PressableThemeOpacity(
              curve: Curves.easeOut,
              opacityFactor: 0.4,
            ),
            child: const ExampleButton(title: 'Opacity'),
          ),
          PressableFill(
            onPressed: () {
              print('[HomeScreen.build] Fill pressed');
            },
            theme: const PressableThemeFill(fillColor: Colors.red),
            child: const ExampleButton(title: 'Fill'),
          ),
          PressablePlatform(
            onPressed: () {
              print('[HomeScreen.build] Platform pressed');
            },
            ios: const PressableThemeRipple(),
            android: const PressableThemeRipple(),
            macos: const PressableThemeRipple(),
            linux: const PressableThemeRipple(),
            windows: const PressableThemeRipple(),
            web: const PressableThemeRipple(),
            child: const ExampleButton(title: 'Platform'),
          ),
          SizedBox(
            width: 150,
            child: Stack(
              children: [
                PressableScale(
                  onPressed: () {
                    print('[HomeScreen.build] Scale pressed');
                  },
                  child: Container(
                    width: 150,
                    height: 50,
                    color: Colors.black12,
                    child: const Center(child: Text('Test')),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark),
                  ),
                ),
              ],
            ),
          ),
          DefaultPressableTheme(
            fillTheme: const PressableThemeFill(fillColor: Colors.green),
            child: PressableFill(
              onPressed: () {
                print('[HomeScreen.build] Default theme pressed');
              },
              child: const ExampleButton(title: 'Default theme'),
            ),
          ),
        ],
      ),
    );
  }
}

class ExampleButton extends StatelessWidget {
  const ExampleButton({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      color: Colors.black12,
      child: Row(
        children: [
          Text(title),
          const Spacer(),
          IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark)),
        ],
      ),
    );
  }
}
