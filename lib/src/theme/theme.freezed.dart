// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PressableTheme {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      Color? splashColor,
      Color? highlightColor,
      BorderRadius? borderRadius,
    )
    ripple,
    required TResult Function(
      double scaleFactor,
      Duration duration,
      Curve curve,
      Curve reverseCurve,
    )
    scale,
    required TResult Function(
      Duration duration,
      double opacityFactor,
      Curve curve,
      Curve reverseCurve,
    )
    opacity,
    required TResult Function(Color fillColor, BorderRadius borderRadius) fill,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      Color? splashColor,
      Color? highlightColor,
      BorderRadius? borderRadius,
    )?
    ripple,
    TResult? Function(
      double scaleFactor,
      Duration duration,
      Curve curve,
      Curve reverseCurve,
    )?
    scale,
    TResult? Function(
      Duration duration,
      double opacityFactor,
      Curve curve,
      Curve reverseCurve,
    )?
    opacity,
    TResult? Function(Color fillColor, BorderRadius borderRadius)? fill,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      Color? splashColor,
      Color? highlightColor,
      BorderRadius? borderRadius,
    )?
    ripple,
    TResult Function(
      double scaleFactor,
      Duration duration,
      Curve curve,
      Curve reverseCurve,
    )?
    scale,
    TResult Function(
      Duration duration,
      double opacityFactor,
      Curve curve,
      Curve reverseCurve,
    )?
    opacity,
    TResult Function(Color fillColor, BorderRadius borderRadius)? fill,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PressableRippleTheme value) ripple,
    required TResult Function(PressableScaleTheme value) scale,
    required TResult Function(PressableOpacityTheme value) opacity,
    required TResult Function(PressableFillTheme value) fill,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PressableRippleTheme value)? ripple,
    TResult? Function(PressableScaleTheme value)? scale,
    TResult? Function(PressableOpacityTheme value)? opacity,
    TResult? Function(PressableFillTheme value)? fill,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PressableRippleTheme value)? ripple,
    TResult Function(PressableScaleTheme value)? scale,
    TResult Function(PressableOpacityTheme value)? opacity,
    TResult Function(PressableFillTheme value)? fill,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PressableThemeCopyWith<$Res> {
  factory $PressableThemeCopyWith(
    PressableTheme value,
    $Res Function(PressableTheme) then,
  ) = _$PressableThemeCopyWithImpl<$Res, PressableTheme>;
}

/// @nodoc
class _$PressableThemeCopyWithImpl<$Res, $Val extends PressableTheme>
    implements $PressableThemeCopyWith<$Res> {
  _$PressableThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PressableTheme
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PressableRippleThemeImplCopyWith<$Res> {
  factory _$$PressableRippleThemeImplCopyWith(
    _$PressableRippleThemeImpl value,
    $Res Function(_$PressableRippleThemeImpl) then,
  ) = __$$PressableRippleThemeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    Color? splashColor,
    Color? highlightColor,
    BorderRadius? borderRadius,
  });
}

/// @nodoc
class __$$PressableRippleThemeImplCopyWithImpl<$Res>
    extends _$PressableThemeCopyWithImpl<$Res, _$PressableRippleThemeImpl>
    implements _$$PressableRippleThemeImplCopyWith<$Res> {
  __$$PressableRippleThemeImplCopyWithImpl(
    _$PressableRippleThemeImpl _value,
    $Res Function(_$PressableRippleThemeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PressableTheme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? splashColor = freezed,
    Object? highlightColor = freezed,
    Object? borderRadius = freezed,
  }) {
    return _then(
      _$PressableRippleThemeImpl(
        splashColor:
            freezed == splashColor
                ? _value.splashColor
                : splashColor // ignore: cast_nullable_to_non_nullable
                    as Color?,
        highlightColor:
            freezed == highlightColor
                ? _value.highlightColor
                : highlightColor // ignore: cast_nullable_to_non_nullable
                    as Color?,
        borderRadius:
            freezed == borderRadius
                ? _value.borderRadius
                : borderRadius // ignore: cast_nullable_to_non_nullable
                    as BorderRadius?,
      ),
    );
  }
}

