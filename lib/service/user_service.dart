import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class UserService {
  final String url = "https://dummyjson.com/users";

  Future<UserModel> fetchUsers() async {
    var res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      var jsonBody = UserModel.fromJson(jsonDecode(res.body));
      return jsonBody;
    } else {
      throw Exception('Failed to fetch stocks');
    }
  }

}
