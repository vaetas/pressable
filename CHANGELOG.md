## 0.9.0

* feat: rename all theme classes (use `PressableThemeScale` etc)
* feat: remove named constructor for pressables (use `PressableScale` etc)
* fix: remove freezed from internal implementation

## 0.8.0

* feat: support web platform
* feat: rename `PressablePlatform` param `macOS` to `macos` to align it with other platform
* fix: show different mouse cursor on hover
* chore: update example project to support all platforms

## 0.7.0

* feat: add `onPressStarted`, `onPressEnded`, and `onPressCanceled` callbacks for
  `Pressable.scale()` and `Pressable.opacity()` constructor.
* chore: update dependencies

## 0.6.0

* fix: update dependencies

## 0.5.0

* fix: update widget animation when properties change
* fix: animate back opacity animation on cancel
* chore: update dependencies

## 0.4.0

* fix: show full scale animation
* chore: update dependencies

## 0.3.1

* Fix `PressableBuilder` not calling `onPressed`.

## 0.3.0

* Add platform specific Pressable.
* Add DefaultPressableTheme inherited Widget.

## 0.2.0

* Extract theme data into separate classes.

## 0.1.0

* Initial release.
