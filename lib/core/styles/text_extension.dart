import 'package:flutter/material.dart';

extension TextExtension on Text {
  Text get titleName => Text(
        data!,
        style: const TextStyle(
          fontSize: 14,
          color: Color.fromARGB(255, 8, 94, 1),
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      );
}
