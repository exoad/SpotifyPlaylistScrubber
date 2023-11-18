import 'package:flutter/material.dart';
import 'package:spotify_playlist_scrubber/bits/themes.dart';

class TextInputView extends StatelessWidget {
  static Future<void> showTextView(BuildContext context,
      {required String hint,
      required String title,
      required void Function(String value) onChanged,
      TextEditingController? textFieldController}) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return TextInputView(
            hint: hint,
            title: title,
            onChanged: onChanged,
            textFieldController: textFieldController);
      },
    );
  }

  final String hint;
  final String title;
  final TextEditingController? textFieldController;
  final void Function(String value) onChanged;
  const TextInputView(
      {super.key,
      required this.hint,
      required this.onChanged,
      required this.title,
      this.textFieldController});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(title, style: LaF.emphasisText),
        content: TextField(
          controller: textFieldController,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: LaF.normalText,
          ),
        ));
  }
}
