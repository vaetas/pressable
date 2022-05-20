// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PressableTheme {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Color? splashColor, Color? highlightColor,
            BorderRadius? borderRadius)
        ripple,
    required TResult Function(double scaleFactor, Duration duration,
            Curve curve, Curve reverseCurve)
        scale,
    required TResult Function(Duration duration, double opacityFactor,
            Curve curve, Curve reverseCurve)
        opacity,
    required TResult Function(Color fillColor, BorderRadius borderRadius) fill,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Color? splashColor, Color? highlightColor,
            BorderRadius? borderRadius)?
        ripple,
    TResult Function(double scaleFactor, Duration duration, Curve curve,
            Curve reverseCurve)?
        scale,
    TResult Function(Duration duration, double opacityFactor, Curve curve,
            Curve reverseCurve)?
        opacity,
    TResult Function(Color fillColor, BorderRadius borderRadius)? fill,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Color? splashColor, Color? highlightColor,
            BorderRadius? borderRadius)?
        ripple,
    TResult Function(double scaleFactor, Duration duration, Curve curve,
            Curve reverseCurve)?
        scale,
    TResult Function(Duration duration, double opacityFactor, Curve curve,
            Curve reverseCurve)?
        opacity,
    TResult Function(Color fillColor, BorderRadius borderRadius)? fill,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PressableRippleTheme value) ripple,
    required TResult Function(PressableScaleTheme value) scale,
    required TResult Function(PressableOpacityTheme value) opacity,
    required TResult Function(PressableFillTheme value) fill,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PressableRippleTheme value)? ripple,
    TResult Function(PressableScaleTheme value)? scale,
    TResult Function(PressableOpacityTheme value)? opacity,
    TResult Function(PressableFillTheme value)? fill,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PressableRippleTheme value)? ripple,
    TResult Function(PressableScaleTheme value)? scale,
    TResult Function(PressableOpacityTheme value)? opacity,
    TResult Function(PressableFillTheme value)? fill,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PressableThemeCopyWith<$Res> {
  factory $PressableThemeCopyWith(
          PressableTheme value, $Res Function(PressableTheme) then) =
      _$PressableThemeCopyWithImpl<$Res>;
}

/// @nodoc
class _$PressableThemeCopyWithImpl<$Res>
    implements $PressableThemeCopyWith<$Res> {
  _$PressableThemeCopyWithImpl(this._value, this._then);

  final PressableTheme _value;
  // ignore: unused_field
  final $Res Function(PressableTheme) _then;
}

/// @nodoc
abstract class _$$PressableRippleThemeCopyWith<$Res> {
  factory _$$PressableRippleThemeCopyWith(_$PressableRippleTheme value,
          $Res Function(_$PressableRippleTheme) then) =
      __$$PressableRippleThemeCopyWithImpl<$Res>;
  $Res call(
      {Color? splashColor, Color? highlightColor, BorderRadius? borderRadius});
}

/// @nodoc
class __$$PressableRippleThemeCopyWithImpl<$Res>
    extends _$PressableThemeCopyWithImpl<$Res>
    implements _$$PressableRippleThemeCopyWith<$Res> {
  __$$PressableRippleThemeCopyWithImpl(_$PressableRippleTheme _value,
      $Res Function(_$PressableRippleTheme) _then)
      : super(_value, (v) => _then(v as _$PressableRippleTheme));

  @override
  _$PressableRippleTheme get _value => super._value as _$PressableRippleTheme;

  @override
  $Res call({
    Object? splashColor = freezed,
    Object? highlightColor = freezed,
    Object? borderRadius = freezed,
  }) {
    return _then(_$PressableRippleTheme(
      splashColor: splashColor == freezed
          ? _value.splashColor
          : splashColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      highlightColor: highlightColor == freezed
          ? _value.highlightColor
          : highlightColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      borderRadius: borderRadius == freezed
          ? _value.borderRadius
          : borderRadius // ignore: cast_nullable_to_non_nullable
              as BorderRadius?,
    ));
  }
}

/// @nodoc

