import 'package:spotify/spotify.dart';
import 'package:url_launcher/url_launcher.dart';

late final SpotifyApiCredentials _spotifyApiCredentials;
late final SpotifyApi _spotifyApi;

late String userID;

void setUserID(String id) => userID = id;

void initSpotifyApi(String clientId, String clientSecret) {
  _spotifyApiCredentials =
      SpotifyApiCredentials(clientId, clientSecret);
  _spotifyApi = SpotifyApi(_spotifyApiCredentials);
}

Future<Iterable<PlaylistSimple>> getPlaylists(
    [String? uID,
    int searchLimit = defaultLimit,
    int offset = 0]) async {
  assert(userID.isNotEmpty,
      "The provided userID is not usable as it is empty!");
  return await _spotifyApi.playlists
      .getUsersPlaylists(uID ?? userID, offset)
      .all(searchLimit);
}

String formatPlaylistURI(String uri) {
  List<String> splits = uri.split(":");
  return splits[splits.length - 1];
}

Future<void> launchPlaylistInBrowser_URI(String uri) async {
  await launchUrl(Uri.parse(
      "https://open.spotify.com/playlist/${formatPlaylistURI(uri)}"));
}

int defaultSearchLimit() => defaultLimit;
SpotifyApiCredentials credentials() => _spotifyApiCredentials;

// debug
String debugUserID = "6upazxk1cqaqq1ct3d9jviaau";

/*
https://open.spotify.com/playlist/3SYOFsaSRtnJIEQla3tIWo?si=c931b6bfe6ba4fe8
*/