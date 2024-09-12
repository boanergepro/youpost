import 'package:youpost/src/domain/entities/user.dart';
import 'package:youpost/src/domain/repositories/user_repository.dart';

class UserUseCases {
  final DomainUserRepository repository;

  const UserUseCases(this.repository);

  Future<List<User>> getAll() async {
    return await repository.getAll();
  }
}