class _$PressableRippleTheme implements PressableRippleTheme {
  const _$PressableRippleTheme(
      {this.splashColor, this.highlightColor, this.borderRadius});

  @override
  final Color? splashColor;
  @override
  final Color? highlightColor;
  @override
  final BorderRadius? borderRadius;

  @override
  String toString() {
    return 'PressableTheme.ripple(splashColor: $splashColor, highlightColor: $highlightColor, borderRadius: $borderRadius)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PressableRippleTheme &&
            const DeepCollectionEquality()
                .equals(other.splashColor, splashColor) &&
            const DeepCollectionEquality()
                .equals(other.highlightColor, highlightColor) &&
            const DeepCollectionEquality()
                .equals(other.borderRadius, borderRadius));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(splashColor),
      const DeepCollectionEquality().hash(highlightColor),
      const DeepCollectionEquality().hash(borderRadius));

  @JsonKey(ignore: true)
  @override
  _$$PressableRippleThemeCopyWith<_$PressableRippleTheme> get copyWith =>
      __$$PressableRippleThemeCopyWithImpl<_$PressableRippleTheme>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Color? splashColor, Color? highlightColor,
            BorderRadius? borderRadius)
        ripple,
    required TResult Function(double scaleFactor, Duration duration,
            Curve curve, Curve reverseCurve)
        scale,
    required TResult Function(Duration duration, double opacityFactor,
            Curve curve, Curve reverseCurve)
        opacity,
    required TResult Function(Color fillColor, BorderRadius borderRadius) fill,
  }) {
    return ripple(splashColor, highlightColor, borderRadius);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Color? splashColor, Color? highlightColor,
            BorderRadius? borderRadius)?
        ripple,
    TResult Function(double scaleFactor, Duration duration, Curve curve,
            Curve reverseCurve)?
        scale,
    TResult Function(Duration duration, double opacityFactor, Curve curve,
            Curve reverseCurve)?
        opacity,
    TResult Function(Color fillColor, BorderRadius borderRadius)? fill,
  }) {
    return ripple?.call(splashColor, highlightColor, borderRadius);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Color? splashColor, Color? highlightColor,
            BorderRadius? borderRadius)?
        ripple,
    TResult Function(double scaleFactor, Duration duration, Curve curve,
            Curve reverseCurve)?
        scale,
    TResult Function(Duration duration, double opacityFactor, Curve curve,
            Curve reverseCurve)?
        opacity,
    TResult Function(Color fillColor, BorderRadius borderRadius)? fill,
    required TResult orElse(),
  }) {
    if (ripple != null) {
      return ripple(splashColor, highlightColor, borderRadius);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PressableRippleTheme value) ripple,
    required TResult Function(PressableScaleTheme value) scale,
    required TResult Function(PressableOpacityTheme value) opacity,
    required TResult Function(PressableFillTheme value) fill,
  }) {
    return ripple(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PressableRippleTheme value)? ripple,
    TResult Function(PressableScaleTheme value)? scale,
    TResult Function(PressableOpacityTheme value)? opacity,
    TResult Function(PressableFillTheme value)? fill,
  }) {
    return ripple?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PressableRippleTheme value)? ripple,
    TResult Function(PressableScaleTheme value)? scale,
    TResult Function(PressableOpacityTheme value)? opacity,
    TResult Function(PressableFillTheme value)? fill,
    required TResult orElse(),
  }) {
    if (ripple != null) {
      return ripple(this);
    }
    return orElse();
  }
}

abstract class PressableRippleTheme implements PressableTheme {
  const factory PressableRippleTheme(
      {final Color? splashColor,
      final Color? highlightColor,
      final BorderRadius? borderRadius}) = _$PressableRippleTheme;

