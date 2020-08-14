import 'package:flutter/material.dart';
import 'package:flutter_appim/bloc/bloc_provider.dart';
import 'package:flutter_appim/bloc/favourite_bloc.dart';
import 'package:flutter_appim/bloc/location_bloc.dart';
import 'file:///C:/FlutterVS/flutter_appim/lib/ui/main_screen.dart';



void main() {
  runApp(RestaurantLocator());
}

class RestaurantLocator extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocationBloc>(
      bloc: LocationBloc(),
      child: BlocProvider<FavoriteBloc>(
        bloc: FavoriteBloc(),
        child: MaterialApp(
          title: 'Restaurant Finder',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: MainScreen(),
        ),
      )
    );
  }
}