/// @nodoc

class _$PressableRippleThemeImpl implements PressableRippleTheme {
  const _$PressableRippleThemeImpl({
    this.splashColor,
    this.highlightColor,
    this.borderRadius,
  });

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PressableRippleThemeImpl &&
            (identical(other.splashColor, splashColor) ||
                other.splashColor == splashColor) &&
            (identical(other.highlightColor, highlightColor) ||
                other.highlightColor == highlightColor) &&
            (identical(other.borderRadius, borderRadius) ||
                other.borderRadius == borderRadius));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, splashColor, highlightColor, borderRadius);

  /// Create a copy of PressableTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PressableRippleThemeImplCopyWith<_$PressableRippleThemeImpl>
  get copyWith =>
      __$$PressableRippleThemeImplCopyWithImpl<_$PressableRippleThemeImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      Color? splashColor,
      Color? highlightColor,
      BorderRadius? borderRadius,
    )
    ripple,
    required TResult Function(
      double scaleFactor,
      Duration duration,
      Curve curve,
      Curve reverseCurve,
    )
    scale,
    required TResult Function(
      Duration duration,
      double opacityFactor,
      Curve curve,
      Curve reverseCurve,
    )
    opacity,
    required TResult Function(Color fillColor, BorderRadius borderRadius) fill,
  }) {
    return ripple(splashColor, highlightColor, borderRadius);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      Color? splashColor,
      Color? highlightColor,
      BorderRadius? borderRadius,
    )?
    ripple,
    TResult? Function(
      double scaleFactor,
      Duration duration,
      Curve curve,
      Curve reverseCurve,
    )?
    scale,
    TResult? Function(
      Duration duration,
      double opacityFactor,
      Curve curve,
      Curve reverseCurve,
    )?
    opacity,
    TResult? Function(Color fillColor, BorderRadius borderRadius)? fill,
  }) {
    return ripple?.call(splashColor, highlightColor, borderRadius);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      Color? splashColor,
      Color? highlightColor,
      BorderRadius? borderRadius,
    )?
    ripple,
    TResult Function(
      double scaleFactor,
      Duration duration,
      Curve curve,
      Curve reverseCurve,
    )?
    scale,
    TResult Function(
      Duration duration,
      double opacityFactor,
      Curve curve,
      Curve reverseCurve,
    )?
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
    TResult? Function(PressableRippleTheme value)? ripple,
    TResult? Function(PressableScaleTheme value)? scale,
    TResult? Function(PressableOpacityTheme value)? opacity,
    TResult? Function(PressableFillTheme value)? fill,
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
  const factory PressableRippleTheme({
    final Color? splashColor,
    final Color? highlightColor,
    final BorderRadius? borderRadius,
  }) = _$PressableRippleThemeImpl;

  Color? get splashColor;
  Color? get highlightColor;
  BorderRadius? get borderRadius;

  /// Create a copy of PressableTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PressableRippleThemeImplCopyWith<_$PressableRippleThemeImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PressableScaleThemeImplCopyWith<$Res> {
  factory _$$PressableScaleThemeImplCopyWith(
    _$PressableScaleThemeImpl value,
    $Res Function(_$PressableScaleThemeImpl) then,
  ) = __$$PressableScaleThemeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    double scaleFactor,
    Duration duration,
    Curve curve,
    Curve reverseCurve,
  });
}

/// @nodoc
class __$$PressableScaleThemeImplCopyWithImpl<$Res>
    extends _$PressableThemeCopyWithImpl<$Res, _$PressableScaleThemeImpl>
    implements _$$PressableScaleThemeImplCopyWith<$Res> {
  __$$PressableScaleThemeImplCopyWithImpl(
    _$PressableScaleThemeImpl _value,
    $Res Function(_$PressableScaleThemeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PressableTheme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scaleFactor = null,
    Object? duration = null,
    Object? curve = null,
    Object? reverseCurve = null,
  }) {
    return _then(
      _$PressableScaleThemeImpl(
        scaleFactor:
            null == scaleFactor
                ? _value.scaleFactor
                : scaleFactor // ignore: cast_nullable_to_non_nullable
                    as double,
        duration:
            null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                    as Duration,
        curve:
            null == curve
                ? _value.curve
                : curve // ignore: cast_nullable_to_non_nullable
                    as Curve,
        reverseCurve:
            null == reverseCurve
                ? _value.reverseCurve
                : reverseCurve // ignore: cast_nullable_to_non_nullable
                    as Curve,
      ),
    );
  }
}

