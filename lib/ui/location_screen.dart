
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appim/bloc/bloc_provider.dart';
import 'package:flutter_appim/bloc/location_bloc.dart';
import 'package:flutter_appim/bloc/location_search.dart';
import 'package:flutter_appim/data/location.dart';

class LocationScreen extends StatelessWidget {

  final bloc = LocationSearchBloc();
  final bool isFullScreenDialog;

  LocationScreen({Key key, this.isFullScreenDialog = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocationSearchBloc>(
      bloc: bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Where would you like to eat?'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter a Location'),
                onChanged: (search) => bloc.submitSearch(search),
              ),
            ),
            Expanded(
              child: _buildResults(bloc),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildResults(LocationSearchBloc bloc) {
    return StreamBuilder<List<Location>>(
      stream: bloc.locationStream,
      builder: (context, snapshot) {
        final results = snapshot.data;

        if (results == null) {
          return Center(
            child: Text('Enter your location'),
          );
        }
        if (results.isEmpty) {
          return Center(
            child: Text('No Results'),
          );
        }
        return _BuildSearchResults(results);
      },
    );
  }

  Widget _BuildSearchResults(List<Location> results) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: results.length,
        itemBuilder: (context, index) {
          final location = results[index];
          return ListTile(
            title: Text(location.title),
            onTap: () {
              final locationBloc = BlocProvider.of<LocationBloc>(context);
              locationBloc.selectLocation(location);

              if (isFullScreenDialog) {
                Navigator.of(context).pop();
              }
            },
          );
        },
    );
  }
}