  Color? get splashColor => throw _privateConstructorUsedError;
  Color? get highlightColor => throw _privateConstructorUsedError;
  BorderRadius? get borderRadius => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$PressableRippleThemeCopyWith<_$PressableRippleTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PressableScaleThemeCopyWith<$Res> {
  factory _$$PressableScaleThemeCopyWith(_$PressableScaleTheme value,
          $Res Function(_$PressableScaleTheme) then) =
      __$$PressableScaleThemeCopyWithImpl<$Res>;
  $Res call(
      {double scaleFactor, Duration duration, Curve curve, Curve reverseCurve});
}

/// @nodoc
class __$$PressableScaleThemeCopyWithImpl<$Res>
    extends _$PressableThemeCopyWithImpl<$Res>
    implements _$$PressableScaleThemeCopyWith<$Res> {
  __$$PressableScaleThemeCopyWithImpl(
      _$PressableScaleTheme _value, $Res Function(_$PressableScaleTheme) _then)
      : super(_value, (v) => _then(v as _$PressableScaleTheme));

  @override
  _$PressableScaleTheme get _value => super._value as _$PressableScaleTheme;

  @override
  $Res call({
    Object? scaleFactor = freezed,
    Object? duration = freezed,
    Object? curve = freezed,
    Object? reverseCurve = freezed,
  }) {
    return _then(_$PressableScaleTheme(
      scaleFactor: scaleFactor == freezed
          ? _value.scaleFactor
          : scaleFactor // ignore: cast_nullable_to_non_nullable
              as double,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      curve: curve == freezed
          ? _value.curve
          : curve // ignore: cast_nullable_to_non_nullable
              as Curve,
      reverseCurve: reverseCurve == freezed
          ? _value.reverseCurve
          : reverseCurve // ignore: cast_nullable_to_non_nullable
              as Curve,
    ));
  }
}

/// @nodoc

class _$PressableScaleTheme implements PressableScaleTheme {
  const _$PressableScaleTheme(
      {this.scaleFactor = 0.8,
      this.duration = const Duration(milliseconds: 100),
      this.curve = Curves.easeInOut,
      this.reverseCurve = Curves.easeInOut});

  @override
  @JsonKey()
  final double scaleFactor;
  @override
  @JsonKey()
  final Duration duration;
  @override
  @JsonKey()
  final Curve curve;
  @override
  @JsonKey()
  final Curve reverseCurve;

  @override
  String toString() {
    return 'PressableTheme.scale(scaleFactor: $scaleFactor, duration: $duration, curve: $curve, reverseCurve: $reverseCurve)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PressableScaleTheme &&
            const DeepCollectionEquality()
                .equals(other.scaleFactor, scaleFactor) &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality().equals(other.curve, curve) &&
            const DeepCollectionEquality()
                .equals(other.reverseCurve, reverseCurve));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(scaleFactor),
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(curve),
      const DeepCollectionEquality().hash(reverseCurve));

  @JsonKey(ignore: true)
  @override
  _$$PressableScaleThemeCopyWith<_$PressableScaleTheme> get copyWith =>
      __$$PressableScaleThemeCopyWithImpl<_$PressableScaleTheme>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Color? splashColor, Color? highlightColor,
            BorderRadius? borderRadius)
        ripple,
    required TResult Function(double scaleFactor, Duration duration,
            Curve curve, Curve reverseCurve)
        scale,
    required TResult Function(Duration duration, double opacityFactor,
            Curve curve, Curve reverseCurve)
        opacity,
    required TResult Function(Color fillColor, BorderRadius borderRadius) fill,
  }) {
    return scale(scaleFactor, duration, curve, reverseCurve);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Color? splashColor, Color? highlightColor,
            BorderRadius? borderRadius)?
        ripple,
    TResult Function(double scaleFactor, Duration duration, Curve curve,
            Curve reverseCurve)?
        scale,
    TResult Function(Duration duration, double opacityFactor, Curve curve,
            Curve reverseCurve)?
        opacity,
    TResult Function(Color fillColor, BorderRadius borderRadius)? fill,
  }) {
    return scale?.call(scaleFactor, duration, curve, reverseCurve);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Color? splashColor, Color? highlightColor,
            BorderRadius? borderRadius)?
        ripple,
    TResult Function(double scaleFactor, Duration duration, Curve curve,
            Curve reverseCurve)?
        scale,
    TResult Function(Duration duration, double opacityFactor, Curve curve,
            Curve reverseCurve)?
        opacity,
    TResult Function(Color fillColor, BorderRadius borderRadius)? fill,
    required TResult orElse(),
  }) {
    if (scale != null) {
      return scale(scaleFactor, duration, curve, reverseCurve);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PressableRippleTheme value) ripple,
    required TResult Function(PressableScaleTheme value) scale,
    required TResult Function(PressableOpacityTheme value) opacity,
    required TResult Function(PressableFillTheme value) fill,
  }) {
    return scale(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PressableRippleTheme value)? ripple,
    TResult Function(PressableScaleTheme value)? scale,
    TResult Function(PressableOpacityTheme value)? opacity,
    TResult Function(PressableFillTheme value)? fill,
  }) {
    return scale?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PressableRippleTheme value)? ripple,
    TResult Function(PressableScaleTheme value)? scale,
    TResult Function(PressableOpacityTheme value)? opacity,
    TResult Function(PressableFillTheme value)? fill,
    required TResult orElse(),
  }) {
    if (scale != null) {
      return scale(this);
    }
    return orElse();
  }
}