/// @nodoc

class _$PressableScaleThemeImpl implements PressableScaleTheme {
  const _$PressableScaleThemeImpl({
    this.scaleFactor = 0.8,
    this.duration = const Duration(milliseconds: 100),
    this.curve = Curves.easeInOut,
    this.reverseCurve = Curves.easeInOut,
  });

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PressableScaleThemeImpl &&
            (identical(other.scaleFactor, scaleFactor) ||
                other.scaleFactor == scaleFactor) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.curve, curve) || other.curve == curve) &&
            (identical(other.reverseCurve, reverseCurve) ||
                other.reverseCurve == reverseCurve));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, scaleFactor, duration, curve, reverseCurve);

  /// Create a copy of PressableTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PressableScaleThemeImplCopyWith<_$PressableScaleThemeImpl> get copyWith =>
      __$$PressableScaleThemeImplCopyWithImpl<_$PressableScaleThemeImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      Color? splashColor,
      Color? highlightColor,
      BorderRadius? borderRadius,
    )
    ripple,
    required TResult Function(
      double scaleFactor,
      Duration duration,
      Curve curve,
      Curve reverseCurve,
    )
    scale,
    required TResult Function(
      Duration duration,
      double opacityFactor,
      Curve curve,
      Curve reverseCurve,
    )
    opacity,
    required TResult Function(Color fillColor, BorderRadius borderRadius) fill,
  }) {
    return scale(scaleFactor, duration, curve, reverseCurve);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      Color? splashColor,
      Color? highlightColor,
      BorderRadius? borderRadius,
    )?
    ripple,
    TResult? Function(
      double scaleFactor,
      Duration duration,
      Curve curve,
      Curve reverseCurve,
    )?
    scale,
    TResult? Function(
      Duration duration,
      double opacityFactor,
      Curve curve,
      Curve reverseCurve,
    )?
    opacity,
    TResult? Function(Color fillColor, BorderRadius borderRadius)? fill,
  }) {
    return scale?.call(scaleFactor, duration, curve, reverseCurve);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      Color? splashColor,
      Color? highlightColor,
      BorderRadius? borderRadius,
    )?
    ripple,
    TResult Function(
      double scaleFactor,
      Duration duration,
      Curve curve,
      Curve reverseCurve,
    )?
    scale,
    TResult Function(
      Duration duration,
      double opacityFactor,
      Curve curve,
      Curve reverseCurve,
    )?
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
    TResult? Function(PressableRippleTheme value)? ripple,
    TResult? Function(PressableScaleTheme value)? scale,
    TResult? Function(PressableOpacityTheme value)? opacity,
    TResult? Function(PressableFillTheme value)? fill,
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
  const factory PressableScaleTheme({
    final double scaleFactor,
    final Duration duration,
    final Curve curve,
    final Curve reverseCurve,
  }) = _$PressableScaleThemeImpl;

  double get scaleFactor;
  Duration get duration;
  Curve get curve;
  Curve get reverseCurve;

  /// Create a copy of PressableTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PressableScaleThemeImplCopyWith<_$PressableScaleThemeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PressableOpacityThemeImplCopyWith<$Res> {
  factory _$$PressableOpacityThemeImplCopyWith(
    _$PressableOpacityThemeImpl value,
    $Res Function(_$PressableOpacityThemeImpl) then,
  ) = __$$PressableOpacityThemeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    Duration duration,
    double opacityFactor,
    Curve curve,
    Curve reverseCurve,
  });
}

