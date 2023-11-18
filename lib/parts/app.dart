import 'package:flutter/material.dart';
import 'package:spotify_playlist_scrubber/bits/themes.dart';
import 'package:spotify_playlist_scrubber/parts/input_view.dart';
import 'package:spotify_playlist_scrubber/parts/parts.dart';

class AppWrapper extends StatefulWidget {
  const AppWrapper({super.key});

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  TextInputView.showTextView(context,
                      hint: "Search for a playlist",
                      title: "Search", onChanged: (String value) {
                    print(value);
                  });
                },
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
