# Bloc Undestanding

### Create Files

- You need to create 4 files

1. Block file (klogin_bloc.dart) 
   - it's contain entier block and handle events and state data. 
2. Class file (klogin_class.dart)
    - it's contain all abstract class which extends on events and state data.
3. Event file (klogin_event.dart)
   - it's contain all event when you fire on user interaction.
4. State File (klogin_state.dart)
   - it's contain all state that handle all data.

- All File Data as Following:

1. Block File Code

```
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
```
        
2. Class file Code

```
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
```

3. Event file Code

```
part of 'klogin_bloc.dart';


class LoginChangeControlEvent extends KloginEvent {
  final LoginData ld;
  LoginChangeControlEvent({required this.ld});
}

class LoginSubmitBtnEvent extends KloginEvent {
  final LoginData ld;
  LoginSubmitBtnEvent({required this.ld});
}
```

4. State file Code

```
part of 'klogin_bloc.dart';


class KloginState extends LoginState {
  KloginState({sld}) {
      if(sld != null)
          this.setLoginData(sld);
  }

}
```


### Now Implement Bloc

1. Create Page (KBForm.dart)

```
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbbloctest/bloc/klogin_bloc/klogin_bloc.dart';
import 'package:kbbloctest/config/KSize.dart';
import 'package:kbbloctest/config/constre.dart';

class KBFrom extends StatefulWidget {
  const KBFrom({Key? key}) : super(key: key);

  @override
  State<KBFrom> createState() => _KBFromState();
}

class _KBFromState extends State<KBFrom> {
  @override
  Widget build(BuildContext context) {
    KSize k = new KSize(
        context, 0
    );
    return SafeArea(
        child: Scaffold(
          backgroundColor: bgLightDarkColor,
          body: Container(
            width: k.w(100),
            height: k.h(100),
            child: SingleChildScrollView(
              child: BlocConsumer<KloginBloc, KloginState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      TextFormField(
                          key: state.ld!.phoneTH.u,
                          textInputAction: (state.ld!.phoneTH.inputAction != null)
                              ? state.ld!.phoneTH.inputAction
                              : TextInputAction.next,
                          keyboardType: (state.ld!.phoneTH.keyboardtype != null)
                              ? state.ld!.phoneTH.keyboardtype
                              : TextInputType.text,
                          focusNode: state.ld!.phoneTH.fc,
                          style: GoogleFonts.roboto(
                            fontSize: 14.kp,
                            color: textColor!.withOpacity(0.7),
                          ),
                          controller: state.ld!.phoneTH.tc,
                          enabled: (state.ld!.phoneTH.isReadonly != null)
                              ? state.ld!.phoneTH.isReadonly
                              : true,
                          decoration: new InputDecoration(
                            filled: true,
                            fillColor: bgColor,
                            prefixIcon: Icon(
                              Icons.phone_android,
                              color: textColor!.withOpacity(0.7),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: k.h(2.5), horizontal: k.w(5)),
                            errorText: (state.ld!.phoneTH.errorText != "")
                                ? state.ld!.phoneTH.errorText
                                : null,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                              BorderSide(color: tErrorColor!, width: 1),
                            ),
                            hintStyle: GoogleFonts.roboto(
                              fontSize: 14.kp,
                              color: textColor!.withOpacity(0.7),
                            ),
                            errorStyle: GoogleFonts.roboto(
                                fontSize: 14.kp,
                                color: tErrorColor!.withOpacity(0.9)),
                            hintText: state.ld!.phoneTH.hintText,
                          ),
                          onChanged: (val) {}),
                      Padding(
                        padding: EdgeInsets.only(top: k.h(1)),
                        child: TextFormField(
                            key: state.ld!.passwordTH.u,
                            obscureText: (state.ld!.passwordTH.isPassword != null)
                                ? state.ld!.passwordTH.isPassword!
                                : false,
                            textInputAction: (state.ld!.passwordTH.inputAction != null)
                                ? state.ld!.passwordTH.inputAction
                                : TextInputAction.next,
                            keyboardType: (state.ld!.passwordTH.keyboardtype != null)
                                ? state.ld!.passwordTH.keyboardtype
                                : TextInputType.text,
                            focusNode: state.ld!.passwordTH.fc,
                            style: TextStyle(
                              fontSize: 14.kp,
                              color: textColor!.withOpacity(0.7),
                            ),
                            controller: state.ld!.passwordTH.tc,
                            enabled: (state.ld!.passwordTH.isReadonly != null)
                                ? state.ld!.passwordTH.isReadonly
                                : true,
                            decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_outlined,
                                color: textColor!.withOpacity(0.7),
                              ),
                              filled: true,
                              fillColor: bgColor,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  (state.ld!.passwordTH.isPassword != null &&
                                      state.ld!.passwordTH.isPassword == true)
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: textColor!.withOpacity(0.7),
                                ),
                                onPressed: () {
                                  state.ld!.passwordTH.isPassword =
                                  !state.ld!.passwordTH.isPassword!;

                                  context.read<KloginBloc>().add(
                                    LoginChangeControlEvent(ld: state.ld!),
                                  );

                                  /*setState(() {
                              state.ld!.passwordTH.isPassword =
                                  !state.ld!.passwordTH.isPassword!;
                            });*/
                                },
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: k.h(2.5), horizontal: k.w(5)),
                              errorText: (state.ld!.passwordTH.errorText != "")
                                  ? state.ld!.passwordTH.errorText
                                  : null,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                BorderSide(color: tErrorColor!, width: 1),
                              ),
                              hintStyle: TextStyle(
                                fontSize: 14.kp,
                                color: textColor!.withOpacity(0.7),
                              ),
                              errorStyle: TextStyle(
                                  fontSize: 14.kp,
                                  color: tErrorColor!.withOpacity(0.9)),
                              hintText: state.ld!.passwordTH.hintText,
                            ),
                            onChanged: (val) {}),
                      ),
                      Container(
                          width: k.w(100),
                          margin: EdgeInsets.only(top: k.h(4)),
                          child: ElevatedButton(
                              onPressed: () {
                                /* validateorsubmit();*/
                                context.read<KloginBloc>().add(
                                  LoginSubmitBtnEvent(ld: state.ld!),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: kPrimaryColor,
                                foregroundColor: textLightColor,
                                padding: EdgeInsets.symmetric(
                                    vertical: k.h(2), horizontal: k.w(5)),
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                ),
                              ),
                              child: Text(
                                "SUBMIT",
                                style: GoogleFonts.ubuntu(
                                    color: textLightColor,
                                    fontSize: 16.kp,
                                    fontWeight: FontWeight.w500),
                              ))),
                    ],
                  );
                },
              ),
            ),
          ),
        ));
  }
}

```

