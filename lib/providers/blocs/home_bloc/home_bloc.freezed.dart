// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeEventTearOff {
  const _$HomeEventTearOff();

  HomeClickPieChartEvent clickPieChart({required int index}) {
    return HomeClickPieChartEvent(
      index: index,
    );
  }

  HomeBarChartEvent barChart({double? max, double? total, int? average}) {
    return HomeBarChartEvent(
      max: max,
      total: total,
      average: average,
    );
  }

  HomeLoadDataEvent loadData() {
    return const HomeLoadDataEvent();
  }

  HomeLoadingEvent loading() {
    return const HomeLoadingEvent();
  }

  HomeComputeEvent compute() {
    return const HomeComputeEvent();
  }
}

/// @nodoc
const $HomeEvent = _$HomeEventTearOff();

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) clickPieChart,
    required TResult Function(double? max, double? total, int? average)
        barChart,
    required TResult Function() loadData,
    required TResult Function() loading,
    required TResult Function() compute,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? clickPieChart,
    TResult Function(double? max, double? total, int? average)? barChart,
    TResult Function()? loadData,
    TResult Function()? loading,
    TResult Function()? compute,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeClickPieChartEvent value) clickPieChart,
    required TResult Function(HomeBarChartEvent value) barChart,
    required TResult Function(HomeLoadDataEvent value) loadData,
    required TResult Function(HomeLoadingEvent value) loading,
    required TResult Function(HomeComputeEvent value) compute,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeClickPieChartEvent value)? clickPieChart,
    TResult Function(HomeBarChartEvent value)? barChart,
    TResult Function(HomeLoadDataEvent value)? loadData,
    TResult Function(HomeLoadingEvent value)? loading,
    TResult Function(HomeComputeEvent value)? compute,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res> implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  final HomeEvent _value;
  // ignore: unused_field
  final $Res Function(HomeEvent) _then;
}

/// @nodoc
abstract class $HomeClickPieChartEventCopyWith<$Res> {
  factory $HomeClickPieChartEventCopyWith(HomeClickPieChartEvent value,
          $Res Function(HomeClickPieChartEvent) then) =
      _$HomeClickPieChartEventCopyWithImpl<$Res>;
  $Res call({int index});
}

