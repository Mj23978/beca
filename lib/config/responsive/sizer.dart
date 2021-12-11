import 'package:flutter/material.dart';

class SizerUtil {
  static late double _width;
  static late double _height;
  static late double _x;
  static late double _y;
  static Orientation? _orientation;
  static DeviceType? _deviceType;

  void init(BoxConstraints constraints, Orientation orientation) {
    //use constraints object for maxWidth and maxHeight of device screen

    _orientation = orientation;
    if (orientation == Orientation.portrait) {
      _width = constraints.maxWidth;
      _height = constraints.maxHeight;
    } else {
      _width = constraints.maxHeight;
      _height = constraints.maxWidth;
    }
    _x = constraints.maxWidth;
    _y = constraints.maxHeight;

    //for mobile and tablet screen
    if (_x > 1000) {
      _deviceType = DeviceType.Desktop;
    } else if (_x > 520) {
      _deviceType = DeviceType.Tablet;
    } else {
      _deviceType = DeviceType.Mobile;
    }
  }

  //If you want to set height 50% of screen height then follow this method
  // screenHeight * yourInput /100;
  static double height(double i) {
    return _height * i / 100;
  }

  //If you want to set width 50% of screen width then follow this method
  // screenWidth * yourInput /100;
  static double width(double i) {
    return _width * i / 100;
  }

  //If you want to set height 50% of screen height then follow this method
  // screenHeight * yourInput /100;
  static double y(double i) {
    return _y * i / 100;
  }

  //If you want to set width 50% of screen width then follow this method
  // screenWidth * yourInput /100;
  static double x(double i) {
    return _x * i / 100;
  }

  //If you want to set textSize 50% of screen width then follow this method
  // screenWidth * yourInput /1000;
  static double sp(double i) {
    return _width / 100 * (i / 3);
  }

  static double getSP(double size) {
    return 1.0.sp > 2.8
        ? 1.0.sp < 1.2
            ? size.sp
            : size.sp - (size.sp * 0.3)
        : size.sp - (size.sp * 0.2);
  }
  
  static double getSSP(double size) {
    return 1.0.sp > 2.8
        ? 1.0.sp < 1.2
            ? size.sp
            : size.sp - (size.sp * 0.5)
        : size.sp - (size.sp * 0.35);
  }

  static double getSSSP(double size) {
    return 1.0.sp > 2.8
        ? 1.0.sp < 1.2
            ? size.sp
            : size.sp - (size.sp * 0.7)
        : size.sp - (size.sp * 0.5);
  }

  static get orientation => _orientation;

  static get deviceType => _deviceType;
}

enum DeviceType {
  Mobile,
  Tablet,
  Desktop
}

extension SizerExt on double {
  //How to use

  //Whenever you use height then use this method like this => [20.0.h]
  double get h => SizerUtil.height(this);

  //Whenever you use width then use this method like this => [10.0.w]
  double get w => SizerUtil.width(this);

  //Whenever you use height then use this method like this => [15.0.x]
  double get x => SizerUtil.x(this);

  //Whenever you use width then use this method like this => [3.0.y]
  double get y => SizerUtil.y(this);

  //Whenever you use text size then use this method like this => [5.0.sp]
  double get sp => SizerUtil.sp(this);

  //Whenever you use text size then use this method like this => [5.0.slowSP]
  //This sp change gets slower when width gets larger 
  double get slowSP => SizerUtil.getSP(this);

  //Whenever you use text size then use this method like this => [5.0.slowSP]
  //This sp change gets slower when width gets larger 
  double get slowerSP => SizerUtil.getSSP(this);

  //Whenever you use text size then use this method like this => [5.0.slowSP]
  //This sp change gets slower when width gets larger 
  double get slowestSP => SizerUtil.getSSSP(this);
}
