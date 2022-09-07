import 'package:flutter/material.dart';
import 'package:flutter_pokedex/widgets/pokelist_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/pokemon_model.dart';
import '../services/pokedex_api.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokemonListFuture;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _pokemonListFuture = PokeApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> _myList = snapshot.data!;

          return GridView.builder(
              itemCount: _myList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      ScreenUtil().orientation == Orientation.portrait ? 2 : 3),
              itemBuilder: (context, index) =>
                  PokeListItem(pokemon: _myList[index]));
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("hata çıktı"),
          );
        } else {
          const CircularProgressIndicator();
        }
        return const CircularProgressIndicator();
      },
      future: _pokemonListFuture,
    );
  }
}