/// @nodoc
class _$HomeClickPieChartEventCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res>
    implements $HomeClickPieChartEventCopyWith<$Res> {
  _$HomeClickPieChartEventCopyWithImpl(HomeClickPieChartEvent _value,
      $Res Function(HomeClickPieChartEvent) _then)
      : super(_value, (v) => _then(v as HomeClickPieChartEvent));

  @override
  HomeClickPieChartEvent get _value => super._value as HomeClickPieChartEvent;

  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(HomeClickPieChartEvent(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$HomeClickPieChartEvent implements HomeClickPieChartEvent {
  const _$HomeClickPieChartEvent({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'HomeEvent.clickPieChart(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HomeClickPieChartEvent &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(index);

  @JsonKey(ignore: true)
  @override
  $HomeClickPieChartEventCopyWith<HomeClickPieChartEvent> get copyWith =>
      _$HomeClickPieChartEventCopyWithImpl<HomeClickPieChartEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) clickPieChart,
    required TResult Function(double? max, double? total, int? average)
        barChart,
    required TResult Function() loadData,
    required TResult Function() loading,
    required TResult Function() compute,
  }) {
    return clickPieChart(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? clickPieChart,
    TResult Function(double? max, double? total, int? average)? barChart,
    TResult Function()? loadData,
    TResult Function()? loading,
    TResult Function()? compute,
    required TResult orElse(),
  }) {
    if (clickPieChart != null) {
      return clickPieChart(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeClickPieChartEvent value) clickPieChart,
    required TResult Function(HomeBarChartEvent value) barChart,
    required TResult Function(HomeLoadDataEvent value) loadData,
    required TResult Function(HomeLoadingEvent value) loading,
    required TResult Function(HomeComputeEvent value) compute,
  }) {
    return clickPieChart(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeClickPieChartEvent value)? clickPieChart,
    TResult Function(HomeBarChartEvent value)? barChart,
    TResult Function(HomeLoadDataEvent value)? loadData,
    TResult Function(HomeLoadingEvent value)? loading,
    TResult Function(HomeComputeEvent value)? compute,
    required TResult orElse(),
  }) {
    if (clickPieChart != null) {
      return clickPieChart(this);
    }
    return orElse();
  }
}

abstract class HomeClickPieChartEvent implements HomeEvent {
  const factory HomeClickPieChartEvent({required int index}) =
      _$HomeClickPieChartEvent;

  int get index => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeClickPieChartEventCopyWith<HomeClickPieChartEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeBarChartEventCopyWith<$Res> {
  factory $HomeBarChartEventCopyWith(
          HomeBarChartEvent value, $Res Function(HomeBarChartEvent) then) =
      _$HomeBarChartEventCopyWithImpl<$Res>;
  $Res call({double? max, double? total, int? average});
}

/// @nodoc
class _$HomeBarChartEventCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res>
    implements $HomeBarChartEventCopyWith<$Res> {
  _$HomeBarChartEventCopyWithImpl(
      HomeBarChartEvent _value, $Res Function(HomeBarChartEvent) _then)
      : super(_value, (v) => _then(v as HomeBarChartEvent));

  @override
  HomeBarChartEvent get _value => super._value as HomeBarChartEvent;

  @override
  $Res call({
    Object? max = freezed,
    Object? total = freezed,
    Object? average = freezed,
  }) {
    return _then(HomeBarChartEvent(
      max: max == freezed
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as double?,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      average: average == freezed
          ? _value.average
          : average // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$HomeBarChartEvent implements HomeBarChartEvent {
  const _$HomeBarChartEvent({this.max, this.total, this.average});

  @override // required List<List<Transaction>> barData,
  final double? max;
  @override
  final double? total;
  @override
  final int? average;

  @override
  String toString() {
    return 'HomeEvent.barChart(max: $max, total: $total, average: $average)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HomeBarChartEvent &&
            (identical(other.max, max) ||
                const DeepCollectionEquality().equals(other.max, max)) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)) &&
            (identical(other.average, average) ||
                const DeepCollectionEquality().equals(other.average, average)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(max) ^
      const DeepCollectionEquality().hash(total) ^
      const DeepCollectionEquality().hash(average);

  @JsonKey(ignore: true)
  @override
  $HomeBarChartEventCopyWith<HomeBarChartEvent> get copyWith =>
      _$HomeBarChartEventCopyWithImpl<HomeBarChartEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) clickPieChart,
    required TResult Function(double? max, double? total, int? average)
        barChart,
    required TResult Function() loadData,
    required TResult Function() loading,
    required TResult Function() compute,
  }) {
    return barChart(max, total, average);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? clickPieChart,
    TResult Function(double? max, double? total, int? average)? barChart,
    TResult Function()? loadData,
    TResult Function()? loading,
    TResult Function()? compute,
    required TResult orElse(),
  }) {
    if (barChart != null) {
      return barChart(max, total, average);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeClickPieChartEvent value) clickPieChart,
    required TResult Function(HomeBarChartEvent value) barChart,
    required TResult Function(HomeLoadDataEvent value) loadData,
    required TResult Function(HomeLoadingEvent value) loading,
    required TResult Function(HomeComputeEvent value) compute,
  }) {
    return barChart(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeClickPieChartEvent value)? clickPieChart,
    TResult Function(HomeBarChartEvent value)? barChart,
    TResult Function(HomeLoadDataEvent value)? loadData,
    TResult Function(HomeLoadingEvent value)? loading,
    TResult Function(HomeComputeEvent value)? compute,
    required TResult orElse(),
  }) {
    if (barChart != null) {
      return barChart(this);
    }
    return orElse();
  }
}

