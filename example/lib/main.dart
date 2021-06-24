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
              return ExampleButton(
                title: 'Builder',
              );
            },
          ),
          Pressable.ripple(
            onPressed: () {
              print('[HomeScreen.build] Ripple pressed');
            },
            child: ExampleButton(title: 'Ripple'),
          ),
          Pressable.scale(
            onPressed: () {
              print('[HomeScreen.build] Scale pressed');
            },
            child: ExampleButton(title: 'Scale'),
          ),
          Pressable.opacity(
            onPressed: () {
              print('[HomeScreen.build] Opacity pressed');
            },
            child: ExampleButton(title: 'Opacity'),
          ),
          Pressable.fill(
            onPressed: () {
              print('[HomeScreen.build] Fill pressed');
            },
            fillColor: Colors.red.withOpacity(0.2),
            child: ExampleButton(title: 'Fill'),
          ),
        ],
      ),
    );
  }
}

class ExampleButton extends StatelessWidget {
  const ExampleButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      color: Colors.black12,
      child: Row(
        children: [
          Text(title),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.bookmark),
          ),
        ],
      ),
    );
  }
}
