import 'package:flutter/material.dart';

import 'package:my_daily_diary/app_theme.dart';
import 'package:my_daily_diary/widgets/dialog_view.dart';
import 'package:my_daily_diary/widgets/diary_list_view.dart';

class MyDiaryScreen extends StatelessWidget {
  static const routName = '/';

  // Future<bool> _getData() async {
  //   await Future.delayed(const Duration(milliseconds: 50));
  //   return true;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    _getAppBarUI(),
                    _getNewDiary(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getAppBarUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 16, right: 16),
      child: Center(
        child: Text(
          'My Diaries',
          style: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _getNewDiary(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'NootBooks',
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
                        title: Text('Add New Diary'),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return DialogView();
                            },
                          );
                        },
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        leading: Icon(Icons.delete),
                        title: Text('Delete All Diaries'),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                    'Are you sure that you want to delete all your diaries?'),
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
          const SizedBox(height: 16),
          DiaryListView(),
        ],
      ),
    );
  }
}
