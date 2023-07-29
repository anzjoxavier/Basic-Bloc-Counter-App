import 'package:bloctutorialapp/Constants/enums.dart';
import 'package:bloctutorialapp/Counter/Counter_cubit.dart';
import 'package:bloctutorialapp/Counter/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title, required this.color});
  final String title;
  final Color color;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
              if (state is InternetConnected &&
                  state.connectedType == ConnectedType.Wifi) {
                return const Text("Wifi");
              } else if (state is InternetConnected &&
                  state.connectedType == ConnectedType.Mobile) {
                return const Text("Mobile Data");
              } else if (state is InternetDisconnected) {
                return const Text("Internet Disconnected");
              }
              return const CircularProgressIndicator();
            }),
            Builder(builder: (context) {
              final counterState = context.watch<CounterCubit>().state;
              final internetState = context.watch<InternetCubit>().state;

               if (internetState is InternetConnected &&
                  internetState.connectedType == ConnectedType.Wifi) {
                return  Text( "Counter: ${counterState.counterValue} ConnectionType: Wifi");
              } else if (internetState is InternetConnected &&
                  internetState.connectedType == ConnectedType.Mobile) {
                return  Text( "Counter: ${counterState.counterValue} ConnectionType: Mobile");
              }
              return  Text( "Counter: ${counterState.counterValue} ConnectionType: Disconnected");
            }),
            // BlocConsumer<CounterCubit, CounterState>(
            //   listener: (context, state) {
            //     if (state.wasIncremented == true) {
            //       ScaffoldMessenger.of(context).showSnackBar(P
            //         const SnackBar(
            //             duration: Duration(milliseconds: 1),
            //             content: Text("Incremented")),
            //       );
            //     }
            //   },
            //   builder: (context, state) {
            //     return Text(
            //       state.counterValue.toString(),
            //       style: Theme.of(context).textTheme.headlineMedium,
            //     );
            //   },
            // ),
            Builder(builder: (context){
              final counterValue=context.select((CounterCubit counterCubit) =>counterCubit.state.counterValue);
              return Text("CounterValue:$counterValue");
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.minimize),
                ),
                const SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                )
              ],
            ),
            MaterialButton(
              color: widget.color,
              onPressed: () {
                Navigator.of(context).pushNamed('/second_screen');
              },
              child: const Text(
                "Go to Second Page",
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: widget.color,
              onPressed: () {
                Navigator.of(context).pushNamed('/third_screen');
              },
              child: const Text(
                "Go to Third Page",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
