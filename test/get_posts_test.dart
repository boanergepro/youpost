import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:youpost/src/data/datasources/post_datasource.dart';
import 'package:youpost/src/data/model/post.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  test('Test to fetch all posts', () async {
    bool testPassed = true;

    try {
      final List<PostModel> response = await PostDatasource().getAll({'_limit': '100'});
      if (response.isEmpty) testPassed = false;
    } catch(e) {
      testPassed = false;
    }

    expect(testPassed, isTrue);
  });

  test('Test to fetch limit and paginate posts', () async {
    bool testPassed = true;

    try {
      final List<PostModel> response = await PostDatasource().getAll({'_limit': '10', 'page': '2'});
      if (response.isEmpty) testPassed = false;
    } catch(e) {
      testPassed = false;
    }

    expect(testPassed, isTrue);
  });


}