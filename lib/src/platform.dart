import 'dart:io' as io show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:pressable/pressable.dart';

/// Define default [Pressable] animation for each platform.
class PressablePlatform extends Pressable {
  const PressablePlatform({
    super.key,
    required this.child,
    this.onPressed,
    this.onLongPressed,
    this.ios,
    this.android,
    this.macos,
    this.windows,
    this.linux,
    this.web,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final PressableTheme? ios;
  final PressableTheme? android;
  final PressableTheme? macos;
  final PressableTheme? windows;
  final PressableTheme? web;
  final PressableTheme? linux;

  @override
  State<PressablePlatform> createState() => _PressablePlatformState();
}

class _PressablePlatformState extends State<PressablePlatform> {
  @override
  Widget build(BuildContext context) {
    PressableTheme? pressable;
    if (kIsWeb) {
      assert(
        widget.web != null,
        'PressableTheme for web is not provided.',
      );
      pressable = widget.web;
    } else {
      if (io.Platform.isIOS) {
        assert(
          widget.ios != null,
          'PressableTheme for iOS is not provided.',
        );
        pressable = widget.ios;
      }
      if (io.Platform.isAndroid) {
        assert(
          widget.android != null,
          'PressableTheme for Android is not provided.',
        );
        pressable = widget.android;
      }
      if (io.Platform.isMacOS) {
        assert(
          widget.macos != null,
          'PressableTheme for macOS is not provided.',
        );
        pressable = widget.macos;
      }
      if (io.Platform.isWindows) {
        assert(
          widget.windows != null,
          'PressableTheme for Windows is not provided.',
        );
        pressable = widget.windows;
      }
      if (io.Platform.isLinux) {
        assert(
          widget.linux != null,
          'PressableTheme for Linux is not provided.',
        );
        pressable = widget.linux;
      }
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
