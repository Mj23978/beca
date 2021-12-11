import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartx/dartx.dart';


part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState);

  // TransactionHive transactionHive = TransactionHive();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    // currentState.
    yield* event.map(
      barChart: (e) => _mapBarChartToState(e),
      compute: (e) => _mapComputeToState(e),
      clickPieChart: (e) => _mapClickPieChartToState(e),
      loading: (e) => _mapLoadingToState(e),
      loadData: (e) => _mapLoadToState(e),
    );
  }

  Stream<HomeState> _mapClickPieChartToState(HomeClickPieChartEvent e) async* {
    state.map(
      initial: (s) => 0,
      loading: (s) => 0,
      loaded: (s) => s,
      error: (s) => 0,
    );
    yield HomeLoadedState(pieChartIndex: e.index);
  }

  Stream<HomeState> _mapLoadToState(HomeLoadDataEvent e) async* {
    yield HomeLoadedState(pieChartIndex: 0);
  }

  Stream<HomeState> _mapLoadingToState(HomeLoadingEvent e) async* {
    yield HomeLoadedState(pieChartIndex: 0);
  }

  Stream<HomeState> _mapComputeToState(HomeComputeEvent e) async* {
    yield HomeLoadingState();
  }

  Stream<HomeState> _mapBarChartToState(HomeBarChartEvent e) async* {
    final List<double> barData = [];
    // for (final list in e.barData) {
    //   final newList = list.map((e) => e.amount);
    //   barData.add(newList.reduce((total, e) => total + e));
    // }
    print(barData.max());
    print(barData.min());
    yield HomeLoadedState(barChartData: barData, pieChartIndex: 0);
  }
}
