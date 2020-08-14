
import 'dart:async';

import 'package:flutter_appim/bloc/main_bloc.dart';
import 'package:flutter_appim/data/location.dart';
import 'package:flutter_appim/data/zomato_client.dart';

class LocationSearchBloc implements Bloc {
  final _controller = StreamController<List<Location>>();
  final _client = ZomatoClient();

  Stream<List<Location>> get locationStream => _controller.stream;

  void submitSearch(String search) async {
    final results = await _client.fetchLocations(search);
    _controller.sink.add(results);
  }

  @override
  void dispose() {
    _controller.close();
    // TODO: implement dispose
  }


}