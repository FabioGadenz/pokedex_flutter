import 'package:flutter/material.dart';
import 'package:pokedex/core/models/pokemon_model.dart';
import 'package:pokedex/core/styles/custom_colors.dart';

class Carregando extends StatelessWidget {
  const Carregando({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.backGroundBarColor,
        elevation: 2,
        centerTitle: true,
        
      ),
      backgroundColor: CustomColors.backGroundPageColor,
      body: const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.red,
                ),
              ),
            ),
    );
  }
}
