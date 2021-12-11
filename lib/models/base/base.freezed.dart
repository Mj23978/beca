// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'base.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Base _$BaseFromJson(Map<String, dynamic> json) {
  return _Base.fromJson(json);
}

/// @nodoc
class _$BaseTearOff {
  const _$BaseTearOff();

  _Base call({required String accountGroup}) {
    return _Base(
      accountGroup: accountGroup,
    );
  }

  Base fromJson(Map<String, Object> json) {
    return Base.fromJson(json);
  }
}

/// @nodoc
const $Base = _$BaseTearOff();

/// @nodoc
mixin _$Base {
  String get accountGroup => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BaseCopyWith<Base> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseCopyWith<$Res> {
  factory $BaseCopyWith(Base value, $Res Function(Base) then) =
      _$BaseCopyWithImpl<$Res>;
  $Res call({String accountGroup});
}

/// @nodoc
class _$BaseCopyWithImpl<$Res> implements $BaseCopyWith<$Res> {
  _$BaseCopyWithImpl(this._value, this._then);

  final Base _value;
  // ignore: unused_field
  final $Res Function(Base) _then;

  @override
  $Res call({
    Object? accountGroup = freezed,
  }) {
    return _then(_value.copyWith(
      accountGroup: accountGroup == freezed
          ? _value.accountGroup
          : accountGroup // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$BaseCopyWith<$Res> implements $BaseCopyWith<$Res> {
  factory _$BaseCopyWith(_Base value, $Res Function(_Base) then) =
      __$BaseCopyWithImpl<$Res>;
  @override
  $Res call({String accountGroup});
}

/// @nodoc
class __$BaseCopyWithImpl<$Res> extends _$BaseCopyWithImpl<$Res>
    implements _$BaseCopyWith<$Res> {
  __$BaseCopyWithImpl(_Base _value, $Res Function(_Base) _then)
      : super(_value, (v) => _then(v as _Base));

  @override
  _Base get _value => super._value as _Base;

  @override
  $Res call({
    Object? accountGroup = freezed,
  }) {
    return _then(_Base(
      accountGroup: accountGroup == freezed
          ? _value.accountGroup
          : accountGroup // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Base implements _Base {
  const _$_Base({required this.accountGroup});

  factory _$_Base.fromJson(Map<String, dynamic> json) =>
      _$_$_BaseFromJson(json);

  @override
  final String accountGroup;

  @override
  String toString() {
    return 'Base(accountGroup: $accountGroup)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Base &&
            (identical(other.accountGroup, accountGroup) ||
                const DeepCollectionEquality()
                    .equals(other.accountGroup, accountGroup)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(accountGroup);

  @JsonKey(ignore: true)
  @override
  _$BaseCopyWith<_Base> get copyWith =>
      __$BaseCopyWithImpl<_Base>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BaseToJson(this);
  }
}

abstract class _Base implements Base {
  const factory _Base({required String accountGroup}) = _$_Base;

  factory _Base.fromJson(Map<String, dynamic> json) = _$_Base.fromJson;

  @override
  String get accountGroup => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BaseCopyWith<_Base> get copyWith => throw _privateConstructorUsedError;
}
