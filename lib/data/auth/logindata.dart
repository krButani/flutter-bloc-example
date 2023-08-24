import 'package:flutter/material.dart';
import 'package:kbbloctest/control/handler/texthandler.dart';

class LoginData {

  //Variables
  

  // Contols Settings
  TextHandler phoneTH = TextHandler(hintText: "Mobile No.",keyboardtype:TextInputType.phone);
  TextHandler passwordTH = TextHandler(hintText: "Password",isPassword: true,keyboardtype:TextInputType.text,inputAction: TextInputAction.done);
  String errorText = "Loading workds";
}