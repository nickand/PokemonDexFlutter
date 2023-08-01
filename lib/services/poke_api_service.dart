import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pokemon_dex/models/pokemon_response.dart';

class PokeApiService {
  static const String _baseUrl = 'https://pokeapi.co/api/v2/';

  Future<PokemonResponse> fetchPokemonList() async {
    final response = await http.get(Uri.parse(_baseUrl + 'pokemon?limit=20'));
    if (response.statusCode == 200) {
      return PokemonResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Pokemon list');
    }
  }
}
