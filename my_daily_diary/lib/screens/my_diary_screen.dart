import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:my_daily_diary/app_theme.dart';
import 'package:my_daily_diary/providers/chapter_data.dart';
import 'package:my_daily_diary/providers/diary_data.dart';
import 'package:my_daily_diary/widgets/change_theme_btn_widget.dart';
import 'package:my_daily_diary/widgets/dialog_view.dart';
import 'package:my_daily_diary/widgets/diary_screen_widget/chapter_list_view.dart';
import 'package:my_daily_diary/widgets/diary_screen_widget/diary_list_view.dart';
import 'package:my_daily_diary/widgets/diary_screen_widget/title_view.dart';
import 'package:provider/provider.dart';

class MyDiaryScreen extends StatefulWidget {
  static const routName = '/';

  @override
  _MyDiaryScreenState createState() => _MyDiaryScreenState();
}

class _MyDiaryScreenState extends State<MyDiaryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
  }

  @override
  void dispose() {
    Hive.close();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<DiaryData>(context).getItemsFormDB();
    return Scaffold(
      // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: _getAppBarUI(),
      // backgroundColor: Colors.transparent,
      body: _getNewDiary(context),
    );
  }

  PreferredSizeWidget _getAppBarUI() {
    return AppBar(
      title: Text(
        'My Diaries',
        style: Theme.of(context).textTheme.headline6,
        // style: TextStyle(
        //   // color: Theme.of(context).textTheme.headline6!.color,
        //   fontSize: 20,
        //   fontWeight: FontWeight.w500,
        // ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      // elevation: 0,
      actions: [ChangeThemeButtonWidget()],
    );
    // return Padding(
    //   padding: const EdgeInsets.only(top: 15, left: 16, right: 16),
    //   child: Center(
    //     child: Text(
    //       'My Diaries',
    //       style: TextStyle(
    //         color: Colors.black.withOpacity(0.5),
    //         fontSize: 20,
    //         fontWeight: FontWeight.w500,
    //       ),
    //       textAlign: TextAlign.center,
    //     ),
    //   ),
    // );
  }

  Column _getNewDiary(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        TitleView(
          titleName: 'Diaries',
          inputDialogName: 'Diary Name',
          inputDialogHint: 'Ex: 2020, Secret ...ets',
          inputDialogCoverName: 'Diary Cover',
          inputDialogAction: AddAction.diary,
        ),
        const SizedBox(height: 16),
        Provider.of<DiaryData>(context).items.isNotEmpty
            ? DiaryListView(_animationController)
            : Expanded(
                child: Center(
                  child: Text(
                    'Add Your frist Diary 😀',
                    style: Theme.of(context).textTheme.bodyText1,
                    // style: TextStyle(
                    //   color: Theme.of(context).textTheme.headline5!.color,
                    //   fontSize: 20,
                    //   fontWeight: FontWeight.w500,
                    // ),
                  ),
                ),
              ),
        const SizedBox(height: 16),
        Provider.of<ChapterData>(context).getClick
            ? TitleView(
                titleName: 'Chapters',
                inputDialogName: 'Chapter Name',
                inputDialogHint: 'Ex: January, February, Collection ...ets',
                inputDialogCoverName: 'Chapter Cover',
                inputDialogAction: AddAction.chapter,
              )
            : const SizedBox(),
        const SizedBox(height: 5),
        ChapterListView(_animationController),
        SizedBox(
          height: MediaQuery.of(context).padding.bottom,
        ),
      ],
    );
  }
}
