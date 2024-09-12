import 'package:youpost/src/domain/entities/post.dart';

abstract class DomainPostRepository {
  Future<List<Post>> getAll(Map<String, dynamic> params);
}