import 'package:flutter/material.dart';

class SavingsBanner extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  final TextStyle textStyle;

  const SavingsBanner({
    Key? key,
    required this.message,
    this.backgroundColor = Colors.green,
    this.textStyle = const TextStyle(color: Colors.white),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: backgroundColor,
      child: Center(
        child: Text(
          message,
          style: textStyle,
        ),
      ),
    );
  }
}
