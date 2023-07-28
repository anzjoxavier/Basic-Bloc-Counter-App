import 'package:bloc_test/bloc_test.dart';
import 'package:bloctutorialapp/Counter/Counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("CounterCubit", () {
    late CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });
    tearDown(() {
      counterCubit.close();
    });
    test("Counter Intialization", () {
      expect(counterCubit.state,
          CounterState(counterValue: 0, wasIncremented: false));
    });

    blocTest("Increment Operation", build: () => counterCubit,
    act: (cubit)=>cubit.increment(),
    expect: () => [CounterState(counterValue: 1, wasIncremented: true)],
    );

    blocTest("Decrement Operation", build: () => counterCubit,
    act: (cubit)=>cubit.decrement(),
    expect: () => [CounterState(counterValue: -1, wasIncremented: false)],
    );



  });
}