/// @nodoc
class __$$PressableOpacityThemeImplCopyWithImpl<$Res>
    extends _$PressableThemeCopyWithImpl<$Res, _$PressableOpacityThemeImpl>
    implements _$$PressableOpacityThemeImplCopyWith<$Res> {
  __$$PressableOpacityThemeImplCopyWithImpl(
    _$PressableOpacityThemeImpl _value,
    $Res Function(_$PressableOpacityThemeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PressableTheme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? opacityFactor = null,
    Object? curve = null,
    Object? reverseCurve = null,
  }) {
    return _then(
      _$PressableOpacityThemeImpl(
        duration:
            null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                    as Duration,
        opacityFactor:
            null == opacityFactor
                ? _value.opacityFactor
                : opacityFactor // ignore: cast_nullable_to_non_nullable
                    as double,
        curve:
            null == curve
                ? _value.curve
                : curve // ignore: cast_nullable_to_non_nullable
                    as Curve,
        reverseCurve:
            null == reverseCurve
                ? _value.reverseCurve
                : reverseCurve // ignore: cast_nullable_to_non_nullable
                    as Curve,
      ),
    );
  }
}

/// @nodoc

class _$PressableOpacityThemeImpl implements PressableOpacityTheme {
  const _$PressableOpacityThemeImpl({
    this.duration = const Duration(milliseconds: 100),
    this.opacityFactor = 0.6,
    this.curve = Curves.easeInOut,
    this.reverseCurve = Curves.easeInOut,
  });

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PressableOpacityThemeImpl &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.opacityFactor, opacityFactor) ||
                other.opacityFactor == opacityFactor) &&
            (identical(other.curve, curve) || other.curve == curve) &&
            (identical(other.reverseCurve, reverseCurve) ||
                other.reverseCurve == reverseCurve));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, duration, opacityFactor, curve, reverseCurve);

  /// Create a copy of PressableTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PressableOpacityThemeImplCopyWith<_$PressableOpacityThemeImpl>
  get copyWith =>
      __$$PressableOpacityThemeImplCopyWithImpl<_$PressableOpacityThemeImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      Color? splashColor,
      Color? highlightColor,
      BorderRadius? borderRadius,
    )
    ripple,
    required TResult Function(
      double scaleFactor,
      Duration duration,
      Curve curve,
      Curve reverseCurve,
    )
    scale,
    required TResult Function(
      Duration duration,
      double opacityFactor,
      Curve curve,
      Curve reverseCurve,
    )
    opacity,
    required TResult Function(Color fillColor, BorderRadius borderRadius) fill,
  }) {
    return opacity(duration, opacityFactor, curve, reverseCurve);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      Color? splashColor,
      Color? highlightColor,
      BorderRadius? borderRadius,
    )?
    ripple,
    TResult? Function(
      double scaleFactor,
      Duration duration,
      Curve curve,
      Curve reverseCurve,
    )?
    scale,
    TResult? Function(
      Duration duration,
      double opacityFactor,
      Curve curve,
      Curve reverseCurve,
    )?
    opacity,
    TResult? Function(Color fillColor, BorderRadius borderRadius)? fill,
  }) {
    return opacity?.call(duration, opacityFactor, curve, reverseCurve);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      Color? splashColor,
      Color? highlightColor,
      BorderRadius? borderRadius,
    )?
    ripple,
    TResult Function(
      double scaleFactor,
      Duration duration,
      Curve curve,
      Curve reverseCurve,
    )?
    scale,
    TResult Function(
      Duration duration,
      double opacityFactor,
      Curve curve,
      Curve reverseCurve,
    )?
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
    TResult? Function(PressableRippleTheme value)? ripple,
    TResult? Function(PressableScaleTheme value)? scale,
    TResult? Function(PressableOpacityTheme value)? opacity,
    TResult? Function(PressableFillTheme value)? fill,
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
  const factory PressableOpacityTheme({
    final Duration duration,
    final double opacityFactor,
    final Curve curve,
    final Curve reverseCurve,
  }) = _$PressableOpacityThemeImpl;

  Duration get duration;
  double get opacityFactor;
  Curve get curve;
  Curve get reverseCurve;

  /// Create a copy of PressableTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PressableOpacityThemeImplCopyWith<_$PressableOpacityThemeImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PressableFillThemeImplCopyWith<$Res> {
  factory _$$PressableFillThemeImplCopyWith(
    _$PressableFillThemeImpl value,
    $Res Function(_$PressableFillThemeImpl) then,
  ) = __$$PressableFillThemeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Color fillColor, BorderRadius borderRadius});
}

