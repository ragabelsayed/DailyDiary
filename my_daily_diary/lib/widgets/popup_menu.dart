import 'package:flutter/material.dart';
import 'package:my_daily_diary/providers/Page_data.dart';
import 'package:provider/provider.dart';

import 'Lock_view.dart';

class PopUpMenu extends StatelessWidget {
  final String dialogContent;
  final String snackBarContent;
  final Function removeItem;

  PopUpMenu({
    required this.dialogContent,
    required this.snackBarContent,
    required this.removeItem,
  });
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: ListTile(
              leading: Icon(Icons.lock),
              title: Text('Lock'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return LockView();
                  },
                );
              },
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              leading: Icon(Icons.delete),
              title: Text('Delete'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(dialogContent),
                      actions: [
                        TextButton(
                          child: Text('No'),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                        TextButton(
                          child: Text('Yes'),
                          onPressed: () {
                            removeItem();
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context)
                              ..removeCurrentSnackBar()
                              ..showSnackBar(
                                SnackBar(
                                  content: Text(
                                    snackBarContent,
                                    style: Theme.of(context)
                                        .snackBarTheme
                                        .contentTextStyle,
                                    textAlign: TextAlign.center,
                                  ),
                                  shape: StadiumBorder(),
                                  behavior: SnackBarBehavior.floating,
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ];
      },
    );
  }
}
