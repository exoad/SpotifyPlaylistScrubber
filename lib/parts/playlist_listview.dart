// ignore_for_file: implementation_imports, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:spotify/src/models/_models.dart' as spotify;
import 'package:spotify_playlist_scrubber/parts/parts.dart';
import 'package:spotify_playlist_scrubber/bits/bits.dart';

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
    for (spotify.PlaylistSimple element
        in (await getPlaylists(debugUserID))) {
      widgets.add(Padding(
        padding:
            const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
        child: Row(
          children: <Widget>[
            if (element.images == null || element.images!.isEmpty)
              generateRandomGradient()
            else
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: LaF.themeBorderRadius,
                  child: Image.network(
                    element.images!.first.url!,
                    width: LaF.ARTWORK_LISTVIEW_SIZE,
                    height: LaF.ARTWORK_LISTVIEW_SIZE,
                    isAntiAlias: true,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
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
                        const SizedBox(width: 10),
                        Flexible(
                          flex: 0,
                          fit: FlexFit.tight,
                          child: Tooltip(
                            message: element.public != null &&
                                    element.public!
                                ? "Public playlist"
                                : "Private playlist",
                            child: wrapTag(
                                innerPadding: 4,
                                child: Icon(
                                    element.public == null
                                        ? Icons.question_mark_rounded
                                        : element.public!
                                            ? Icons.people_rounded
                                            : Icons.lock_rounded,
                                    size: 12,
                                    color: Colors.white),
                                color: LaF.primary2),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          flex: 0,
                          fit: FlexFit.tight,
                          child: Tooltip(
                            message: element.collaborative != null &&
                                    element.collaborative!
                                ? "Collaborative playlist"
                                : "Closed playlist",
                            child: wrapTag(
                                innerPadding: 4,
                                child: Icon(
                                    element.collaborative == null
                                        ? Icons.question_mark_rounded
                                        : element.collaborative!
                                            ? Icons
                                                .emoji_people_rounded
                                            : Icons.shield_rounded,
                                    size: 12,
                                    color: Colors.white),
                                color: LaF.primary2),
                          ),
                        ),
                        if (element.uri != null)
                          const SizedBox(width: 4),
                        if (element.uri != null)
                          Flexible(
                              flex: 0,
                              fit: FlexFit.tight,
                              child: Tooltip(
                                  message: "Open in browser",
                                  child: GestureDetector(
                                    onTap: () async =>
                                        await launchPlaylistInBrowser_URI(
                                            element
                                                .uri!), // above check makes sure element.uri isnt null here
                                    child: wrapTag(
                                        innerPadding: 4,
                                        child: const Icon(
                                            Icons.link_rounded,
                                            size: 12,
                                            color: Colors.white),
                                        color: LaF.primary1),
                                  ))),
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
            child: CircularProgressIndicator(
              strokeCap: StrokeCap.round,
            ),
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
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(children: snapshot.data!),
          );
        }
      },
    );
  }
}
