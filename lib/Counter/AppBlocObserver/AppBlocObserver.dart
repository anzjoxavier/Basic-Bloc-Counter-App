import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    print(change);
    super.onChange(bloc, change);
  }

  @override
  void onCreate(BlocBase bloc) {
    // TODO: implement onCreate
    print(bloc);
    super.onCreate(bloc);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
    print("$bloc $transition");
    super.onTransition(bloc, transition);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
    print("$bloc $event");
    super.onEvent(bloc, event);
  }

  @override
  void onClose(BlocBase bloc) {
    // TODO: implement onClose
    print("$bloc");
    super.onClose(bloc);
  }
}
