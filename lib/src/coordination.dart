import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Configuration for pointer coordination behavior
class PressableCoordinationConfig {
  const PressableCoordinationConfig({
    this.enabled = true,
    this.debounceTimeout = const Duration(milliseconds: 50),
    this.stuckStateTimeout = const Duration(seconds: 3),
    this.allowSameTypeSimultaneous = false,
    this.debugLogging = false,
  });

  /// Whether pointer coordination is enabled
  final bool enabled;

  /// Minimum time between different pointer type activations
  final Duration debounceTimeout;

  /// Maximum time a widget can stay in pressed state before auto-reset
  final Duration stuckStateTimeout;

  /// Whether to allow simultaneous presses of the same pointer type
  final bool allowSameTypeSimultaneous;

  /// Whether to enable debug logging for gesture conflicts
  final bool debugLogging;

  PressableCoordinationConfig copyWith({
    bool? enabled,
    Duration? debounceTimeout,
    Duration? stuckStateTimeout,
    bool? allowSameTypeSimultaneous,
    bool? debugLogging,
  }) {
    return PressableCoordinationConfig(
      enabled: enabled ?? this.enabled,
      debounceTimeout: debounceTimeout ?? this.debounceTimeout,
      stuckStateTimeout: stuckStateTimeout ?? this.stuckStateTimeout,
      allowSameTypeSimultaneous: 
          allowSameTypeSimultaneous ?? this.allowSameTypeSimultaneous,
      debugLogging: debugLogging ?? this.debugLogging,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PressableCoordinationConfig &&
        other.enabled == enabled &&
        other.debounceTimeout == debounceTimeout &&
        other.stuckStateTimeout == stuckStateTimeout &&
        other.allowSameTypeSimultaneous == allowSameTypeSimultaneous &&
        other.debugLogging == debugLogging;
  }

  @override
  int get hashCode => Object.hash(
        enabled,
        debounceTimeout,
        stuckStateTimeout,
        allowSameTypeSimultaneous,
        debugLogging,
      );
}

/// Tracks information about an active press
class _ActivePress {
  _ActivePress({
    required this.widgetKey,
    required this.pointerKind,
    required this.startTime,
  });

  final GlobalKey widgetKey;
  final PointerDeviceKind pointerKind;
  final DateTime startTime;
}

/// Global coordinator for managing pointer interactions across pressable
/// widgets
class PressableCoordinator {
  PressableCoordinator._();

  static final PressableCoordinator _instance = PressableCoordinator._();
  static PressableCoordinator get instance => _instance;

  final Map<GlobalKey, _ActivePress> _activePresses = {};
  final Map<PointerDeviceKind, DateTime> _lastPointerTypeActivation = {};
  Timer? _cleanupTimer;

  PressableCoordinationConfig _config = const PressableCoordinationConfig();

  /// Update the global configuration
  void updateConfig(PressableCoordinationConfig config) {
    _config = config;
    _startCleanupTimer();
  }

  /// Get the current configuration
  PressableCoordinationConfig get config => _config;

  /// Check if a new press should be allowed
  bool canStartPress({
    required GlobalKey widgetKey,
    required PointerDeviceKind pointerKind,
  }) {
    if (!_config.enabled) return true;

    final now = DateTime.now();

    // Check if this specific widget is already pressed
    if (_activePresses.containsKey(widgetKey)) {
      _debugLog('Press blocked: Widget $widgetKey already active');
      return false;
    }

    // Check debounce timeout for different pointer types
    final lastActivation = _lastPointerTypeActivation[pointerKind];
    if (lastActivation != null) {
      final timeSinceLastActivation = now.difference(lastActivation);
      if (timeSinceLastActivation < _config.debounceTimeout) {
        _debugLog('Press blocked: Debounce timeout for $pointerKind '
            '(${timeSinceLastActivation.inMilliseconds}ms < '
            '${_config.debounceTimeout.inMilliseconds}ms)');
        return false;
      }
    }

    // Check if we should allow simultaneous presses of different types
    if (_activePresses.isNotEmpty) {
      final activePointerTypes = 
          _activePresses.values.map((p) => p.pointerKind).toSet();
      
      if (activePointerTypes.contains(pointerKind)) {
        if (!_config.allowSameTypeSimultaneous) {
          _debugLog('Press blocked: Same pointer type $pointerKind '
              'already active');
          return false;
        }
      } else {
        // Different pointer type is active, check debounce
        for (final activePointerType in activePointerTypes) {
          final lastActivation = _lastPointerTypeActivation[activePointerType];
          if (lastActivation != null) {
            final timeSinceLastActivation = now.difference(lastActivation);
            if (timeSinceLastActivation < _config.debounceTimeout) {
              _debugLog('Press blocked: Different pointer type '
                  '$activePointerType recently active '
                  '(${timeSinceLastActivation.inMilliseconds}ms < '
                  '${_config.debounceTimeout.inMilliseconds}ms)');
              return false;
            }
          }
        }
      }
    }

    return true;
  }

