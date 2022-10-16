
class Country{
  String name;
  String continent;
  String flag;
  String capital;
  String map;
  int points;
  List<Country>? similarFlags;

  Country({
    required this.name,
    required this.continent,
    required this.flag,
    required this.capital,
    required this.map,
    required this.points,
    this.similarFlags
});

}

class Points{
  late String gameMode;
  late int points;
  late String user;

  Points({required this.gameMode, required this.points, required this.user});

}

class Ranking{
  late List<Points> points;
}


