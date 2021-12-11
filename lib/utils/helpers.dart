import 'package:dartz/dartz.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

dynamic enumFromString(String? value, dynamic t) {
  return t.values.firstWhere(
      (e) => e.toString().split('.')[1].toUpperCase() == value!.toUpperCase());
}

TextStyle textStyle(
  double size, {
  color = const Color(0xff222333),
  weight = FontWeight.w500,
}) {
  // if (["fa", "ar"].contains(Get.locale?.languageCode)) {
  //   return GoogleFonts.lalezar(
  //       fontSize: size, fontWeight: weight, color: color);
  // }
  return GoogleFonts.rubik(fontSize: size, fontWeight: weight, color: color);
}

int gridTileCount(double maxWidth, [size = 135.0]) {
  final tileSize = maxWidth / size;
  final res = tileSize.round() == 0
      ? 1
      : (2.8 >= tileSize && tileSize >= 1.85)
          ? 2
          : tileSize;
  return res.round();
}

Future baseFlash(
  BuildContext context,
  Function1<FlashController, Widget> builder, {
  bool dismissHorizental = false,
  backgroundColor = Colors.transparent,
  boxShadows: const [BoxShadow(blurRadius: 2)],
}) {
  return showFlash(
    context: context,
    builder: (context, controller) {
      return Flash.dialog(
        controller: controller,
        backgroundColor: backgroundColor,
        boxShadows: boxShadows,
        brightness: Brightness.light,
        horizontalDismissDirection:
            dismissHorizental ? HorizontalDismissDirection.horizontal : null,
        barrierBlur: 2.0,
        enableDrag: true,
        barrierColor: Colors.black12,
        barrierDismissible: true,
        child: builder(controller),
      );
    },
  );
}


String indexToString(int index) {
  switch (index) {
    case 0:
     return "first";
    case 1:
     return "second";
    case 2:
     return "third";
    case 3:
     return "fourth";
    case 4:
     return "fifth";
    default:
     return "first";
  }
}

String indexToWeekday(int index, [short = false]) {
  switch (index) {
    case 1:
     return short ? "Mon" : "Monday";
    case 2:
     return short ? "Tue" : "Tuesday";
    case 3:
     return short ? "Wed" : "Wensday";
    case 4:
     return short ? "Thu" : "Thursday";
    case 5:
     return short ? "Fri" : "Friday";
    case 6:
     return short ? "Sat" : "Saturday";
    case 7:
     return short ? "Sun" : "Sunday";
    default:
     return short ? "Mon" : "Monday";
  }
}