abstract class HomeBarChartEvent implements HomeEvent {
  const factory HomeBarChartEvent({double? max, double? total, int? average}) =
      _$HomeBarChartEvent;

// required List<List<Transaction>> barData,
  double? get max => throw _privateConstructorUsedError;
  double? get total => throw _privateConstructorUsedError;
  int? get average => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeBarChartEventCopyWith<HomeBarChartEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeLoadDataEventCopyWith<$Res> {
  factory $HomeLoadDataEventCopyWith(
          HomeLoadDataEvent value, $Res Function(HomeLoadDataEvent) then) =
      _$HomeLoadDataEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeLoadDataEventCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res>
    implements $HomeLoadDataEventCopyWith<$Res> {
  _$HomeLoadDataEventCopyWithImpl(
      HomeLoadDataEvent _value, $Res Function(HomeLoadDataEvent) _then)
      : super(_value, (v) => _then(v as HomeLoadDataEvent));

  @override
  HomeLoadDataEvent get _value => super._value as HomeLoadDataEvent;
}

/// @nodoc

class _$HomeLoadDataEvent implements HomeLoadDataEvent {
  const _$HomeLoadDataEvent();

  @override
  String toString() {
    return 'HomeEvent.loadData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is HomeLoadDataEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) clickPieChart,
    required TResult Function(double? max, double? total, int? average)
        barChart,
    required TResult Function() loadData,
    required TResult Function() loading,
    required TResult Function() compute,
  }) {
    return loadData();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? clickPieChart,
    TResult Function(double? max, double? total, int? average)? barChart,
    TResult Function()? loadData,
    TResult Function()? loading,
    TResult Function()? compute,
    required TResult orElse(),
  }) {
    if (loadData != null) {
      return loadData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeClickPieChartEvent value) clickPieChart,
    required TResult Function(HomeBarChartEvent value) barChart,
    required TResult Function(HomeLoadDataEvent value) loadData,
    required TResult Function(HomeLoadingEvent value) loading,
    required TResult Function(HomeComputeEvent value) compute,
  }) {
    return loadData(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeClickPieChartEvent value)? clickPieChart,
    TResult Function(HomeBarChartEvent value)? barChart,
    TResult Function(HomeLoadDataEvent value)? loadData,
    TResult Function(HomeLoadingEvent value)? loading,
    TResult Function(HomeComputeEvent value)? compute,
    required TResult orElse(),
  }) {
    if (loadData != null) {
      return loadData(this);
    }
    return orElse();
  }
}

abstract class HomeLoadDataEvent implements HomeEvent {
  const factory HomeLoadDataEvent() = _$HomeLoadDataEvent;
}

/// @nodoc
abstract class $HomeLoadingEventCopyWith<$Res> {
  factory $HomeLoadingEventCopyWith(
          HomeLoadingEvent value, $Res Function(HomeLoadingEvent) then) =
      _$HomeLoadingEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeLoadingEventCopyWithImpl<$Res> extends _$HomeEventCopyWithImpl<$Res>
    implements $HomeLoadingEventCopyWith<$Res> {
  _$HomeLoadingEventCopyWithImpl(
      HomeLoadingEvent _value, $Res Function(HomeLoadingEvent) _then)
      : super(_value, (v) => _then(v as HomeLoadingEvent));

  @override
  HomeLoadingEvent get _value => super._value as HomeLoadingEvent;
}

/// @nodoc

class _$HomeLoadingEvent implements HomeLoadingEvent {
  const _$HomeLoadingEvent();

