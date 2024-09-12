import 'package:flutter/material.dart';
import 'package:youpost/src/domain/entities/user.dart';

class UserWidget extends StatelessWidget {
  final User data;

  const UserWidget({super.key, required this.data,});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10,
        ),
        border: Border.all(
          color: Colors.grey.withOpacity(
            0.2,
          ),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(data.initialLetter),
        ),
        title: Text(data.name),
        subtitle: Text(data.email),
      ),
    );
  }
}
