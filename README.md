# spotify_playlist_scrubber

> [!WARNING]
> This project is **work in progress**!

Download (aka 'scrub') a Spotify playlist to download songs/music from an alternate source (such as YouTube).

## Table of contents

* [**Building**](#building)
* [**Support**](#support)

# Building

1.  Clone this repository with `git clone https://github.com/exoad/SpotifyPlaylistScrubber.git`

> [!IMPORTANT]
> For now, to run and build the application properly, you must enter your own Spotify ID and Spotify Secret (acquired through the Spotify Developer Portal).

2. Acquire a `Client ID` and `Client Secret` from the Spotify Developer Portal. [Spotify Developer Dashboard](https://developer.spotify.com/dashboard)
3. Create a `.env` file at the root of this project
4. Write and fill out the following in the `.env` file you have created:
```
SPOTIFY_CLIENT_ID=place client id here
SPOTIFY_CLIENT_SECRET=place client secret here
```
4. Make sure you have `build_runner` and `envied_builder` installed. (hint: try running `flutter pub get`)
5. Then run `flutter pub run build_runner build` (if you forget this command, the `scripts/generate_env.sh` script can help you)
6. After that you should have an `env.g.dart` file located next to `env.dart`
7. `flutter run`

# Support

> [!NOTE]
> I do not plan to release/adapt this app for mobile platforms because of the increased complexity and need to focus on multiple platforms.

| Platform        	| Flavors             	| Performance 	| Support     	| Testing     	| Notes                    	|
|-----------------	|---------------------	|-------------	|-------------	|-------------	|--------------------------	|
| Linux           	| `6.1.62-1`          	| 🟢 - GOOD    	| 🟢 - YES     	| 🟢 - TESTED  	| Test against MANJARO-KDE 	|
| MacOS (OSX)     	|                     	| ⚫ - N/A     	| 🟡 - MAYBE   	| 🔴 - NONE    	|                          	|
| Windows (Win32) 	| `10`, `11`          	| ⚫ - N/A     	| 🟢 - YES     	| 🔴 - NONE    	|                          	|
| Web             	| `Firefox`, `Chrome` 	| ⚫ - N/A     	| 🔴 - MINIMAL 	| 🟡 - PENDING 	|                          	|