  @override
  String toString() {
    return 'HomeEvent.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is HomeLoadingEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) clickPieChart,
    required TResult Function(double? max, double? total, int? average)
        barChart,
    required TResult Function() loadData,
    required TResult Function() loading,
    required TResult Function() compute,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? clickPieChart,
    TResult Function(double? max, double? total, int? average)? barChart,
    TResult Function()? loadData,
    TResult Function()? loading,
    TResult Function()? compute,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeClickPieChartEvent value) clickPieChart,
    required TResult Function(HomeBarChartEvent value) barChart,
    required TResult Function(HomeLoadDataEvent value) loadData,
    required TResult Function(HomeLoadingEvent value) loading,
    required TResult Function(HomeComputeEvent value) compute,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeClickPieChartEvent value)? clickPieChart,
    TResult Function(HomeBarChartEvent value)? barChart,
    TResult Function(HomeLoadDataEvent value)? loadData,
    TResult Function(HomeLoadingEvent value)? loading,
    TResult Function(HomeComputeEvent value)? compute,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class HomeLoadingEvent implements HomeEvent {
  const factory HomeLoadingEvent() = _$HomeLoadingEvent;
}

/// @nodoc
abstract class $HomeComputeEventCopyWith<$Res> {
  factory $HomeComputeEventCopyWith(
          HomeComputeEvent value, $Res Function(HomeComputeEvent) then) =
      _$HomeComputeEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeComputeEventCopyWithImpl<$Res> extends _$HomeEventCopyWithImpl<$Res>
    implements $HomeComputeEventCopyWith<$Res> {
  _$HomeComputeEventCopyWithImpl(
      HomeComputeEvent _value, $Res Function(HomeComputeEvent) _then)
      : super(_value, (v) => _then(v as HomeComputeEvent));

  @override
  HomeComputeEvent get _value => super._value as HomeComputeEvent;
}

/// @nodoc

class _$HomeComputeEvent implements HomeComputeEvent {
  const _$HomeComputeEvent();

  @override
  String toString() {
    return 'HomeEvent.compute()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is HomeComputeEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) clickPieChart,
    required TResult Function(double? max, double? total, int? average)
        barChart,
    required TResult Function() loadData,
    required TResult Function() loading,
    required TResult Function() compute,
  }) {
    return compute();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? clickPieChart,
    TResult Function(double? max, double? total, int? average)? barChart,
    TResult Function()? loadData,
    TResult Function()? loading,
    TResult Function()? compute,
    required TResult orElse(),
  }) {
    if (compute != null) {
      return compute();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeClickPieChartEvent value) clickPieChart,
    required TResult Function(HomeBarChartEvent value) barChart,
    required TResult Function(HomeLoadDataEvent value) loadData,
    required TResult Function(HomeLoadingEvent value) loading,
    required TResult Function(HomeComputeEvent value) compute,
  }) {
    return compute(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeClickPieChartEvent value)? clickPieChart,
    TResult Function(HomeBarChartEvent value)? barChart,
    TResult Function(HomeLoadDataEvent value)? loadData,
    TResult Function(HomeLoadingEvent value)? loading,
    TResult Function(HomeComputeEvent value)? compute,
    required TResult orElse(),
  }) {
    if (compute != null) {
      return compute(this);
    }
    return orElse();
  }
}

abstract class HomeComputeEvent implements HomeEvent {
  const factory HomeComputeEvent() = _$HomeComputeEvent;
}

/// @nodoc
class _$HomeStateTearOff {
  const _$HomeStateTearOff();

  HomeInitialState initial() {
    return const HomeInitialState();
  }

  HomeLoadingState loading() {
    return const HomeLoadingState();
  }

  HomeLoadedState loaded(
      {required int pieChartIndex,
      List<double>? barChartData,
      double? maxRod}) {
    return HomeLoadedState(
      pieChartIndex: pieChartIndex,
      barChartData: barChartData,
      maxRod: maxRod,
    );
  }

  HomeErrorState error() {
    return const HomeErrorState();
  }
}

/// @nodoc
const $HomeState = _$HomeStateTearOff();

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            int pieChartIndex, List<double>? barChartData, double? maxRod)
        loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            int pieChartIndex, List<double>? barChartData, double? maxRod)?
        loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeInitialState value) initial,
    required TResult Function(HomeLoadingState value) loading,
    required TResult Function(HomeLoadedState value) loaded,
    required TResult Function(HomeErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeInitialState value)? initial,
    TResult Function(HomeLoadingState value)? loading,
    TResult Function(HomeLoadedState value)? loaded,
    TResult Function(HomeErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;
}

