import 'package:flutter/material.dart';
import 'package:spotify_playlist_scrubber/bits/themes.dart';

export 'app.dart';

export 'playlist_listview.dart';

Widget wrapTag({required Widget child, required Color color}) => Container(
    decoration: BoxDecoration(
        color: color, borderRadius: LaF.themeBorderRadius),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: child,
    ));