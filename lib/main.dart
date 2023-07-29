// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, unused_element, must_be_immutable

import 'package:bloctutorialapp/Counter/AppBlocObserver/AppBlocObserver.dart';
import 'package:bloctutorialapp/Counter/internet_cubit.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloctutorialapp/Counter/Counter_cubit.dart';
import 'package:bloctutorialapp/Routes/Routes.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  Bloc.observer = AppBlocObserver();
  runApp(MyApp(
    connectivity: Connectivity(),
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  AppRouter appRouter;
  Connectivity connectivity;
  MyApp({
    Key? key,
    required this.appRouter,
    required this.connectivity,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
      ],
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