abstract class PressableScaleTheme implements PressableTheme {
  const factory PressableScaleTheme(
      {final double scaleFactor,
      final Duration duration,
      final Curve curve,
      final Curve reverseCurve}) = _$PressableScaleTheme;

  double get scaleFactor => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  Curve get curve => throw _privateConstructorUsedError;
  Curve get reverseCurve => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$PressableScaleThemeCopyWith<_$PressableScaleTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PressableOpacityThemeCopyWith<$Res> {
  factory _$$PressableOpacityThemeCopyWith(_$PressableOpacityTheme value,
          $Res Function(_$PressableOpacityTheme) then) =
      __$$PressableOpacityThemeCopyWithImpl<$Res>;
  $Res call(
      {Duration duration,
      double opacityFactor,
      Curve curve,
      Curve reverseCurve});
}

/// @nodoc
class __$$PressableOpacityThemeCopyWithImpl<$Res>
    extends _$PressableThemeCopyWithImpl<$Res>
    implements _$$PressableOpacityThemeCopyWith<$Res> {
  __$$PressableOpacityThemeCopyWithImpl(_$PressableOpacityTheme _value,
      $Res Function(_$PressableOpacityTheme) _then)
      : super(_value, (v) => _then(v as _$PressableOpacityTheme));

  @override
  _$PressableOpacityTheme get _value => super._value as _$PressableOpacityTheme;

  @override
  $Res call({
    Object? duration = freezed,
    Object? opacityFactor = freezed,
    Object? curve = freezed,
    Object? reverseCurve = freezed,
  }) {
    return _then(_$PressableOpacityTheme(
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      opacityFactor: opacityFactor == freezed
          ? _value.opacityFactor
          : opacityFactor // ignore: cast_nullable_to_non_nullable
              as double,
      curve: curve == freezed
          ? _value.curve
          : curve // ignore: cast_nullable_to_non_nullable
              as Curve,
      reverseCurve: reverseCurve == freezed
          ? _value.reverseCurve
          : reverseCurve // ignore: cast_nullable_to_non_nullable
              as Curve,
    ));
  }
}

/// @nodoc

class _$PressableOpacityTheme implements PressableOpacityTheme {
  const _$PressableOpacityTheme(
      {this.duration = const Duration(milliseconds: 100),
      this.opacityFactor = 0.6,
      this.curve = Curves.easeInOut,
      this.reverseCurve = Curves.easeInOut});

  @override
  @JsonKey()
  final Duration duration;
  @override
  @JsonKey()
  final double opacityFactor;
  @override
  @JsonKey()
  final Curve curve;
  @override
  @JsonKey()
  final Curve reverseCurve;

  @override
  String toString() {
    return 'PressableTheme.opacity(duration: $duration, opacityFactor: $opacityFactor, curve: $curve, reverseCurve: $reverseCurve)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PressableOpacityTheme &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality()
                .equals(other.opacityFactor, opacityFactor) &&
            const DeepCollectionEquality().equals(other.curve, curve) &&
            const DeepCollectionEquality()
                .equals(other.reverseCurve, reverseCurve));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(opacityFactor),
      const DeepCollectionEquality().hash(curve),
      const DeepCollectionEquality().hash(reverseCurve));

