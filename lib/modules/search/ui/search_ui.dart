import 'package:flutter/material.dart';
import 'package:flutter_heterogenous_json/core/helpers/view_state.dart';
import 'package:flutter_heterogenous_json/core/providers/provider.dart';
import 'package:flutter_heterogenous_json/modules/search/viewmodels/article_viewmodel.dart';
import 'package:flutter_heterogenous_json/modules/search/viewmodels/movies_viewmodel.dart';
import 'package:flutter_heterogenous_json/modules/search/viewmodels/series_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchUI extends ConsumerStatefulWidget {
  @override
  ConsumerState<SearchUI> createState() => _SearchUIState();
}

class _SearchUIState extends ConsumerState<SearchUI> {
  //late SearchDataStore dataStore;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var dataStore = ref.read(mqttManagerProvider);
    dataStore.fetchSearchItems();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Heterogenous JSON"),
      ),
      body: _buildStack(),
    );
  }

  Widget _buildStack() {
    var ds = ref.watch(mqttManagerProvider);
    if (ds.state == ViewState.Busy) {
      return const Center(child: CircularProgressIndicator());
    } else {
      var items = ds.searchListViewModel?.items;
      if (items == null) {
        return const Text("Unable to fetch data");
      }
      return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            var item = items[index];

            if (item is MoviesViewModel) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.green,
                  shadowColor: Colors.green[50],
                  child: ListTile(
                      title: Text(item.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Director: ${item.director}'),
                          Text('Length: ${item.length}'),
                          Text('Rating: ${item.rating}'),
                        ],
                      )),
                ),
              );
            } else if (item is SeriesViewModel) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.blue,
                  shadowColor: Colors.blue[50],
                  child: ListTile(
                      title: Text(item.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Director: ${item.director}'),
                          Text('Length: ${item.length}'),
                          Text('Rating: ${item.rating}'),
                          Text('Season: ${item.season}'),
                          Text('Episode: ${item.episode}'),
                        ],
                      )),
                ),
              );
            } else if (item is ArticleViewModel) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.orange,
                  shadowColor: Colors.orange[50],
                  child: ListTile(
                      title: Text(item.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Author: ${item.author}'),
                          Text('Rating: ${item.rating}'),
                        ],
                      )),
                ),
              );
            }
          });
    }
  }
}