/// @nodoc
abstract class $HomeInitialStateCopyWith<$Res> {
  factory $HomeInitialStateCopyWith(
          HomeInitialState value, $Res Function(HomeInitialState) then) =
      _$HomeInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeInitialStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements $HomeInitialStateCopyWith<$Res> {
  _$HomeInitialStateCopyWithImpl(
      HomeInitialState _value, $Res Function(HomeInitialState) _then)
      : super(_value, (v) => _then(v as HomeInitialState));

  @override
  HomeInitialState get _value => super._value as HomeInitialState;
}

/// @nodoc

class _$HomeInitialState implements HomeInitialState {
  const _$HomeInitialState();

  @override
  String toString() {
    return 'HomeState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is HomeInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            int pieChartIndex, List<double>? barChartData, double? maxRod)
        loaded,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            int pieChartIndex, List<double>? barChartData, double? maxRod)?
        loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeInitialState value) initial,
    required TResult Function(HomeLoadingState value) loading,
    required TResult Function(HomeLoadedState value) loaded,
    required TResult Function(HomeErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeInitialState value)? initial,
    TResult Function(HomeLoadingState value)? loading,
    TResult Function(HomeLoadedState value)? loaded,
    TResult Function(HomeErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class HomeInitialState implements HomeState {
  const factory HomeInitialState() = _$HomeInitialState;
}

/// @nodoc
abstract class $HomeLoadingStateCopyWith<$Res> {
  factory $HomeLoadingStateCopyWith(
          HomeLoadingState value, $Res Function(HomeLoadingState) then) =
      _$HomeLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeLoadingStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements $HomeLoadingStateCopyWith<$Res> {
  _$HomeLoadingStateCopyWithImpl(
      HomeLoadingState _value, $Res Function(HomeLoadingState) _then)
      : super(_value, (v) => _then(v as HomeLoadingState));

  @override
  HomeLoadingState get _value => super._value as HomeLoadingState;
}

/// @nodoc

class _$HomeLoadingState implements HomeLoadingState {
  const _$HomeLoadingState();

  @override
  String toString() {
    return 'HomeState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is HomeLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            int pieChartIndex, List<double>? barChartData, double? maxRod)
        loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            int pieChartIndex, List<double>? barChartData, double? maxRod)?
        loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeInitialState value) initial,
    required TResult Function(HomeLoadingState value) loading,
    required TResult Function(HomeLoadedState value) loaded,
    required TResult Function(HomeErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeInitialState value)? initial,
    TResult Function(HomeLoadingState value)? loading,
    TResult Function(HomeLoadedState value)? loaded,
    TResult Function(HomeErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class HomeLoadingState implements HomeState {
  const factory HomeLoadingState() = _$HomeLoadingState;
}

/// @nodoc
abstract class $HomeLoadedStateCopyWith<$Res> {
  factory $HomeLoadedStateCopyWith(
          HomeLoadedState value, $Res Function(HomeLoadedState) then) =
      _$HomeLoadedStateCopyWithImpl<$Res>;
  $Res call({int pieChartIndex, List<double>? barChartData, double? maxRod});
}

/// @nodoc
class _$HomeLoadedStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements $HomeLoadedStateCopyWith<$Res> {
  _$HomeLoadedStateCopyWithImpl(
      HomeLoadedState _value, $Res Function(HomeLoadedState) _then)
      : super(_value, (v) => _then(v as HomeLoadedState));

  @override
  HomeLoadedState get _value => super._value as HomeLoadedState;

  @override
  $Res call({
    Object? pieChartIndex = freezed,
    Object? barChartData = freezed,
    Object? maxRod = freezed,
  }) {
    return _then(HomeLoadedState(
      pieChartIndex: pieChartIndex == freezed
          ? _value.pieChartIndex
          : pieChartIndex // ignore: cast_nullable_to_non_nullable
              as int,
      barChartData: barChartData == freezed
          ? _value.barChartData
          : barChartData // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      maxRod: maxRod == freezed
          ? _value.maxRod
          : maxRod // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$HomeLoadedState implements HomeLoadedState {
  const _$HomeLoadedState(
      {required this.pieChartIndex, this.barChartData, this.maxRod});

  @override
  final int pieChartIndex;
  @override
  final List<double>? barChartData;
  @override
  final double? maxRod;

  @override
  String toString() {
    return 'HomeState.loaded(pieChartIndex: $pieChartIndex, barChartData: $barChartData, maxRod: $maxRod)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HomeLoadedState &&
            (identical(other.pieChartIndex, pieChartIndex) ||
                const DeepCollectionEquality()
                    .equals(other.pieChartIndex, pieChartIndex)) &&
            (identical(other.barChartData, barChartData) ||
                const DeepCollectionEquality()
                    .equals(other.barChartData, barChartData)) &&
            (identical(other.maxRod, maxRod) ||
                const DeepCollectionEquality().equals(other.maxRod, maxRod)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(pieChartIndex) ^
      const DeepCollectionEquality().hash(barChartData) ^
      const DeepCollectionEquality().hash(maxRod);

  @JsonKey(ignore: true)
  @override
  $HomeLoadedStateCopyWith<HomeLoadedState> get copyWith =>
      _$HomeLoadedStateCopyWithImpl<HomeLoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            int pieChartIndex, List<double>? barChartData, double? maxRod)
        loaded,
    required TResult Function() error,
  }) {
    return loaded(pieChartIndex, barChartData, maxRod);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            int pieChartIndex, List<double>? barChartData, double? maxRod)?
        loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(pieChartIndex, barChartData, maxRod);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeInitialState value) initial,
    required TResult Function(HomeLoadingState value) loading,
    required TResult Function(HomeLoadedState value) loaded,
    required TResult Function(HomeErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeInitialState value)? initial,
    TResult Function(HomeLoadingState value)? loading,
    TResult Function(HomeLoadedState value)? loaded,
    TResult Function(HomeErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class HomeLoadedState implements HomeState {
  const factory HomeLoadedState(
      {required int pieChartIndex,
      List<double>? barChartData,
      double? maxRod}) = _$HomeLoadedState;

  int get pieChartIndex => throw _privateConstructorUsedError;
  List<double>? get barChartData => throw _privateConstructorUsedError;
  double? get maxRod => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeLoadedStateCopyWith<HomeLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeErrorStateCopyWith<$Res> {
  factory $HomeErrorStateCopyWith(
          HomeErrorState value, $Res Function(HomeErrorState) then) =
      _$HomeErrorStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeErrorStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements $HomeErrorStateCopyWith<$Res> {
  _$HomeErrorStateCopyWithImpl(
      HomeErrorState _value, $Res Function(HomeErrorState) _then)
      : super(_value, (v) => _then(v as HomeErrorState));

  @override
  HomeErrorState get _value => super._value as HomeErrorState;
}

/// @nodoc

class _$HomeErrorState implements HomeErrorState {
  const _$HomeErrorState();

  @override
  String toString() {
    return 'HomeState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is HomeErrorState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            int pieChartIndex, List<double>? barChartData, double? maxRod)
        loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            int pieChartIndex, List<double>? barChartData, double? maxRod)?
        loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeInitialState value) initial,
    required TResult Function(HomeLoadingState value) loading,
    required TResult Function(HomeLoadedState value) loaded,
    required TResult Function(HomeErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeInitialState value)? initial,
    TResult Function(HomeLoadingState value)? loading,
    TResult Function(HomeLoadedState value)? loaded,
    TResult Function(HomeErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class HomeErrorState implements HomeState {
  const factory HomeErrorState() = _$HomeErrorState;
}
