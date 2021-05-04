import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:my_daily_diary/app_theme.dart';
import 'package:my_daily_diary/providers/diary_data.dart';
import 'package:my_daily_diary/widgets/change_theme_btn_widget.dart';
import 'package:my_daily_diary/widgets/dialog_view.dart';
import 'package:my_daily_diary/widgets/diary_screen_widget/diary_list_view.dart';
import 'package:my_daily_diary/widgets/diary_screen_widget/title_view.dart';
import 'package:provider/provider.dart';

class MyDiaryScreen extends StatefulWidget {
  static const routName = '/';

  @override
  _MyDiaryScreenState createState() => _MyDiaryScreenState();
}

class _MyDiaryScreenState extends State<MyDiaryScreen> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<DiaryData>(context).getItemsFormDB();
    return Container(
      // color: AppTheme.background,
      color: Theme.of(context).primaryColor,
      child: Scaffold(
        // appBar: _getAppBarUI(),
        // backgroundColor: Colors.transparent,
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
                    Expanded(child: _getNewDiary(context)),
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
    // return AppBar(
    //   title: Text(
    //     'My Diaries',
    //     style: TextStyle(
    //       color: Theme.of(context).textTheme.headline6!.color,
    //       fontSize: 20,
    //       fontWeight: FontWeight.w500,
    //     ),
    //   ),
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
    //   ),
    //   // backgroundColor: Colors.white,
    //   // elevation: 0,
    //   actions: [ChangeThemeButtonWidget()],
    // );
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
    return Column(
      children: [
        TitleView(
          titleName: 'Diaries',
          inputDialogName: 'Diary Name',
          inputDialogHint: 'Ex: 2020, Secret ...ets',
          inputDialogCoverName: 'Diary Cover',
          inputDialogAction: AddAction.diary,
        ),
        const SizedBox(height: 16),
        Provider.of<DiaryData>(context).items.isNotEmpty
            ? DiaryListView()
            : Expanded(
                child: Center(
                    child: Text(
                'Add Your frist Diary 😀',
                style: TextStyle(
                  color: Theme.of(context).textTheme.headline5!.color,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ))),
      ],
    );
  }
}
