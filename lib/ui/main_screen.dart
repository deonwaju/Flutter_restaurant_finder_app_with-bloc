


import 'package:flutter/material.dart';
import 'package:flutter_appim/bloc/bloc_provider.dart';
import 'package:flutter_appim/bloc/location_bloc.dart';
import 'package:flutter_appim/data/location.dart';
import 'package:flutter_appim/ui/location_screen.dart';
import 'package:flutter_appim/ui/restaurant_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Location>(
      stream: BlocProvider.of<LocationBloc>(context).locationStream,
      builder: (context, snapshot) {
        final location = snapshot.data;

        if (location == null) {
          return LocationScreen();
        }
        return RestaurantScreen(location: location,);
      },
    );
  }
}
