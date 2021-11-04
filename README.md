# Pressable

Quickly add tap effects to your widgets.

*Work in progress. Widgets may change at any time.*

```dart
Pressable.opacity(
  onPressed: () {
    print('Opacity pressed');
  },
  child: const ExampleButton(title: 'Opacity'),
)
```

Supported effects:

* Ripple (InkWell)
* Scale
* Opacity
* Fill
* Custom builder