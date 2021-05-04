import 'package:counter_bloc_app/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title, this.color}) : super(key: key);

  final String title;
  final Color color;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
              if (state.wasIncremented == true) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Incremented!"),
                  duration: Duration(milliseconds: 300),
                ));
              } else if (state.wasIncremented == false) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Decremented!"),
                  duration: Duration(milliseconds: 300),
                ));
              }
            }, builder: (context, state) {
              return Text(
                state.counterValue.toString(),
                style: Theme.of(context).textTheme.headline4,
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
              ],
            ),
            SizedBox(height: 10),
            MaterialButton(
              onPressed: () {},
              color: widget.color,
              child: Text("Go to the Second Page"),
            ),
          ],
        ),
      ),
    );
  }
}
