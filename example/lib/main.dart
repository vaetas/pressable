// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:pressable/pressable.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pressable',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _defaultTheme = const PressableThemeFill(fillColor: Colors.red);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pressable Example'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            PressableBuilder(
              key: ValueKey('pressable-builder'),
              onPressed: () {
                print('[HomeScreen.build] Builder pressed');
              },
              builder: (context, isPressed) {
                return AnimatedContainer(
                  width: 200,
                  height: 50,
                  duration: const Duration(milliseconds: 100),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: isPressed ? Colors.blue : const Color(0xFFd6d6d6),
                  ),
                  child: Center(
                    child: Text(
                      'Custom Builder',
                      style: TextStyle(
                        fontSize: 12,
                        color: isPressed ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            PressableRipple(
              key: ValueKey('pressable-ripple'),
              onPressed: () {
                print('[HomeScreen.build] Ripple pressed');
              },
              child: const ExampleButton(title: 'Ripple'),
            ),
            const SizedBox(height: 8),
            PressableScale(
              key: ValueKey('pressable-scale'),
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
            const SizedBox(height: 8),
            PressableOpacity(
              key: ValueKey('pressable-opacity'),
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
            const SizedBox(height: 8),
            PressableFill(
              key: ValueKey('pressable-fill'),
              onPressed: () {
                print('[HomeScreen.build] Fill pressed');
              },
              theme: const PressableThemeFill(fillColor: Colors.red),
              child: const ExampleButton(title: 'Fill'),
            ),
            const SizedBox(height: 8),
            PressablePlatform(
              key: ValueKey('pressable-platform'),
              onPressed: () {
                print('[HomeScreen.build] Platform pressed');
              },
              ios: const PressableThemeRipple(),
              android: const PressableThemeScale(),
              macos: const PressableThemeScale(),
              linux: const PressableThemeFill(),
              windows: const PressableThemeOpacity(),
              web: const PressableThemeScale(),
              child: const ExampleButton(title: 'Platform'),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 150,
              child: Stack(
                children: [
                  PressableScale(
                    key: ValueKey('pressable-scale-stack'),
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
            const SizedBox(height: 32),
            DefaultPressableTheme(
              fillTheme: _defaultTheme,
              child: PressableFill(
                key: ValueKey('pressable-fill-default'),
                onPressed: () {
                  print('[HomeScreen.build] Default theme pressed');
                },
                child: ExampleButton(
                  title:
                      'Default theme ${_defaultTheme.fillColor == Colors.red ? '(red)' : '(blue))'}',
                ),
              ),
            ),
            const SizedBox(height: 4),
            PressableOpacity(
              key: ValueKey('pressable-change-default-theme'),
              child: Text('Change default theme'),
              onPressed: () {
                setState(() {
                  if (_defaultTheme.fillColor == Colors.red) {
                    _defaultTheme = const PressableThemeFill(
                      fillColor: Colors.blue,
                    );
                  } else {
                    _defaultTheme = const PressableThemeFill(
                      fillColor: Colors.red,
                    );
                  }
                });
              },
            ),
          ],
        ),
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
      width: 225,
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
