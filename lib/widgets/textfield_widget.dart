import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utils/app_colors.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController textController;
  final String hintText;
  final double borderRadius;
  final int? maxLine;

  TextFieldWidget(
      {super.key,
      required this.textController,
      required this.hintText,
      required this.borderRadius,
      required this.maxLine});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState(
      this.textController, this.hintText, this.borderRadius, maxLine!);
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final TextEditingController textController;
  final String hintText;
  final double borderRadius;
  final int maxLine;

  _TextFieldWidgetState(
      this.textController, this.hintText, this.borderRadius, this.maxLine);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLine,
      controller: textController,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.textHolder,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
