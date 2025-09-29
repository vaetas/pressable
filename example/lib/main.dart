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
  var _defaultOpacityTheme = const PressableThemeOpacity(opacityFactor: 0.2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pressable Example'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PressableBuilder(
                key: ValueKey('pressable-builder'),
                onPressed: () {
                  print('[HomeScreen.build] Builder pressed');
                },
                onLongPressStart: () {
                  print('[HomeScreen.build] Builder long pressed');
                },
                onLongPressEnd: () {
                  print('[HomeScreen.build] Builder long pressed end');
                },
                builder: (context, isPressed, isLongPressed) {
                  print(
                    '[HomeScreen.build] Builder build method: $isPressed, $isLongPressed',
                  );
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
                        // 'Custom Builder',
                        () {
                          if (!isPressed && !isLongPressed) {
                            return 'Custom Builder';
                          } else if (isPressed && !isLongPressed) {
                            return 'Custom Builder Pressed';
                          } else if (isLongPressed) {
                            return 'Custom Builder Long Pressed';
                          }
                          return 'Custom Builder';
                        }(),
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
              PressableScale(
                key: ValueKey('pressable-scale'),
                onPressed: () {
                  print('[PressableScale] Scale pressed');
                },
                onLongPressStart: () {
                  print('[PressableScale] Scale started');
                },
                onLongPressEnd: () {
                  print('[PressableScale] Scale ended');
                },
                theme: const PressableThemeScale(scaleFactor: 0.8),
                child: const ExampleButton(title: 'Scale'),
              ),
              const SizedBox(height: 8),
              PressableOpacity(
                key: ValueKey('pressable-opacity'),
                onPressed: () {
                  print('[PressableOpacity] Opacity pressed');
                },
                // onLongPressStart: () {
                //   print('[PressableOpacity] Opacity started');
                // },
                // onLongPressEnd: () {
                //   print('[PressableOpacity] Opacity ended');
                // },
                theme: const PressableThemeOpacity(
                  curve: Curves.easeOut,
                  opacityFactor: 0.4,
                ),
                child: const ExampleButton(title: 'Opacity'),
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
                opacityTheme: _defaultOpacityTheme,
                child: PressableOpacity(
                  key: ValueKey('pressable-fill-default'),
                  onPressed: () {
                    print('[HomeScreen.build] Default theme pressed');
                  },
                  child: ExampleButton(
                    title:
                        'Default theme ${_defaultOpacityTheme.opacityFactor}',
                  ),
                ),
              ),
              const SizedBox(height: 8),
              DefaultPressableTheme(
                opacityTheme: _defaultOpacityTheme,
                child: PressableOpacity(
                  key: ValueKey('pressable-scale-default'),
                  onPressed: () {
                    print('[HomeScreen.build] Default theme pressed');
                    setState(() {
                      _defaultOpacityTheme = PressableThemeOpacity(
                        opacityFactor:
                            _defaultOpacityTheme.opacityFactor == 0.2
                                ? 0.6
                                : 0.2,
                      );
                    });
                  },
                  child: Text(
                    'Default theme ${_defaultOpacityTheme.opacityFactor}',
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  print('[HomeScreen.build] ElevatedButton pressed');
                },
                onLongPress: () {
                  print('[HomeScreen.build] ElevatedButton long pressed');
                },
                child: const Text('ElevatedButton'),
              ),
              const SizedBox(height: 32),
            ],
          ),
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
          IconButton(
            onPressed: () {
              print('[ExampleButton] Bookmark pressed');
            },
            icon: const Icon(Icons.bookmark),
          ),
        ],
      ),
    );
  }
}
