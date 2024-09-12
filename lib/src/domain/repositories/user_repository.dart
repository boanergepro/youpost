import 'package:youpost/src/domain/entities/user.dart';

abstract class DomainUserRepository {
  Future<List<User>> getAll();
}