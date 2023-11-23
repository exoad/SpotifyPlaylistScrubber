import 'package:flutter/material.dart';
import 'package:spotify_playlist_scrubber/bits/themes.dart';
import 'package:spotify_playlist_scrubber/parts/input_view.dart';
import 'package:spotify_playlist_scrubber/parts/parts.dart';

enum _SearchFormEntry {
  home_page("Home", Icons.home_rounded),
  playlist_link("Playlist URL", Icons.link_rounded),
  user_name("Playlists by user name", Icons.person_rounded),
  user_id("Playlists by user ID", Icons.numbers_rounded);

  const _SearchFormEntry(this.title,
      [this.icon = Icons.search_rounded]);
  final String title;
  final IconData icon;
}

class _CascadedFloatingNavMenu extends StatefulWidget {
  final void Function(_SearchFormEntry entry) onSelected;

  const _CascadedFloatingNavMenu({required this.onSelected});

  @override
  State<_CascadedFloatingNavMenu> createState() =>
      _CascadedFloatingNavMenuState();
}

class _CascadedFloatingNavMenuState
    extends State<_CascadedFloatingNavMenu> {
  final FocusNode _buttonFocusNode = FocusNode();

  @override
  void dispose() {
    _buttonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<_SearchFormEntry>(
        shadowColor: Colors.black,
        elevation: 8,
        color: Colors.black,
        offset: Offset(
            -60, -50 * _SearchFormEntry.values.length.toDouble()),
        shape: RoundedRectangleBorder(
            borderRadius: LaF.themeBorderRadius),
        itemBuilder: (BuildContext context) {
          List<PopupMenuItem<_SearchFormEntry>> widgets =
              <PopupMenuItem<_SearchFormEntry>>[];
          int i = 1;
          for (_SearchFormEntry entry in _SearchFormEntry.values) {
            widgets.add(PopupMenuItem<_SearchFormEntry>(
              value: entry,
              child: Row(
                children: <Widget>[
                  Icon(entry.icon, color: LaF.bg),
                  const SizedBox(width: 6),
                  Text(entry.title,
                      style: TextStyle(
                          color: i % 2 == 0
                              ? LaF.primary1
                              : LaF.primary2,
                          fontWeight: FontWeight.w700,
                          fontSize: 14)),
                ],
              ),
            ));
            i++;
          }
          return widgets;
        },
        onSelected: widget.onSelected,
        icon: const Icon(
          size: 28,
          Icons.search_rounded,
        ));
  }
}

class AppWrapper extends StatefulWidget {
  const AppWrapper({super.key});

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  late PageController _pageController;
  late _SearchFormEntry _selected;

  @override
  void initState() {
    super.initState();
    _selected = _SearchFormEntry.home_page;
    _pageController = PageController(initialPage: _selected.index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: _CascadedFloatingNavMenu(
          onSelected: (_SearchFormEntry e) {
            setState(() {
              _selected = e;
              _pageController.animateToPage(
                e.index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            });
          },
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.endFloat,
        body: Scrubber_BackdropLineArt.wrap(
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              const StartingBlankView(),
              Container(color: Colors.red),
              Container(color: Colors.blue),
              TextInputView(
                  hint:
                      "The string after \"https://open.spotify.com/user/\"",
                  onChanged: (String str, BuildContext context) {},
                  title: "User ID"),
            ],
          ),
        ),
      ),
      theme: LaF.theme(),
    );
  }
}
