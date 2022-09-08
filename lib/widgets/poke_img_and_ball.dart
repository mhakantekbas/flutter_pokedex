import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/constants/ui_helper.dart';
import 'package:flutter_pokedex/model/pokemon_model.dart';

class PokeImageAndBall extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeImageAndBall({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pokeballImageUrl = 'images/pokeball.png';
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            pokeballImageUrl,
            width: UIHelper.calcualtePokeImgAndBallSize(),
            height: UIHelper.calcualtePokeImgAndBallSize(),
          ),
        ),
        Hero(
          tag: pokemon.id!,
          child: Align(
            alignment: Alignment.bottomRight,
            child: CachedNetworkImage(
              imageUrl: pokemon.img ?? '',
              width: UIHelper.calcualtePokeImgAndBallSize(),
              errorWidget: (context, url, error) => const Icon(Icons.ac_unit),
              height: UIHelper.calcualtePokeImgAndBallSize(),
              fit: BoxFit.fitHeight,
              placeholder: (context, url) => CircularProgressIndicator(
                color: UIHelper.getColorFromType(pokemon.type![0]),
              ),
            ),
          ),
        )
      ],
    );
  }
}