/// @nodoc
class __$$PressableFillThemeImplCopyWithImpl<$Res>
    extends _$PressableThemeCopyWithImpl<$Res, _$PressableFillThemeImpl>
    implements _$$PressableFillThemeImplCopyWith<$Res> {
  __$$PressableFillThemeImplCopyWithImpl(
    _$PressableFillThemeImpl _value,
    $Res Function(_$PressableFillThemeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PressableTheme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? fillColor = null, Object? borderRadius = null}) {
    return _then(
      _$PressableFillThemeImpl(
        fillColor:
            null == fillColor
                ? _value.fillColor
                : fillColor // ignore: cast_nullable_to_non_nullable
                    as Color,
        borderRadius:
            null == borderRadius
                ? _value.borderRadius
                : borderRadius // ignore: cast_nullable_to_non_nullable
                    as BorderRadius,
      ),
    );
  }
}

/// @nodoc

class _$PressableFillThemeImpl implements PressableFillTheme {
  const _$PressableFillThemeImpl({
    this.fillColor = Colors.black38,
    this.borderRadius = BorderRadius.zero,
  });

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PressableFillThemeImpl &&
            (identical(other.fillColor, fillColor) ||
                other.fillColor == fillColor) &&
            (identical(other.borderRadius, borderRadius) ||
                other.borderRadius == borderRadius));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fillColor, borderRadius);

  /// Create a copy of PressableTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PressableFillThemeImplCopyWith<_$PressableFillThemeImpl> get copyWith =>
      __$$PressableFillThemeImplCopyWithImpl<_$PressableFillThemeImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      Color? splashColor,
      Color? highlightColor,
      BorderRadius? borderRadius,
    )
    ripple,
    required TResult Function(
      double scaleFactor,
      Duration duration,
      Curve curve,
      Curve reverseCurve,
    )
    scale,
    required TResult Function(
      Duration duration,
      double opacityFactor,
      Curve curve,
      Curve reverseCurve,
    )
    opacity,
    required TResult Function(Color fillColor, BorderRadius borderRadius) fill,
  }) {
    return fill(fillColor, borderRadius);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      Color? splashColor,
      Color? highlightColor,
      BorderRadius? borderRadius,
    )?
    ripple,
    TResult? Function(
      double scaleFactor,
      Duration duration,
      Curve curve,
      Curve reverseCurve,
    )?
    scale,
    TResult? Function(
      Duration duration,
      double opacityFactor,
      Curve curve,
      Curve reverseCurve,
    )?
    opacity,
    TResult? Function(Color fillColor, BorderRadius borderRadius)? fill,
  }) {
    return fill?.call(fillColor, borderRadius);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      Color? splashColor,
      Color? highlightColor,
      BorderRadius? borderRadius,
    )?
    ripple,
    TResult Function(
      double scaleFactor,
      Duration duration,
      Curve curve,
      Curve reverseCurve,
    )?
    scale,
    TResult Function(
      Duration duration,
      double opacityFactor,
      Curve curve,
      Curve reverseCurve,
    )?
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
    TResult? Function(PressableRippleTheme value)? ripple,
    TResult? Function(PressableScaleTheme value)? scale,
    TResult? Function(PressableOpacityTheme value)? opacity,
    TResult? Function(PressableFillTheme value)? fill,
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
  const factory PressableFillTheme({
    final Color fillColor,
    final BorderRadius borderRadius,
  }) = _$PressableFillThemeImpl;

  Color get fillColor;
  BorderRadius get borderRadius;

  /// Create a copy of PressableTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PressableFillThemeImplCopyWith<_$PressableFillThemeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
