part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.clickPieChart({
    required int index,
  }) = HomeClickPieChartEvent;

  const factory HomeEvent.barChart({
    // required List<List<Transaction>> barData,
    double? max,
    double? total,
    int? average,
  }) = HomeBarChartEvent;

  const factory HomeEvent.loadData() = HomeLoadDataEvent;

  const factory HomeEvent.loading() = HomeLoadingEvent;

  const factory HomeEvent.compute() = HomeComputeEvent;
}
