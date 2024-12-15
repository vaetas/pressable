# Pressable

Quickly add tap effects to your widgets.

## Usage

```dart
final widget = Pressable.opacity(
  onPressed: () {
    print('Opacity pressed');
  },
  child: const ExampleButton(title: 'Opacity'),
);
```

Supported effects:

* Ripple (InkWell)
* Scale
* Opacity
* Fill
* Custom builder

## Default Theme

You can use `DefaultPressableTheme` InheritedWidget to provide default `PressableTheme` to its
Widget subtree.

```dart
final widget = DefaultPressableTheme(
  fillTheme: PressableFillTheme(
    fillColor: Colors.green.withOpacity(0.2),
  ),
  child: Pressable.fill(
    onPressed: () {},
    child: const ExampleButton(title: 'Default theme'),
  ),
);
```

## Platform-specific Pressable Theme

To specify theme for each platform use `Pressable.platform()` constructor.

```dart
final widget = Pressable.platform(
  onPressed: () {},
  ios: const PressableTheme.opacity(),
  android: const PressableTheme.ripple(),
  child: const ExampleButton(title: 'Platform'),
);
```