part of 'klogin_bloc.dart';


class LoginChangeControlEvent extends KloginEvent {
  final LoginData ld;
  LoginChangeControlEvent({required this.ld});
}

class LoginSubmitBtnEvent extends KloginEvent {
  final LoginData ld;
  LoginSubmitBtnEvent({required this.ld});
}