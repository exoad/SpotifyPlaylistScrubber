import 'package:flutter/material.dart';
import 'package:spotify_playlist_scrubber/bits/themes.dart';
import 'package:spotify_playlist_scrubber/parts/parts.dart';

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            floatingActionButton: FloatingActionButton(
                onPressed: () {},
                child: const Icon(
                  size: 28,
                  Icons.search_rounded,
                )),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endFloat,
            body: const Column(
              children: <Widget>[
                Expanded(child: PlaylistsListView()),
              ],
            )),
        theme: LaF.theme());
  }
}
