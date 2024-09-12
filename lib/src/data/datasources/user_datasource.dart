import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:youpost/src/data/model/user.dart';

abstract class IUserDataSource {
  Future<List<UserModel>> getAll();
}

class UserDatasource implements IUserDataSource {
  @override
  Future<List<UserModel>> getAll() async {
    try {
      final response = await http.get(Uri.https(
        'jsonplaceholder.typicode.com',
        '/users',
      ));
      final json = jsonDecode(response.body);

      return List.from(json.map((e) => UserModel.fromJson(e)).toList());
    } catch (e) {
      print(e);
    }
    return [];
  }

}