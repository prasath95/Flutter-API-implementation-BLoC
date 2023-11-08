import 'package:flutter/material.dart';
import 'package:flutter_bloc/src/repository_provider.dart';
import 'package:mcqer/Home.dart';
import 'package:mcqer/network/UserRepository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RepositoryProvider(
        create: (context) => UserRepository(),
        child: const Home(),
      ),
    );
  }
}
