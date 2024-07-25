import 'package:dars_64_home/bloc/stones_bloc.dart';
import 'package:dars_64_home/bloc/stones_event.dart';
import 'package:dars_64_home/bloc/stones_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PuzzleScreen extends StatefulWidget {
  const PuzzleScreen({super.key});

  @override
  State<PuzzleScreen> createState() => _PuzzleScreenState();
}

class _PuzzleScreenState extends State<PuzzleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Puzzle15"),
        centerTitle: true,
      ),
      body: BlocBuilder<StonesBloc, StonesState>(
        builder: (context, state) {
          if (state is InitialStonesState) {
            return Center(
              child: FilledButton(
                  onPressed: () {
                    context.read<StonesBloc>().add(RandomStonesEvent());
                  },
                  child: Text("Start")),
            );
          }

          if (state is ErrorStonesState) {
            return const Center(
              child: Text("Xatolik kelib chiqdi"),
            );
          }

          if (state is LoadedStonesState) {
            if (listEquals(
                state.mp.values.toList(), state.finished.values.toList()))
              context.read<StonesBloc>().add(InitialStonesEvent());
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 380,
                    child: Wrap(
                      children: [
                        for (int i = 0; i < 16; i++)
                          InkWell(
                            onTap: () {
                              context.read<StonesBloc>().add(
                                  CheckStoneStonesEvent(
                                      i + 1, state.mp['${i + 1}']!));
                            },
                            child: Container(
                              margin: const EdgeInsets.all(2),
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                color: state.mp["${i + 1}"] == 0
                                    ? Colors.blue
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.green, width: 2),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "${state.mp["${i + 1}"] == 0 ? "" : state.mp["${i + 1}"]}",
                                style: const TextStyle(
                                    fontSize: 50,
                                    color: Color.fromARGB(255, 175, 79, 76)),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

          return Container();
        },
      ),
    );
  }
}
