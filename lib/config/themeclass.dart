import 'dart:io';

import 'package:kbbloctest/config/constre.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


class ThemeClass {
  static SystemUiOverlayStyle getStatusBarStyle({Color? myColor,bool isdark = true, bool isSetPortrait = true}) {


    Color? setColor = (myColor != null) ? myColor : kPrimaryDarkColor;

    SystemUiOverlayStyle sc = new SystemUiOverlayStyle(
      statusBarColor: setColor,
      statusBarIconBrightness: (isdark == true) ?  Brightness.dark : Brightness.light,
      statusBarBrightness: (isdark == true) ?  Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: setColor,
      systemNavigationBarIconBrightness: (isdark == true) ?  Brightness.dark : Brightness.light,
    );

    if(isSetPortrait == true) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
    }


    return sc;
  }

  static ThemeData LightTheme(context) {
    ThemeData lightTheme = ThemeData(
        brightness: Brightness.light,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: kPrimaryColor,
              primary: kPrimaryColor,
            ),
        primarySwatch: myColor,
        primaryColor: kPrimaryColor,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: textColor,
          selectionColor: kPrimaryColor,
          selectionHandleColor: kPrimaryColor,
        ));
    return lightTheme;
  }

  static ThemeData darkTheme(context) {
    ThemeData darkTheme = ThemeData(
        brightness: Brightness.light,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        appBarTheme: AppBarTheme(
            backgroundColor: kPrimaryColor,
            centerTitle: false,
            systemOverlayStyle: ThemeClass.getStatusBarStyle()),
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: kPrimaryColor,
              primary: kPrimaryColor,
            ),
        primarySwatch: myColor,
        primaryColor: kPrimaryColor,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: textColor,
          selectionColor: kPrimaryColor,
          selectionHandleColor: kPrimaryColor,
        ));

    return darkTheme;
  }
}
