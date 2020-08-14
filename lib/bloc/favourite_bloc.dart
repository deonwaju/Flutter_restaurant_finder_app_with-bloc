import 'dart:async';

import 'package:flutter_appim/bloc/main_bloc.dart';
import 'package:flutter_appim/data/restaurant.dart';

class FavoriteBloc implements Bloc {
  var _restaurants = <Restaurant>[];
  List<Restaurant> get favorites => _restaurants;
  // 1
  final _controller = StreamController<List<Restaurant>>.broadcast();
  Stream<List<Restaurant>> get favoritesStream => _controller.stream;

  void toggleRestaurant(Restaurant restaurant) {
    if (_restaurants.contains(restaurant)) {
      _restaurants.remove(restaurant);
    } else {
      _restaurants.add(restaurant);
    }

    _controller.sink.add(_restaurants);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
