import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_dectector/blocs/image_bloc.dart';
import 'package:photo_dectector/services/ai_service.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DetectPhoto Detector',
      theme: ThemeData(primarySwatch: Colors.green),
      home: BlocProvider(
        create: (_) => PhototBloc(MLService()),
        child: const HomeScreen(),
      ),
    );
  }
}
