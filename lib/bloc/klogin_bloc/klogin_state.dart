part of 'klogin_bloc.dart';


class KloginState extends LoginState {
  KloginState({sld}) {
      if(sld != null)
          this.setLoginData(sld);
  }

}