import 'package:flutter/material.dart';

class DragView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.horizontal(
            right: Radius.circular(50),
            left: Radius.circular(50),
          ),
          color: Theme.of(context).dividerColor,
        ),
        height: 5,
        width: 40,
        child: Divider(
          color: Theme.of(context).primaryColor,
          thickness: 1,
          indent: 10,
          endIndent: 10,
        ),
      ),
    );
  }
}
