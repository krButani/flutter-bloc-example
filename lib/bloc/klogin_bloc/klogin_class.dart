
import 'package:kbbloctest/data/auth/logindata.dart';

abstract class LoginState {
  LoginData ld = new LoginData();
  void setLoginData(ld) {
    this.ld =ld;
  }
  LoginData getLodingData() {
    return this.ld;
  }
}

abstract class KloginEvent {}