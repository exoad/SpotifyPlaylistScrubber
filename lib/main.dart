import 'package:flutter/material.dart';
import 'package:spotify_playlist_scrubber/bits/spotify.dart';
import 'package:spotify_playlist_scrubber/env.dart';
import 'parts/parts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initSpotifyApi(Env.spotifyClientId, Env.spotifyClientSecret);
  setUserID(debugUserID);
  runApp(const AppWrapper());
}
