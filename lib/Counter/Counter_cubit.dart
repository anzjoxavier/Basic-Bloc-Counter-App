// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'Counter_state.dart';

class CounterCubit extends HydratedCubit<CounterState> {
  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));
  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));

  CounterCubit() : super(CounterState(counterValue: 0, wasIncremented: false));

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    // addError(Exception("Couldn't Solve"), StackTrace.current);
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toMap();
  }

  // @override
  // void onChange(Change<CounterState> change) {
  //   print(change);
  //   super.onChange(change);
  // }

  // @override
  // void onError(Object error, StackTrace stackTrace) {
  //   // TODO: implement onError
  //   print("$error $stackTrace");
  //   super.onError(error, stackTrace);
  // }
}
