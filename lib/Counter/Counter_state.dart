// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'Counter_cubit.dart';

class CounterState extends Equatable {
  int counterValue;
  bool wasIncremented;
  CounterState({
    required this.counterValue,
    required this.wasIncremented
  });
  
  @override
  List<Object?> get props =>[counterValue,wasIncremented];
}
