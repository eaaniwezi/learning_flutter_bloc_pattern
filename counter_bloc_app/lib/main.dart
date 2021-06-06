import 'package:counter_bloc_app/logic/cubit/counter_cubit.dart';
import './presentations/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counter_bloc_app/presentations/screens/home_screen.dart';
import 'presentations/screens/second_screen.dart';

void main() {
  final CounterState counterState1 = CounterState(counterValue: 1);
  final CounterState counterState2 = CounterState(counterValue: 1);
  print(counterState1 == counterState2);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      lazy: false,
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Bloc Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/': (context) => BlocProvider.value(
              value: _counterCubit,
              child: HomeScreen(title: "Home Screen", color: Colors.pink)),
          '/second': (context) => BlocProvider.value(
              value: _counterCubit,
              child:
                  SecondScreen(title: "Second Screen", color: Colors.orange)),
          '/third': (context) => BlocProvider.value(
              value: _counterCubit,
              child: ThirdScreen(title: "Third Screen", color: Colors.brown))
        },
      ),
    );
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }
}
