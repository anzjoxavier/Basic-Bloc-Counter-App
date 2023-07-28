// ignore_for_file: prefer_const_constructors, unused_element, must_be_immutable

import 'package:bloctutorialapp/Counter/Counter_cubit.dart';
import 'package:bloctutorialapp/Routes/Routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget{
  // This widget is the root of your application.
  AppRouter appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {


    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: appRouter.onGenerateRoute,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
