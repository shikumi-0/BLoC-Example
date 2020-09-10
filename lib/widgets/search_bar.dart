import 'package:flutter/material.dart';
import 'package:bloc_ex/bloc/players_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: TextField(
        onChanged: (term) {
          BlocProvider.of<PlayersBloc>(context)
              .add(SearchTextChange(searchTerm: term));
        },
        //style: searchTextStyle,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          hintStyle: TextStyle(color: Colors.white),
          hintText: 'Search',
          prefixIcon: Icon(
            Icons.search,
            size: 30.0,
            color: Colors.white70,
          ),
        ),
      ),
    );
  }
}
