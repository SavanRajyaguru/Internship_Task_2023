import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/screens/feb14_screen/cubit/counter_cubit.dart';
import 'package:project1/screens/feb14_screen/widget/Counter2_Screen.dart';
import 'package:project1/screens/feb14_screen/widget/Counter3_Screen.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _color = Colors.blue;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Counter Demo'),
        backgroundColor: _color,
      ),
      body: BlocConsumer<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.isPressed == false) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Decrement ' + state.counter.toString()),
              duration: const Duration(milliseconds: 100),
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Increment ' + state.counter.toString()),
              duration: const Duration(milliseconds: 100),
            ));
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                    if (state.counter < 0) {
                      return Text(
                        'Counter is less than 0\n' + state.counter.toString(),
                        style: const TextStyle(fontSize: 28.0),
                      );
                    }
                    return Text(
                      'Counter:- ' + state.counter.toString(),
                      style: const TextStyle(fontSize: 28.0),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 100.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    backgroundColor: _color,
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    backgroundColor: _color,
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(
                height: 80.0,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/secondCounter');
                },
                color: Colors.red,
                padding: EdgeInsets.all(20.0),
                elevation: 5,
                child: Text('Goto second screen'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/thirdCounter');
                },
                color: Colors.cyan,
                padding: EdgeInsets.all(20.0),
                elevation: 5,
                child: Text('Goto third screen'),
              ),
            ],
          );
        },
      ),
    );
  }
}
