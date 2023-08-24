import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

const String appName = "Donte The Blood";

const Color? kPrimaryColor = Color(0xFFd80032);
const Color? kPrimaryLightColor = Color(0xFFff525c);
const Color? kPrimaryDarkColor = Color(0xFF9e000d);

const Color? bgColor = Color(0xFFFFFFFF);
const Color? bgLightDarkColor = Color(0xFFF4F4F4);
const Color? bgLightDarkSecondColor = Color(0xFFF2F2F2);
const Color? textGrayDarkColor = Color(0xFF78797D);
const Color? textLightColor = Color(0xFFFFFFFF);

const Color? shadowColor = Color(0xFFF1F1F1F1);
const Color? textColor = Color(0xFF333333);
const Color? textDarkColor = Color(0xFF050505);
const Color? textGrayColor = Color(0xFFC1C0C5);



// Toast Color
const Color? tErrorColor = Color(0xFFEF5350);
const Color? tInfoColor = Color(0xFF29B6F6);
const Color? tSuccessColor = Color(0xFF66BB6A);
const Color? tWarningColor = Color(0xFFFFA726);
const Color? tWhiteColor = Color(0xFFFFFFFF);

void kbNToast(msg, which, context) {
  if (which == null) which = 'e';
  if (which == 'e') {
    showToast(msg,
      context: context,
      backgroundColor: tErrorColor,
      isHideKeyboard: true,
      textStyle: TextStyle(color: tWhiteColor),
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.bottom,
      animDuration: Duration(seconds: 1),
      duration: Duration(seconds: 4),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,
    );
  } else if (which == 's') {
    showToast(msg,
      context: context,
      backgroundColor: tSuccessColor,
      isHideKeyboard: true,
      textStyle: TextStyle(color: tWhiteColor),
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.bottom,
      animDuration: Duration(seconds: 1),
      duration: Duration(seconds: 4),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,
    );
  } else if (which == 'w') {
    showToast(msg,
      context: context,
      backgroundColor: tWarningColor,
      isHideKeyboard: true,
      textStyle: TextStyle(color: tWhiteColor),
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.bottom,
      animDuration: Duration(seconds: 1),
      duration: Duration(seconds: 4),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,
    );
  } else if (which == 'i') {
    showToast(msg,
      context: context,
      backgroundColor: tInfoColor,
      isHideKeyboard: true,
      textStyle: TextStyle(color: tWhiteColor),
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.bottom,
      animDuration: Duration(seconds: 1),
      duration: Duration(seconds: 4),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,
    );
  }

}

MaterialColor myColor = MaterialColor(0xFFff525c, color);

Map<int, Color> color = {
  50: Color(0xFFff525c),
  100: Color(0xFFff525c),
  200: Color(0xFFff525c),
  300: Color(0xFFff525c),
  400: Color(0xFFd80032),
  500: Color(0xFFd80032),
  600: Color(0xFFd80032),
  700: Color(0xFF9e000d),
  800: Color(0xFF9e000d),
  900: Color(0xFF9e000d),
};

Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };

  return kPrimaryColor!;
}
