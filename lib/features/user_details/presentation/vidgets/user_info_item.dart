import 'package:flutter/material.dart';

class UserInfoItem extends StatelessWidget {
  const UserInfoItem({Key? key, required this.name, required this.value})
      : super(key: key);
  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Row(
        children: [
          Text(name),
          Expanded(child: Text('.' * 1000, maxLines: 1)),
          Text(value),
        ],
      ),
    );
  }
}
