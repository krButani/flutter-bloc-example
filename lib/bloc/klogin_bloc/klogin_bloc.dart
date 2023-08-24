import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kbbloctest/bloc/klogin_bloc/klogin_class.dart';
import 'package:kbbloctest/data/auth/logindata.dart';


part 'klogin_event.dart';
part 'klogin_state.dart';

class KloginBloc extends Bloc<KloginEvent, KloginState> {
  KloginBloc() : super(KloginState()) {

    on<LoginChangeControlEvent>((event, emit) {
      print("Button Change Control Event Called");
      emit(KloginState(sld:event.ld));
    });
    on<LoginSubmitBtnEvent>((event, emit)  {
      print("Button Event Called");
      LoginData ld = event.ld;
      if(ld.phoneTH.tc.text.toString().trim() == "") {
        ld.phoneTH.errorText = "Phone number is required.";
      }
      emit(KloginState(sld:event.ld));
    });
  }

}
