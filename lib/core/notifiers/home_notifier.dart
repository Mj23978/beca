import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../states/home_states.dart';

class HomeProvider extends StateNotifier<HomeState> {
  HomeProvider(HomeState state) : super(state);

}