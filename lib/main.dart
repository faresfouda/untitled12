import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/shared/bloc_observer.dart';

import 'layout/home_layout.dart';
import 'modules/bmi/bmi_screen.dart';
import 'modules/counter/Counter_Screen.dart';
import 'modules/login/Login_Screen.dart';
import 'modules/testing/validation.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
  MyApp app =MyApp();
}

class MyApp extends StatelessWidget
{
@override
  Widget build(BuildContext context)
  {
return MaterialApp(
  debugShowCheckedModeBanner: false,
  home: HomeLayout(),

);
  }
}