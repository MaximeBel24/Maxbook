import 'package:flutter/material.dart';

class MainTitleText extends Text {
  final String data;

  MainTitleText({required this.data}): super(
    data,
    style: const TextStyle(
      fontSize: 25,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold
    )
  );
}