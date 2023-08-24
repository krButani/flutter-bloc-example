import 'dart:math';

import 'package:flutter/material.dart';
extension SizeExtension on num {
  double get kp => FontHandel.setSp(this);
}
class FontHandel {
  static double screenWidth = 0;
  static double screenHeight = 0;
  MediaQueryData? _mediaQueryData;
  static Orientation? orientation;
  BuildContext? context;
  static Size _uiSize = Size(360, 690);
  void initContext(BuildContext context) {
    this.context = context;
    try {
      this._mediaQueryData = MediaQuery.of(context);
    } catch(e) {
      this._mediaQueryData = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    }
    FontHandel.screenWidth = _mediaQueryData!.size.width;
    FontHandel.screenHeight = _mediaQueryData!.size.height;
    FontHandel.orientation = _mediaQueryData!.orientation;
    FontHandel._uiSize = _mediaQueryData!.size;
  }
  static double getWSize(num value) {
    double? screenWidth = scaleWidth;
    return (screenWidth*value)/100;
  }

  static double get scaleWidth => screenWidth / _uiSize.width;

  //double get scaleHeight => (_splitScreenMode ? max(screenHeight, 700) : screenHeight) / _uiSize.height;

  static double get scaleHeight =>  max(screenHeight, 700) / _uiSize.height;

  static double get scaleText =>  min(scaleWidth, scaleHeight);

  static void  init() {
    screenWidth = _uiSize.width;
    screenHeight = _uiSize.height;
  }
  static double setSp(num fontSize) {
    init();
    return fontSize * scaleText;
  }

}
class KSize {
  MediaQueryData? _mediaQueryData;
  double screenWidth = 0;
  double screenHeight = 0;
  double defaultSize = 0;
  double topPadding = 0;
  double toolbarSize = 0;
  Orientation? orientation;
  FontHandel? fh;
  late Size _uiSize;


  KSize(BuildContext context, double _toolbarSize) {
    try {
      this._mediaQueryData = MediaQuery.of(context);
    } catch(e) {
      this._mediaQueryData = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    }
    this.screenWidth = _mediaQueryData!.size.width;
    this.screenHeight = _mediaQueryData!.size.height;
    this.orientation = _mediaQueryData!.orientation;
    this.topPadding = _mediaQueryData!.padding.top;
    this.toolbarSize = _toolbarSize;
    _uiSize = this._mediaQueryData!.size;
    fh = new FontHandel();
    fh!.initContext(context);
  }

  double get scaleWidth => screenWidth / _uiSize.width;

  //double get scaleHeight => (_splitScreenMode ? max(screenHeight, 700) : screenHeight) / _uiSize.height;

  double get scaleHeight =>  max(screenHeight, 700) / _uiSize.height;

  double get scaleText =>  min(scaleWidth, scaleHeight);


  double setSp(num fontSize) {
    return fontSize * scaleText;
  }

  double w(double value) {
    double? screenWidth = this.screenWidth;
    return (screenWidth*value)/100;
  }


  double h(double value) {
    double? screenWidth = this.screenHeight - this.topPadding - this.toolbarSize;
    return (screenWidth*value)/100;
  }
}