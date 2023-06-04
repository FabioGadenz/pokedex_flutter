import 'package:flutter/material.dart';

extension TextExtension on Text {
  Text get namePokemon => Text(
        data!,
        style: const TextStyle(
          fontSize: 14,
          color: Color.fromARGB(255, 8, 94, 1),
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      );
       Text get titleName => Text(
        data!,
        style: const TextStyle(
          fontSize: 26,
          color: Color.fromARGB(255, 255, 255, 255),
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
        ),
      );
        Text get abilities => Text(
        data!,
        style: const TextStyle(
          fontSize: 14,
          color: Color.fromARGB(255, 255, 255, 255),
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
        ),
      ); 
}
