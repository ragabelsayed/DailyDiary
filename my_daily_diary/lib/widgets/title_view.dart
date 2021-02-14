import 'package:flutter/material.dart';

import 'dialog_view.dart';

class TitleView extends StatelessWidget {
  final String titleName;
  final String add;
  final String delete;
  final String deleteMessage;
  final String inputDialogName;
  final String inputDialogHint;
  final String inputDialogCoverName;
  final AddAction inputDialogAction;
  const TitleView(
      {this.titleName,
      this.add,
      this.delete,
      this.deleteMessage,
      this.inputDialogName,
      this.inputDialogHint,
      this.inputDialogCoverName,
      this.inputDialogAction});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            titleName,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.add),
                    title: Text(add),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return DialogView(
                            name: inputDialogName,
                            hint: inputDialogHint,
                            coverName: inputDialogCoverName,
                            action: inputDialogAction,
                          );
                        },
                      );
                    },
                  ),
                ),
                PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.delete),
                    title: Text(delete),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(deleteMessage),
                          );
                        },
                      );
                    },
                  ),
                ),
              ];
            },
          ),
        ],
      ),
    );
  }
}
