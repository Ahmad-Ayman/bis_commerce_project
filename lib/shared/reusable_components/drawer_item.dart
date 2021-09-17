import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  IconData? prefix;
  String? title;
  DrawerItem({this.prefix, this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            prefix,
          ),
          const SizedBox(
            width: 15,
          ),
          Text('$title'),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios_outlined),
        ],
      ),
    );
  }
}
