import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'home_view/home_view.dart';

class HomeLocation extends BeamLocation {

  // HomeLocation(BeamState state) : super(state);

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    print(
        "parameters: ${state.pathParameters} - blueprints: ${state.pathBlueprintSegments} - query: ${state.queryParameters}");
    return [
      BeamPage(
        key: const ValueKey("home"),
        child: HomeView(),
      ),
    ];
  }

  @override
  List<String> get pathBlueprints => ["/"];
}