  @JsonKey(ignore: true)
  @override
  _$$PressableOpacityThemeCopyWith<_$PressableOpacityTheme> get copyWith =>
      __$$PressableOpacityThemeCopyWithImpl<_$PressableOpacityTheme>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Color? splashColor, Color? highlightColor,
            BorderRadius? borderRadius)
        ripple,
    required TResult Function(double scaleFactor, Duration duration,
            Curve curve, Curve reverseCurve)
        scale,
    required TResult Function(Duration duration, double opacityFactor,
            Curve curve, Curve reverseCurve)
        opacity,
    required TResult Function(Color fillColor, BorderRadius borderRadius) fill,
  }) {
    return opacity(duration, opacityFactor, curve, reverseCurve);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Color? splashColor, Color? highlightColor,
            BorderRadius? borderRadius)?
        ripple,
    TResult Function(double scaleFactor, Duration duration, Curve curve,
            Curve reverseCurve)?
        scale,
    TResult Function(Duration duration, double opacityFactor, Curve curve,
            Curve reverseCurve)?
        opacity,
    TResult Function(Color fillColor, BorderRadius borderRadius)? fill,
  }) {
    return opacity?.call(duration, opacityFactor, curve, reverseCurve);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Color? splashColor, Color? highlightColor,
            BorderRadius? borderRadius)?
        ripple,
    TResult Function(double scaleFactor, Duration duration, Curve curve,
            Curve reverseCurve)?
        scale,
    TResult Function(Duration duration, double opacityFactor, Curve curve,
            Curve reverseCurve)?
        opacity,
    TResult Function(Color fillColor, BorderRadius borderRadius)? fill,
    required TResult orElse(),
  }) {
    if (opacity != null) {
      return opacity(duration, opacityFactor, curve, reverseCurve);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PressableRippleTheme value) ripple,
    required TResult Function(PressableScaleTheme value) scale,
    required TResult Function(PressableOpacityTheme value) opacity,
    required TResult Function(PressableFillTheme value) fill,
  }) {
    return opacity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PressableRippleTheme value)? ripple,
    TResult Function(PressableScaleTheme value)? scale,
    TResult Function(PressableOpacityTheme value)? opacity,
    TResult Function(PressableFillTheme value)? fill,
  }) {
    return opacity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PressableRippleTheme value)? ripple,
    TResult Function(PressableScaleTheme value)? scale,
    TResult Function(PressableOpacityTheme value)? opacity,
    TResult Function(PressableFillTheme value)? fill,
    required TResult orElse(),
  }) {
    if (opacity != null) {
      return opacity(this);
    }
    return orElse();
  }
}

abstract class PressableOpacityTheme implements PressableTheme {
  const factory PressableOpacityTheme(
      {final Duration duration,
      final double opacityFactor,
      final Curve curve,
      final Curve reverseCurve}) = _$PressableOpacityTheme;

  Duration get duration => throw _privateConstructorUsedError;
  double get opacityFactor => throw _privateConstructorUsedError;
  Curve get curve => throw _privateConstructorUsedError;
  Curve get reverseCurve => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$PressableOpacityThemeCopyWith<_$PressableOpacityTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PressableFillThemeCopyWith<$Res> {
  factory _$$PressableFillThemeCopyWith(_$PressableFillTheme value,
          $Res Function(_$PressableFillTheme) then) =
      __$$PressableFillThemeCopyWithImpl<$Res>;
  $Res call({Color fillColor, BorderRadius borderRadius});
}

/// @nodoc
class __$$PressableFillThemeCopyWithImpl<$Res>
    extends _$PressableThemeCopyWithImpl<$Res>
    implements _$$PressableFillThemeCopyWith<$Res> {
  __$$PressableFillThemeCopyWithImpl(
      _$PressableFillTheme _value, $Res Function(_$PressableFillTheme) _then)
      : super(_value, (v) => _then(v as _$PressableFillTheme));

  @override
  _$PressableFillTheme get _value => super._value as _$PressableFillTheme;

  @override
  $Res call({
    Object? fillColor = freezed,
    Object? borderRadius = freezed,
  }) {
    return _then(_$PressableFillTheme(
      fillColor: fillColor == freezed
          ? _value.fillColor
          : fillColor // ignore: cast_nullable_to_non_nullable
              as Color,
      borderRadius: borderRadius == freezed
          ? _value.borderRadius
          : borderRadius // ignore: cast_nullable_to_non_nullable
              as BorderRadius,
    ));
  }
}

/// @nodoc

class _$PressableFillTheme implements PressableFillTheme {
  const _$PressableFillTheme(
      {this.fillColor = Colors.black38, this.borderRadius = BorderRadius.zero});

