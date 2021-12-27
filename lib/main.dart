import 'package:beamer/beamer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

import 'utils/keys.dart';
import 'views/404/not_found_view.dart';
import 'views/home_view/home_view.dart';
import 'widgets/calendar/localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Beamer.setPathUrlStrategy();
  if (!kIsWeb) {
    final appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
  } else {
    Hive.initFlutter();
  }
  // BlocSupervisor.delegate = await HydratedBlocDelegate.build();
  Logger.level = Level.debug;

  await Hive.openBox(DBKeys.hive_user_email);
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  // BeamerDelegate initRouter(BuildContext context) {
    // final authGuard = BeamGuard(
    //   pathBlueprints: ['/game*', '', '/lobby*'],
    //   check: (context, location) => provider.authenticated,
    //   onCheckFailed: (context, location) =>
    //       print('failed ${location.state.uri}'),
    //   beamTo: (context) => LoginLocation(),
    // );
  //   return BeamerDelegate(
  //     notFoundPage:
  //         BeamPage(key: const ValueKey("notFound"), child: NotFoundView()),
  //     // guards: [authGuard],
  //   );
  // }

  @override
  Widget build(BuildContext context, watch) {
    // final auth = watch(authProvider);
    // final router = initRouter(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          TimetableLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate
        ],
        // routeInformationParser: BeamerParser(),
        title: "Starter",
        home: HomeView(),
        // routerDelegate: router,
        // backButtonDispatcher: BeamerBackButtonDispatcher(delegate: router),
    );
  }
}
