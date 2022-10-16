import 'package:can_you_guess_it/helpers/models/enums.dart';
import 'package:can_you_guess_it/helpers/models/models.dart';

import 'models/User.dart';


class MockData{

  static Country randomCountry = Country(name: "Spain", continent: "Europe", flag: "flag.jpg", capital: "Madrid", map: "map.jpg", points: 12);
  static Country randomCountry2 = Country(name: "Catalonia", continent: "Europe", flag: "flag.jpg", capital: "Madrid", map: "map.jpg", points: 12);
  static Country randomCountry3 = Country(name: "Aragon", continent: "Europe", flag: "flag.jpg", capital: "Madrid", map: "map.jpg", points: 12);
  static Country randomCountry4 = Country(name: "Galicia", continent: "Europe", flag: "flag.jpg", capital: "Madrid", map: "map.jpg", points: 12);

  static List<Country> fourCountries = [randomCountry,randomCountry2,randomCountry3,randomCountry4];

  static List<Points> pointsDefault = [Points(gameMode: GameModes.FLAGS.name, points: 0,user: "asdf"),Points(gameMode: GameModes.MAPS.name, points: 0, user: 'asd')];
  static List<User> friends = [User(name: "Amigo1"),User(name: "amigo2")];
  static User testUser = User(name: "User",mail: "mail@test.com", avatarLink: "avatar.jpg",coins: 30,points: pointsDefault,friends: friends);



}