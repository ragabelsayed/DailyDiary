import 'package:flutter/material.dart';

class DragView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 3, bottom: 3),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(50),
                left: Radius.circular(50),
              ),
              color: Colors.grey.withOpacity(0.5),
            ),
            height: 5,
            width: 200,
            child: Divider(
              color: Colors.white,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(50),
              left: Radius.circular(50),
            ),
            color: Colors.grey.withOpacity(0.5),
          ),
          height: 5,
          width: 150,
          child: Divider(
            color: Colors.white,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
        ),
      ],
    );
  }
}
