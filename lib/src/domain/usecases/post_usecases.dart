import 'package:youpost/src/domain/entities/post.dart';
import 'package:youpost/src/domain/repositories/post_repository.dart';

class PostUsecases {
  final DomainPostRepository repository;

  const PostUsecases(this.repository);

  Future<List<Post>> getAll(Map<String, dynamic> params) async {
    return await repository.getAll(params);
  }
}