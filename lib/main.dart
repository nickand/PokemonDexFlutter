import 'package:flutter/material.dart';
import 'package:pokemon_dex/pokemon_list_page.dart';

void main() {
  runApp(PokemonApp());
}

class PokemonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PokemonListPage(),
    );
  }
}
