import 'package:youpost/src/data/datasources/user_datasource.dart';
import 'package:youpost/src/domain/entities/user.dart';
import 'package:youpost/src/domain/repositories/user_repository.dart';

class DataUserRepository implements DomainUserRepository {
  final IUserDataSource _userDataSource;

  DataUserRepository(this._userDataSource);

  @override
  Future<List<User>> getAll() async {
    final response = await _userDataSource.getAll();
    return List<User>.from(
      response
          .map(
            (e) => User(
              id: e.id,
              name: e.name,
              email: e.email,
              website: e.website,
            ),
          )
          .toList(),
    );
  }
}
