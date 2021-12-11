import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uix/flutter_uix.dart';
import '../config/responsive/sizer.dart';

extension MafiaTextStyle on String {
  AutoSizeText homeButtonPrimaryTS(double size) =>
      text.color(const Color(0xFF2E9DDC)).size(size.slowSP).make();
  AutoSizeText lobbyCardTS(double size) =>
      text.color(const Color(0xFF2E9DDC)).size(size.slowerSP).make();
  AutoSizeText gameHistoryCardTS(double size) =>
      text.color(Colors.white).maxLines(1).size(size.slowestSP).make();
  AutoSizeText lobbyCard2TS(double size) =>
      text.color(const Color(0xFF2E9DDC)).size(size.slowerSP).make();
  AutoSizeText homeTitleTS(double size) =>
      text.color(Colors.white54).size(size.slowerSP).make();
  AutoSizeText roleCardTS(double size) =>
      text.color(Colors.white).size(size.slowSP).maxLines(1).make();
  // AutoSizeText lobbyGameTS(double size) => text.color(const Color(0xFF194775)).size(size.slowSP).make();
}

extension MafiaWidget on Widget {
  Flexible flex(int flex, {FlexFit? fit}) =>
      Flexible(flex: flex, fit: fit ?? FlexFit.loose, child: this);
}

extension IntExt on int {
  double percent(int part) => this / part;
}

extension DoubleExt on double {
  double percent(double part) => this / part;
}
