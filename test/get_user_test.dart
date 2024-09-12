import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:youpost/src/data/datasources/user_datasource.dart';
import 'package:youpost/src/data/model/user.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  test('Test to fetch all users', () async {
    bool testPassed = true;

    try {
      final List<UserModel> response = await UserDatasource().getAll();
      if (response.isEmpty) testPassed = false;
    } catch(e) {
      testPassed = false;
    }

    expect(testPassed, isTrue);
  });
}