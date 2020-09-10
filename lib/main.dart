import 'package:bloc_ex/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:bloc_ex/player_repo/player_repo.dart';

void main() {
  PlayerRepo _repository = PlayerRepo();
  runApp(MyApp(playerRepo: _repository));
}

class MyApp extends StatelessWidget {
  final PlayerRepo playerRepo;
  MyApp({this.playerRepo});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Implementation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "GoogleSans",
        primarySwatch: Colors.blue,
      ),
      home: HomePage(playerRepo: playerRepo),
    );
  }
}
