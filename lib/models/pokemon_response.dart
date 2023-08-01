import 'package:pokemon_dex/models/pokemon.dart';

class PokemonResponse {
  final List<Pokemon> pokemonList;

  PokemonResponse({required this.pokemonList});

  factory PokemonResponse.fromJson(Map<String, dynamic> json) {
    return PokemonResponse(
      pokemonList: (json['results'] as List)
          .map((pokemon) => Pokemon(
                name: pokemon['name'],
                url: pokemon['url'],
              ))
          .toList(),
    );
  }
}
