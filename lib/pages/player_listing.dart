import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_ex/widgets/message.dart';
import 'package:bloc_ex/pages/player_profile.dart';
import 'package:bloc_ex/model/api_model.dart';
import 'package:bloc_ex/bloc/players_bloc.dart';

class PlayerListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayersBloc, PlayersState>(
      builder: (context, state) {
        if (state is PlayersUninitialized) {
          return Message(message: "Unintialised State");
        } else if (state is PlayerEmpty) {
          return Message(message: "No Players found");
        } else if (state is PlayerError) {
          return Message(message: "Something went wrong");
        } else if (state is PlayerFetching) {
          return Expanded(child: Center(child: CircularProgressIndicator()));
        } else {
          final stateAsPlayerFetchedState = state as PlayerFetched;
          final players = stateAsPlayerFetchedState.players;
          return buildPlayersList(players);
        }
      },
    );
  }

  Widget buildPlayersList(List<Players> players) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (BuildContext context, index) {
          Players player = players[index];
          return Container(
            color: Colors.white30,
            child: ListTile(
              leading: CircleAvatar(
                child: Image.network(
                  player.headshot.imgUrl,
                ),
                radius: 30.0,
                backgroundColor: Colors.blue[50],
              ),
              title: Text(
                player.name,
                style: TextStyle(fontSize: 22.0, color: Colors.black),
              ),
              subtitle: Text(
                "Age: " + player.age.toString(),
                style: TextStyle(fontSize: 16.0, color: Colors.black87),
              ),
              trailing: IconButton(
                icon: Icon(Icons.chevron_right),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlayerProfile(player)));
                },
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, index) {
          return Divider(
            height: 8.0,
            color: Colors.transparent,
          );
        },
        itemCount: players.length,
      ),
    );
  }
}
