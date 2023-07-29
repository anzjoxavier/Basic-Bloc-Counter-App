part of 'internet_cubit.dart';

abstract class InternetState extends Equatable {
  const InternetState();

  @override
  List<Object> get props => [];
}

class InternetLoading extends InternetState {}

class InternetConnected extends InternetState {
  final ConnectedType connectedType;
  @override
  List<Object> get props => [connectedType];
  const InternetConnected(this.connectedType);
}

class InternetDisconnected extends InternetState {}
