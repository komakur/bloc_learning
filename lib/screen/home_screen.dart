import 'package:flutter/material.dart';
import 'package:bloc_todo/bloc/bloc_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('Whole \'HomeScreen\' built');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BlocConsumer<CounterBloc, CounterState>(
              listener: (context, state) {
                if (state is IncrementState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Row(
                        children: const [
                          Text('Successfully increased'),
                          Icon(
                            Icons.arrow_upward,
                            color: Colors.blueAccent,
                            size: 15.0,
                          )
                        ],
                      ),
                      duration: const Duration(seconds: 1),
                      backgroundColor: Colors.greenAccent,
                    ),
                  );
                } else if (state is DecrementState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Row(
                        children: const [
                          Text('Successfully decreased'),
                          Icon(
                            Icons.arrow_downward,
                            color: Colors.redAccent,
                            size: 15.0,
                          ),
                        ],
                      ),
                      duration: const Duration(seconds: 1),
                      backgroundColor: Colors.greenAccent,
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Text(
                  'Conter value: ${state.counterValue}',
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                );
              },
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => context.read<CounterBloc>().add(
                          CounterDecrementEvent(),
                        ),
                    icon: const Icon(Icons.remove),
                    label: const Text('Decrease'),
                  ),
                ),
                const SizedBox(width: 30.0),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => context.read<CounterBloc>().add(
                          CounterIncrementEvent(),
                        ),
                    icon: const Icon(Icons.add),
                    label: const Text('Inrease'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
