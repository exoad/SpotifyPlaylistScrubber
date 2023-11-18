// ignore_for_file: implementation_imports, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:spotify/src/models/_models.dart';
import 'package:spotify_playlist_scrubber/bits/themes.dart';
import 'package:spotify_playlist_scrubber/parts/parts.dart';
import 'package:spotify_playlist_scrubber/shared.dart';

class PlaylistsView extends StatelessWidget {
  const PlaylistsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaylistsListView();
  }
}

class PlaylistsListView extends StatefulWidget {
  const PlaylistsListView({super.key});

  @override
  _PlaylistsListViewState createState() => _PlaylistsListViewState();
}

class _PlaylistsListViewState extends State<PlaylistsListView> {
  Future<List<Widget>> getPlayListWidgets() async {
    List<Widget> widgets = <Widget>[];
    for (PlaylistSimple element in (await spotifyApi.playlists
        .getUsersPlaylists("6upazxk1cqaqq1ct3d9jviaau")
        .all())) {
      widgets.add(Padding(
        padding:
            const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
        child: Row(
          children: <Widget>[
            generateRandomGradient(),
            wrapTag(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Flexible(
                          flex: 0,
                          child: Text(element.name ?? "??",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 16,
                                  color: Colors.black)),
                        ),
                        const SizedBox(width: 14),
                        Flexible(
                          flex: 0,
                          fit: FlexFit.tight,
                          child: wrapTag(
                              innerPadding: 4,
                              child: const Icon(
                                  Icons.music_note_rounded,
                                  size: 12,
                                  color: Colors.white),
                              color: LaF.primary2),
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                        element.description == null ||
                                element.description!.isEmpty
                            ? "--"
                            : element.description!,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            overflow: TextOverflow.ellipsis,
                            color: LaF.primary1))
                  ],
                ),
                color: Colors.transparent),
          ],
        ),
      ));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Widget>>(
      future: getPlayListWidgets(),
      builder: (BuildContext context,
          AsyncSnapshot<List<Widget>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
              child: wrapTag(
                  child: Text('Error: ${snapshot.error}',
                      style: LaF.emphasisText),
                  color: LaF.primary2));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: wrapTag(
                child: const Text("No playlists found",
                    style: LaF.emphasisText),
                color: LaF.primary2),
          );
        } else {
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: snapshot.data!,
          );
        }
      },
    );
  }
}
