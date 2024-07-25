import 'package:dars_64_home/bloc/stones_bloc.dart';
import 'package:dars_64_home/ui/screens/stones_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StonesBloc(),
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: PuzzleScreen()),
    );
  }
}
