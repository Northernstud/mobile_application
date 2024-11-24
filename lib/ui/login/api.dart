import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_application/ui/login/user_model.dart';

class Api {
  static const baseUrl = "http://144.121.83.58/api/"; //ip

  static addUser(Map udata) async {
    print(udata);
    var url = Uri.parse("${baseUrl}add_user");

    try {
      final res = await http.post(url, body: udata);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
      } else {
        print("failed to get response");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static getUser() async {
    List<User> users = [];

    var url = Uri.parse("${baseUrl}add_user");

    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());

        data['users'].forEach(
          (value) => {
            users.add(
              User(value['uid'].toString(), value['uname'], value['uemail'],
                  value['upassword']),
            ),
          },
        );

        print(data);
        return users;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static updateUser(id, body) async {
    var url = Uri.parse("${baseUrl}update/$id");
    final res = await http.put(url, body: body);

    if (res.statusCode == 200) {
      print(jsonDecode(res.body));
    } else {
      print("Failed to update data");
    }
  }

  static deleteUser(id, body) async {
    var url = Uri.parse("${baseUrl}delete/$id");
    final res = await http.post(url);

    if (res.statusCode == 204) {
      print(jsonDecode(res.body));
    } else {
      print("Failed to delete");
    }
  }
}
