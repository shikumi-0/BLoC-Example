import 'package:bloc_ex/pages/player_listing.dart';
import 'package:bloc_ex/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:bloc_ex/bloc/players_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_ex/player_repo/player_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_ex/widgets/horizontal_bar.dart';

class HomePage extends StatefulWidget {
  final PlayerRepo playerRepo;

  HomePage({this.playerRepo});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PlayersBloc _playersBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _playersBloc = PlayersBloc(playerRepo: widget.playerRepo);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => _playersBloc,
      child: Scaffold(
        backgroundColor: Colors.grey[600],
        appBar: AppBar(
          elevation: 0,
          title: Text('FootBall Players'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            HorizontalBar(),
            SizedBox(
              height: 20.0,
            ),
            SearchBar(),
            SizedBox(
              height: 20.0,
            ),
            PlayerListing(),
          ],
        ),
      ),
    );
  }
}
