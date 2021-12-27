import 'package:beca/core/notifiers/home_notifier.dart';
import 'package:beca/core/states/home_states.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

import 'auth_provider.dart';
import 'calendar_provider.dart';
import 'logger.dart';

final ProviderFamily<Logger, String> logger =
    Provider.family<Logger, String>((ref, scope) {
  return getLogger(scope);
});

// final calendarProvider = ChangeNotifierProvider.family<CalendarProvider, CalendarProviderInput>((ref, input) {
//   return CalendarProvider(input);
// });

// final calendarDayProvider = ChangeNotifierProvider.family<CalendarDayProvider, CalendarDayProviderInput>((ref, input) {
//   return CalendarDayProvider(input);
// });

// final allDayAppointmentProvider = ChangeNotifierProvider.family<AllDayAppointmentProvider, AllDayAppointmentProviderInput>((ref, input) {
//   return AllDayAppointmentProvider(input);
// });

// final calendarHeaderProvider = ChangeNotifierProvider.family<CalendarHeaderProvider, CalendarHeaderProviderInput>((ref, input) {
//   return CalendarHeaderProvider(input);
// });

final authProvider = ChangeNotifierProvider<AuthProvider>((ref) {
  return AuthProvider();
});

final homeProvider = StateNotifierProvider<HomeProvider, HomeState>((ref) {
  return HomeProvider(HomeState());
});
