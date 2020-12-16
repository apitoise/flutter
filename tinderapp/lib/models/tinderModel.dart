class TinderModel {
  List<Users> users;

  TinderModel({this.users});
  factory TinderModel.fromJson(Map<String, dynamic> json) {
    List<Users> users = List<Users>();
    json["Users"].forEach((value) => users.add(Users.fromJson(value)));
    return TinderModel(users: users);
  }
}

class Users {
  String name;
  String picture;
  String gender;
  int age;

  Users({this.age, this.gender, this.name, this.picture});
  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      age: json["Age"],
      gender: json["Gender"],
      name: json["Name"],
      picture: json["Picture"],
    );
  }
}