  /// Register a new press
  void startPress({
    required GlobalKey widgetKey,
    required PointerDeviceKind pointerKind,
  }) {
    if (!_config.enabled) return;

    final now = DateTime.now();
    
    _activePresses[widgetKey] = _ActivePress(
      widgetKey: widgetKey,
      pointerKind: pointerKind,
      startTime: now,
    );
    
    _lastPointerTypeActivation[pointerKind] = now;
    
    _debugLog('Press started: Widget $widgetKey with $pointerKind');
    _startCleanupTimer();
  }

  /// End a press
  void endPress(GlobalKey widgetKey) {
    if (!_config.enabled) return;

    final activePress = _activePresses.remove(widgetKey);
    if (activePress != null) {
      _debugLog('Press ended: Widget $widgetKey (${activePress.pointerKind})');
    }

    if (_activePresses.isEmpty) {
      _stopCleanupTimer();
    }
  }

  /// Force end all presses (emergency cleanup)
  void forceEndAllPresses() {
    _debugLog('Force ending all presses (${_activePresses.length} active)');
    _activePresses.clear();
    _stopCleanupTimer();
  }

  /// Get stuck presses that have exceeded the timeout
  List<GlobalKey> getStuckPresses() {
    if (!_config.enabled) return [];

    final now = DateTime.now();
    final stuckKeys = <GlobalKey>[];

    for (final entry in _activePresses.entries) {
      final timeSinceStart = now.difference(entry.value.startTime);
      if (timeSinceStart > _config.stuckStateTimeout) {
        stuckKeys.add(entry.key);
      }
    }

    return stuckKeys;
  }

  /// Start the cleanup timer for stuck states
  void _startCleanupTimer() {
    _stopCleanupTimer();
    
    if (_activePresses.isNotEmpty) {
      _cleanupTimer = Timer.periodic(
        Duration(milliseconds: _config.stuckStateTimeout.inMilliseconds ~/ 2),
        (_) => _cleanupStuckPresses(),
      );
    }
  }

  /// Stop the cleanup timer
  void _stopCleanupTimer() {
    _cleanupTimer?.cancel();
    _cleanupTimer = null;
  }

  /// Clean up stuck presses
  void _cleanupStuckPresses() {
    final stuckKeys = getStuckPresses();
    for (final key in stuckKeys) {
      _debugLog('Cleaning up stuck press: Widget $key');
      _activePresses.remove(key);
    }

    if (_activePresses.isEmpty) {
      _stopCleanupTimer();
    }
  }

  /// Debug logging
  void _debugLog(String message) {
    if (_config.debugLogging && kDebugMode) {
      debugPrint('[PressableCoordinator] $message');
    }
  }

  /// Get debug information
  Map<String, dynamic> getDebugInfo() {
    return {
      'config': _config,
      'activePresses': _activePresses.length,
      'activePointerTypes': _activePresses.values
          .map((p) => p.pointerKind.toString()).toList(),
      'lastActivations': _lastPointerTypeActivation.map(
        (key, value) => MapEntry(key.toString(), value.toIso8601String()),
      ),
    };
  }
}

// Note: Extension for TapDownDetails is defined in base.dart to avoid conflicts
