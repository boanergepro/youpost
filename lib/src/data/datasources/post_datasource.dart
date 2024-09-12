import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:youpost/src/data/model/post.dart';

abstract class IPostDataSource {
  Future<List<PostModel>> getAll(Map<String, dynamic> params);
}

class PostDatasource implements IPostDataSource {
  @override
  Future<List<PostModel>> getAll(Map<String, dynamic> params) async {
    try {
      final response = await http.get(Uri.https(
        'jsonplaceholder.typicode.com',
        '/posts',
        params,
      ));
      final json = jsonDecode(response.body);

      return List.from(json.map((e) => PostModel.fromJson(e)).toList());
    } catch (e) {
      print(e);
    }
    return [];
  }
}
