part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = HomeInitialState;
  
  const factory HomeState.loading() = HomeLoadingState;
  
  const factory HomeState.loaded({
    required int pieChartIndex,
    List<double>? barChartData,
    double? maxRod,
  }) = HomeLoadedState;
  
  const factory HomeState.error() = HomeErrorState;
}
