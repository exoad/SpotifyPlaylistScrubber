import 'package:flutter/material.dart';
import 'package:spotify_playlist_scrubber/bits/themes.dart';

class TextInputView extends StatelessWidget {
  final String hint;
  final String title;
  final TextEditingController? textFieldController;
  final void Function(String value, BuildContext context) onChanged;
  const TextInputView(
      {super.key,
      required this.hint,
      required this.onChanged,
      required this.title,
      this.textFieldController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(26.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: <Color>[LaF.primary1, LaF.primary2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          color: LaF.bg,
          borderRadius: LaF.themeBorderRadius,
        ),
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text.rich(TextSpan(children: <InlineSpan>[
                  TextSpan(
                      text: "$title\n\n",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 24)),
                  TextSpan(
                      text: hint,
                      style: const TextStyle(
                          color: LaF.primary1,
                          fontWeight: FontWeight.w500,
                          fontSize: 14))
                ])),
                TextField(
                  controller: textFieldController,
                  onChanged: (String e) => onChanged.call(e, context),
                ),
              ]),
        ),
      ),
    );
  }
}
