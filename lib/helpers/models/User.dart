import 'models.dart';

class User{

  late String? name;
  late String? mail;
  late String? avatarLink;
  late int? coins;
  late List<Points>? points;
  late List<User>? friends;


User({this.name, this.mail, this.avatarLink, this.coins, this.points, this.friends});
}