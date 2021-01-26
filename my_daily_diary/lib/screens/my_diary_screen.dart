import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_daily_diary/app_theme.dart';

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
            _getAppBarUI(),
            _getNewDiary(context),
          ],
        ),
      ),
    );
  }

  Widget _getAppBarUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 18, right: 18),
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
      padding: const EdgeInsets.only(top: 8, left: 18, right: 16),
      child: Row(
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
            // icon: FaIcon(FontAwesomeIcons.ellipsisH),
            // color: Colors.black.withOpacity(0.2),
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
                          return Dialog(
                            child: Container(
                              height: MediaQuery.of(context).size.height / 2,
                              child: Column(
                                children: [],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ];
            },
          ),
          // IconButton(
          //   icon: FaIcon(FontAwesomeIcons.ellipsisH),
          //   color: Colors.black.withOpacity(0.5),
          //   onPressed: () {
          //     showMenu(context: context, position: null, items: null);
          //   },
          // ),
        ],
      ),
    );
  }
}
