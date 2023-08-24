import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kbbloctest/bloc/klogin_bloc/klogin_bloc.dart';
import 'package:kbbloctest/config/constre.dart';
import 'package:kbbloctest/config/themeclass.dart';
import 'package:kbbloctest/views/KBFrom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => KloginBloc(),
      child: MaterialApp(
        title: appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeClass.LightTheme(context),
        home: KBFrom(),
      ),
    );
  }
}
