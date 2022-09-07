import 'package:flutter/material.dart';
import 'package:flutter_pokedex/constants/constants.dart';
import 'package:flutter_pokedex/model/pokemon_model.dart';

class PokeNametype extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeNametype({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Text(
            pokemon.name ?? '',
            style: Constants.getPokemonNameTextStyle(),
          ),
          Text('#${pokemon.id}', style: Constants.getPokemonNameTextStyle())
        ],
      ),
      Chip(
          label: Text(
        pokemon.type!.join(' , '),
        style: Constants.getTypeChipTextStyle(),
      ))
    ]);
  }
}
