// ignore_for_file: public_member_api_docs, sort_constructors_first, unrelated_type_equality_checks
// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:equatable/equatable.dart';
import 'package:test/test.dart';

import 'package:bloctutorialapp/Constants/enums.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription ConnectivityStreamSubscription;
  InternetCubit({
    required this.connectivity,
  }) : super(InternetLoading()) {
    ConnectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.wifi) {
        print(connectivityResult);
        emitInternetConnected(ConnectedType.Wifi);
      } else if (connectivityResult == ConnectivityResult.mobile) {
        emitInternetConnected(ConnectedType.Mobile);
      } else if (connectivityResult == ConnectivityResult.none) {
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected(ConnectedType connectedType) =>
      emit(InternetConnected(connectedType));
  void emitInternetDisconnected() => emits(InternetDisconnected());

  @override
  Future<void> close() {
    ConnectivityStreamSubscription.cancel();
    return super.close();
  }
}
