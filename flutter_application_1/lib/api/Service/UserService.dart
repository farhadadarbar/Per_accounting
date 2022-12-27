import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../../dimonApp/dimon.dart';
import '../Model/UserModel.dart';

class UserService {
  Future<List<User>> fetchAll() async {
    var url = Uri.https(apiserves + 'users');
    var response = await http.get(url, headers: {'Accept': 'application/json'});
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      List<User> userList = [];
      jsonResponse.forEach((item) {
        userList.add(_convertToUser(item));
      });
      return Future.value(userList);
    }
    return Future.error(
        Exception("Request failed with status: ${response.statusCode}."));
  }

  User _convertToUser(Map<String, dynamic> jsonUser) {
    return User(jsonUser['id'], jsonUser['name'], jsonUser['email'],
        jsonUser['avatar']);
  }
}
