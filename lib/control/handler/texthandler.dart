

import 'package:flutter/material.dart';

class TextHandler {
  var u = UniqueKey();
  var fc = FocusNode();
  TextEditingController tc = new TextEditingController();
  bool? isPassword = false;
  bool? isReadonly = true;

  TextInputAction? inputAction; // TextInputAction.done
  TextInputType? keyboardtype; // TextInputType.text

  String errorText = "";
  String hintText = "";

  DateTime? date;

  TextHandler({this.inputAction, this.keyboardtype, required this.hintText, this.isPassword, this.isReadonly});
}