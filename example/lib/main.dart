import 'package:flutter/material.dart';
import 'package:pressable/pressable.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example')),
      body: Column(
        children: [
          Pressable.builder(
            onPressed: () {
              print('[HomeScreen.build] Builder pressed');
            },
            builder: (context, isPressed) {
              return Container(
                padding: const EdgeInsets.all(10),
                color: isPressed ? Colors.red : Colors.black,
                child: const Text('Builder'),
              );
            },
          ),
          Pressable.ripple(
            onPressed: () {
              print('[HomeScreen.build] Ripple pressed');
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const Text('Ripple'),
            ),
          ),
          Pressable.scale(
            onPressed: () {
              print('[HomeScreen.build] Scale pressed');
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const Text('Scale'),
            ),
          ),
          Pressable.opacity(
            onPressed: () {
              print('[HomeScreen.build] Opacity pressed');
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const Text('Opacity'),
            ),
          ),
          Pressable.fill(
            onPressed: () {
              print('[HomeScreen.build] Fill pressed');
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              width: 300,
              child: const Text('Fill'),
            ),
          ),
        ],
      ),
    );
  }
}
