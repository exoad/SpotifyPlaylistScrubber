import 'package:flutter/material.dart';
import 'package:spotify_playlist_scrubber/parts/playlist_listview.dart';

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Scaffold(body: PlaylistsView()));
  }
}
