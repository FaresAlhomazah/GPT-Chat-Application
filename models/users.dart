import 'package:chat_app/constants.dart';

class Users {
  final String username;
  final String email;
  final String password;

  Users(this.username, this.email, this.password);

  factory Users.fromJson(jsonData) {
    return Users(
      jsonData[kUserName],
      jsonData[kEmail],
      jsonData[kPassWord],
    );
  }
}
