import 'package:counter_bloc_app/logic/cubit/counter_cubit.dart';
import 'package:counter_bloc_app/presentations/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final CounterState counterState1 = CounterState(counterValue: 1);
  final CounterState counterState2 = CounterState(counterValue: 1);
  print(counterState1 == counterState2);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider<CounterCubit>(
        create: (context) => CounterCubit(),
        child: HomeScreen(
          title: 'Flutter Demo Home Page',
          color: Colors.red,
        ),
      ),
    );
  }
}
