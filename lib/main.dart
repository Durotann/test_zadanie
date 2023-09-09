import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_zadanie/data/repositories/repository.dart';
import 'package:test_zadanie/data/repositories/repository2.dart';
import 'package:test_zadanie/view/bronscreen/Presentation/bron_screen.dart';
import 'package:test_zadanie/view/bronscreen/bloc/bron_bloc.dart';
import 'package:test_zadanie/view/donescreen/Presentation/donescreen.dart';
import 'package:test_zadanie/view/homescreen/Presentation/home_screen.dart';

import 'data/repositories/repository3.dart';
import 'view/homescreen/bloc/home_screen_bloc.dart';
import 'view/nomerscreen/Presentation/nomer_screen.dart';
import 'view/nomerscreen/bloc/nomer_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = Repository();
    final repository1 = Repository2();
    final repository3 = Repository3();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeScreenBloc(repository),
        ),
        BlocProvider(
          create: (context) => NomerBloc(repository1),
        ),
        BlocProvider(create: (context) => BronBloc(repository3))
      ],
      child: Builder(builder: (context) {
        return MaterialApp(home: HomeScreen());
      }),
    );
  }
}
