import 'dart:async';

import 'package:flutter_appim/bloc/main_bloc.dart';
import 'package:flutter_appim/data/location.dart';
import 'package:flutter_appim/data/restaurant.dart';
import 'package:flutter_appim/data/zomato_client.dart';

class RestaurantBloc implements Bloc {
  final Location location;
  final _client = ZomatoClient();
  final _controller = StreamController<List<Restaurant>>();

  Stream<List<Restaurant>> get stream => _controller.stream;
  RestaurantBloc(this.location);

  void submitQuery(String search) async {
    final results = await _client.fetchRestaurants(location, search);
    _controller.sink.add(results);
  }

  @override
  void dispose() {
    _controller.close();
  }
}