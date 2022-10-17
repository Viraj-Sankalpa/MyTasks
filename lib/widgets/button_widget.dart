import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class Buttons extends StatefulWidget {
  final Color backgroundColor;
  final String buttonText;
  final Color textColor;

  const Buttons({
    super.key,
    required this.backgroundColor,
    required this.buttonText,
    required this.textColor,
  });

  @override
  State<Buttons> createState() => _ButtonsState(
        this.backgroundColor,
        this.buttonText,
        this.textColor,
      );
}

class _ButtonsState extends State<Buttons> {
  final Color backgroundColor;
  final String buttonText;
  final Color textColor;

  _ButtonsState(
    this.backgroundColor,
    this.buttonText,
    this.textColor,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height / 14,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 20,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
