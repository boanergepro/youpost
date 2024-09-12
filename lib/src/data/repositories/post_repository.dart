import 'package:youpost/src/data/datasources/post_datasource.dart';
import 'package:youpost/src/domain/entities/post.dart';
import 'package:youpost/src/domain/repositories/post_repository.dart';

class DataPostRepository implements DomainPostRepository {
  final IPostDataSource _postDataSource;

  DataPostRepository(this._postDataSource);

  @override
  Future<List<Post>> getAll(Map<String, dynamic> params) async {
    final response = await _postDataSource.getAll(params);
    return List<Post>.from(
      response
          .map(
            (e) => Post(
              id: e.id,
              userId: e.userId,
              title: e.title,
              body: e.body,
            ),
          )
          .toList(),
    );
  }
}
