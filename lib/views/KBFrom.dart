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