  @override
  @JsonKey()
  final Color fillColor;
  @override
  @JsonKey()
  final BorderRadius borderRadius;

  @override
  String toString() {
    return 'PressableTheme.fill(fillColor: $fillColor, borderRadius: $borderRadius)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PressableFillTheme &&
            const DeepCollectionEquality().equals(other.fillColor, fillColor) &&
            const DeepCollectionEquality()
                .equals(other.borderRadius, borderRadius));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(fillColor),
      const DeepCollectionEquality().hash(borderRadius));

  @JsonKey(ignore: true)
  @override
  _$$PressableFillThemeCopyWith<_$PressableFillTheme> get copyWith =>
      __$$PressableFillThemeCopyWithImpl<_$PressableFillTheme>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Color? splashColor, Color? highlightColor,
            BorderRadius? borderRadius)
        ripple,
    required TResult Function(double scaleFactor, Duration duration,
            Curve curve, Curve reverseCurve)
        scale,
    required TResult Function(Duration duration, double opacityFactor,
            Curve curve, Curve reverseCurve)
        opacity,
    required TResult Function(Color fillColor, BorderRadius borderRadius) fill,
  }) {
    return fill(fillColor, borderRadius);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Color? splashColor, Color? highlightColor,
            BorderRadius? borderRadius)?
        ripple,
    TResult Function(double scaleFactor, Duration duration, Curve curve,
            Curve reverseCurve)?
        scale,
    TResult Function(Duration duration, double opacityFactor, Curve curve,
            Curve reverseCurve)?
        opacity,
    TResult Function(Color fillColor, BorderRadius borderRadius)? fill,
  }) {
    return fill?.call(fillColor, borderRadius);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Color? splashColor, Color? highlightColor,
            BorderRadius? borderRadius)?
        ripple,
    TResult Function(double scaleFactor, Duration duration, Curve curve,
            Curve reverseCurve)?
        scale,
    TResult Function(Duration duration, double opacityFactor, Curve curve,
            Curve reverseCurve)?
        opacity,
    TResult Function(Color fillColor, BorderRadius borderRadius)? fill,
    required TResult orElse(),
  }) {
    if (fill != null) {
      return fill(fillColor, borderRadius);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PressableRippleTheme value) ripple,
    required TResult Function(PressableScaleTheme value) scale,
    required TResult Function(PressableOpacityTheme value) opacity,
    required TResult Function(PressableFillTheme value) fill,
  }) {
    return fill(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PressableRippleTheme value)? ripple,
    TResult Function(PressableScaleTheme value)? scale,
    TResult Function(PressableOpacityTheme value)? opacity,
    TResult Function(PressableFillTheme value)? fill,
  }) {
    return fill?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PressableRippleTheme value)? ripple,
    TResult Function(PressableScaleTheme value)? scale,
    TResult Function(PressableOpacityTheme value)? opacity,
    TResult Function(PressableFillTheme value)? fill,
    required TResult orElse(),
  }) {
    if (fill != null) {
      return fill(this);
    }
    return orElse();
  }
}

abstract class PressableFillTheme implements PressableTheme {
  const factory PressableFillTheme(
      {final Color fillColor,
      final BorderRadius borderRadius}) = _$PressableFillTheme;

  Color get fillColor => throw _privateConstructorUsedError;
  BorderRadius get borderRadius => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$PressableFillThemeCopyWith<_$PressableFillTheme> get copyWith =>
      throw _privateConstructorUsedError;
}
