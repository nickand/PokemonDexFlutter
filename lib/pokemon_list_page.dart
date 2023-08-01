import 'package:flutter/material.dart';
import 'package:pokemon_dex/models/pokemon.dart';
import 'package:pokemon_dex/services/poke_api_service.dart';
import 'package:pokemon_dex/pokemon_detail_page.dart';

import 'models/pokemon_response.dart';

class PokemonListPage extends StatefulWidget {
  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  late Future<PokemonResponse> _pokemonListFuture;

  @override
  void initState() {
    super.initState();
    _pokemonListFuture = PokeApiService().fetchPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon List'),
      ),
      body: FutureBuilder<PokemonResponse>(
        future: _pokemonListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading data'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.pokemonList.length,
              itemBuilder: (context, index) {
                final pokemon = snapshot.data!.pokemonList[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(
                      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${pokemon.id}.png',
                    ),
                    title: Text(pokemon.name),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PokemonDetailPage(pokemon: pokemon),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
