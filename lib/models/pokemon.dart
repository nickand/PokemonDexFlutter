class Pokemon {
  final String name;
  final String url;

  Pokemon({required this.name, required this.url});

  int get id {
    final segments = url.split('/');
    return int.parse(segments[segments.length - 2]);
  }
}
