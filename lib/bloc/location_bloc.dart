



import 'dart:async';

import 'package:flutter_appim/bloc/main_bloc.dart';
import 'package:flutter_appim/data/location.dart';

class LocationBloc implements Bloc {
  Location _location;
  Location get location => _location;

  final _locationController = StreamController<Location>();

  Stream<Location> get locationStream => _locationController.stream;

  void selectLocation(Location location) {
    _location = location;
    _locationController.sink.add(location);
  }

  @override
  void dispose() {
    _locationController.close();
  }

}