#### Bloc Implementation

```
// import block
import 'package:kbbloctest/bloc/klogin_bloc/klogin_bloc.dart';

BlocConsumer<KloginBloc, KloginState>(
 listener: (context, state) {
   // TODO: implement listener
 },
 builder: (context, state) {
    return Widget();
 }
```

#### Called Event Class

1. event call inside builder function
```
// 
// kloginBloc is name of block 
context.read<KloginBloc>().add(LoginSubmitBtnEvent(ld: state.ld!),);


```
2. event call inside Bloc
```

// just write add function and inside function pass parameter event class as function.

add(InternetGainedEvent()); 

```

### Called State Class

1. State Called inside Bloc
```
emit(InternetLostState())
```


### Internet Connection Bloc Example

- other bloc, event and state file include in project you can refer if you needed.

```
BlocConsumer<InternetBloc, InternetState>(
 listener: (context, state) {
   if (state is InternetGainedState) {
     ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text("Internet Connected!"),
           backgroundColor: Colors.green,));
   } else if (state is InternetLostState) {
     ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text("Internet Not Connected!"),
           backgroundColor: Colors.red,));
   }
 },
 builder: (context, state) {
   if (state is InternetGainedState)
     return Text("Connected!");
   else if (state is InternetLostState)
     return Text("Not Connected!");
   else
     return Text("Loading...");
 },
)
```