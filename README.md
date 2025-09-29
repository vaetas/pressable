# Pressable

Quickly add tap effects to your widgets.

## Usage

```dart
final widget = PressableOpacity(
  onPressed: () {
    print('Opacity pressed');
  },
  onLongPressStart: () {
    print('Long Press start');
  },
  onLongPressEnd: () {
    print('Long Press End')
  },
  child: const ExampleButton(title: 'Opacity'),
);
```

Supported effects:

* Scale
* Opacity
* Custom Builder

## Default Theme

You can use `DefaultPressableTheme` InheritedWidget to provide default `PressableTheme` to its
Widget subtree.

```dart
final widget = DefaultPressableTheme(
  scaleTheme: PressableThemeScale(
    scaleFactor: 0.5,
  ),
  child: PressableScale(
    onPressed: () {},
    child: const ExampleButton(title: 'Default theme'),
  ),
);
```
