# spotify_playlist_scrubber

**Work in progress**

Download (aka 'scrub') a Spotify playlist to download the songs.

# Building

### Spotify Tokens
For now, to run and build the application properly, you must enter your own Spotify ID and Spotify Secret (acquired through the Spotify Developer Portal).

1. Acquire a `Client ID` and `Client Secret` from the Spotify Developer Portal.
2. Create a `.env` file at the root of this project
3. Write and fill out the following in the `.env` file you have created:
```
SPOTIFY_CLIENT_ID=
SPOTIFY_CLIENT_SECRET=
```
4. Make sure you have `build_runner` and `envied_builder` installed. (hint: try running `flutter pub get`)
5. Then run `dart run build_runner build`
6. After that you should have an `env.g.dart` file located next to `env.dart`
