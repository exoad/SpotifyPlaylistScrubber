import 'package:envied/envied.dart';

part './env.g.dart';

@Envied(path: ".env")
abstract class Env {
  @EnviedField(varName: "SPOTIFY_CLIENT_ID")
  static const String spotifyClientId = _Env.spotifyClientId;
  @EnviedField(varName: "SPOTIFY_CLIENT_SECRET")
  static const String spotifyClientSecret = _Env.spotifyClientSecret;
}