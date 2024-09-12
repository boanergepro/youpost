import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youpost/src/data/datasources/user_datasource.dart';
import 'package:youpost/src/data/repositories/user_repository.dart';
import 'package:youpost/src/domain/entities/user.dart';
import 'package:youpost/src/domain/repositories/user_repository.dart';
import 'package:youpost/src/domain/usecases/user_usecases.dart';

final userProvider = AsyncNotifierProvider<UserNotifier, List<User>>(
  UserNotifier.new
);

class UserNotifier extends AsyncNotifier<List<User>> {
  final IUserDataSource _userDataSource = UserDatasource();
  late final DomainUserRepository _domainUserRepository;
  late final UserUseCases _usecases;

  UserNotifier() {
    _domainUserRepository = DataUserRepository(_userDataSource);
    _usecases = UserUseCases(_domainUserRepository);
  }

  @override
  Future<List<User>> build() {
    return _usecases.getAll();
  }

}