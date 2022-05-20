import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pressable/pressable.dart';

/// Define default [Pressable] animation for each platform.
class PressablePlatform extends Pressable {
  const PressablePlatform({
    Key? key,
    required this.child,
    this.onPressed,
    this.onLongPressed,
    this.ios,
    this.android,
    this.macOS,
    this.windows,
    this.linux,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final PressableTheme? ios;
  final PressableTheme? android;
  final PressableTheme? macOS;
  final PressableTheme? windows;
  final PressableTheme? linux;

  @override
  State<PressablePlatform> createState() => _PressablePlatformState();
}

class _PressablePlatformState extends State<PressablePlatform> {
  @override
  Widget build(BuildContext context) {
    PressableTheme? pressable;
    if (Platform.isIOS) {
      pressable = widget.ios;
    }
    if (Platform.isAndroid) {
      pressable = widget.android;
    }
    if (Platform.isMacOS) {
      pressable = widget.macOS;
    }
    if (Platform.isWindows) {
      pressable = widget.windows;
    }
    if (Platform.isLinux) {
      pressable = widget.linux;
    }

    if (pressable == null) {
      throw ArgumentError(
        'PressableTheme for current platform is not provided.',
      );
    }

    return pressable.map(
      ripple: (theme) {
        return Pressable.ripple(
          onPressed: widget.onPressed,
          onLongPressed: widget.onLongPressed,
          theme: theme,
          child: widget.child,
        );
      },
      scale: (theme) {
        return Pressable.scale(
          onPressed: widget.onPressed,
          onLongPressed: widget.onLongPressed,
          theme: theme,
          child: widget.child,
        );
      },
      opacity: (theme) {
        return Pressable.opacity(
          onPressed: widget.onPressed,
          onLongPressed: widget.onLongPressed,
          theme: theme,
          child: widget.child,
        );
      },
      fill: (theme) {
        return Pressable.fill(
          onPressed: widget.onPressed,
          onLongPressed: widget.onLongPressed,
          theme: theme,
          child: widget.child,
        );
      },
    );
  }
}
