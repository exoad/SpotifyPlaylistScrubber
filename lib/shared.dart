import 'package:simple_logger/simple_logger.dart';
import 'package:spotify/spotify.dart';
import 'package:spotify_playlist_scrubber/env.dart';

final SpotifyApiCredentials spotifyApiCredentials =
    SpotifyApiCredentials(
        Env.spotifyClientId, Env.spotifyClientSecret);

final SpotifyApi spotifyApi = SpotifyApi(spotifyApiCredentials);

final SimpleLogger logger = SimpleLogger();
