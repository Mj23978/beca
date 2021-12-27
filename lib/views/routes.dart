import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'home_view/home_view.dart';

class HomeLocation extends BeamLocation {

  @override
  List<BeamPage> buildPages(BuildContext context, state) {
    return [
      BeamPage(
        key: const ValueKey("home"),
        child: HomeView(),
      ),
    ];
  }

  @override
  List<String> get pathPatterns => ["/"];
}