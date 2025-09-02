import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

/// Utility class for detecting pointer types with better heuristics
class PointerDetector {
  PointerDetector._();

  /// Detect pointer kind from TapDownDetails with improved heuristics
  static PointerDeviceKind detectPointerKind(TapDownDetails details) {
    // If the kind is already provided, use it
    if (details.kind != null) {
      return details.kind!;
    }

    // Platform-based heuristics
    if (kIsWeb) {
      return _detectWebPointerKind(details);
    }

    if (Platform.isAndroid || Platform.isIOS) {
      return _detectMobilePointerKind(details);
    }

    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      return _detectDesktopPointerKind(details);
    }

    // Fallback to touch
    return PointerDeviceKind.touch;
  }

  /// Detect pointer kind for web platforms
  static PointerDeviceKind _detectWebPointerKind(TapDownDetails details) {
    // On web, we can use some heuristics:
    // - Mouse events typically have higher precision
    // - Touch events may have different pressure characteristics
    
    // Check if the interaction looks like a mouse (precise positioning)
    final localPosition = details.localPosition;
    if (localPosition.dx % 1 == 0 && localPosition.dy % 1 == 0) {
      // Pixel-perfect positioning suggests mouse
      return PointerDeviceKind.mouse;
    }

    // Default to touch for web
    return PointerDeviceKind.touch;
  }

  /// Detect pointer kind for mobile platforms
  static PointerDeviceKind _detectMobilePointerKind(TapDownDetails details) {
    // On mobile platforms, we primarily deal with touch and stylus
    // TapDownDetails doesn't expose pressure/size directly, so we use heuristics
    
    // For mobile, we'll default to touch since that's most common
    // Advanced stylus detection would require listening to raw pointer events
    // which is beyond the scope of this coordination fix
    
    // Default to touch for mobile
    return PointerDeviceKind.touch;
  }

  /// Detect pointer kind for desktop platforms
  static PointerDeviceKind _detectDesktopPointerKind(TapDownDetails details) {
    // On desktop, we need to distinguish between mouse and touch
    // TapDownDetails has limited information, so we use basic heuristics
    
    // Check positioning precision - mouse tends to be more precise
    final localPosition = details.localPosition;
    final hasSubPixelPrecision = 
        localPosition.dx % 1 != 0 || localPosition.dy % 1 != 0;
    
    if (!hasSubPixelPrecision) {
      // Pixel-perfect positioning suggests mouse
      return PointerDeviceKind.mouse;
    }

    // For desktop platforms, we'll assume mouse as the primary input
    // Touch detection on desktop would require more sophisticated analysis
    // of the raw pointer events, which is beyond this coordination fix
    
    // Default to mouse for desktop platforms
    return PointerDeviceKind.mouse;
  }

  /// Get a human-readable name for a pointer kind
  static String getPointerKindName(PointerDeviceKind kind) {
    switch (kind) {
      case PointerDeviceKind.touch:
        return 'Touch';
      case PointerDeviceKind.mouse:
        return 'Mouse';
      case PointerDeviceKind.stylus:
        return 'Stylus';
      case PointerDeviceKind.invertedStylus:
        return 'Inverted Stylus';
      case PointerDeviceKind.trackpad:
        return 'Trackpad';
      case PointerDeviceKind.unknown:
        return 'Unknown';
    }
  }

  /// Check if two pointer kinds are compatible (can be used simultaneously)
  static bool arePointerKindsCompatible(
    PointerDeviceKind kind1,
    PointerDeviceKind kind2,
  ) {
    // Same kind is always compatible if explicitly allowed
    if (kind1 == kind2) return false; // Default to not allowing same type

    // Define compatibility rules
    const compatiblePairs = <Set<PointerDeviceKind>>{
      // Mouse and stylus can potentially coexist
      {PointerDeviceKind.mouse, PointerDeviceKind.stylus},
      // Touch and stylus can coexist (drawing apps)
      {PointerDeviceKind.touch, PointerDeviceKind.stylus},
    };

    return compatiblePairs.any((pair) => 
      pair.contains(kind1) && pair.contains(kind2));
  }
}
