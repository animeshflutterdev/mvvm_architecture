import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPressed;

  const RoundButton(
      {super.key,
      required this.title,
      this.loading = false,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return loading == true
        ? const CircularProgressIndicator()
        : OutlinedButton(
            onPressed: onPressed,
            child: Text(title),
          );
  }
}
