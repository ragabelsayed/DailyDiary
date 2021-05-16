import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../widgets/diary_screen_widget/title_view.dart';
import '../widgets/diary_screen_widget/diary_list_view.dart';
import '../widgets/diary_screen_widget/chapter_list_view.dart';
import '../widgets/dialog_view.dart';
import '../widgets/change_theme_btn_widget.dart';
import '../providers/diary_data.dart';
import '../providers/chapter_data.dart';

class DiaryScreen extends StatefulWidget {
  static const routName = '/';

  @override
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  double _opacityLevel = 0.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _btnOpacity();
  }

  Future<void> _btnOpacity() async {
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      _opacityLevel = 1.0;
    });
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
      resizeToAvoidBottomInset: false,
      appBar: _getAppBarUI(),
      body: _getNewDiary(context),
    );
  }

  PreferredSizeWidget _getAppBarUI() {
    return AppBar(
      title: Text(
        'My Diaries',
        style: Theme.of(context).textTheme.headline6,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      actions: [ChangeThemeButtonWidget()],
    );
  }

  Widget _getNewDiary(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top - 10),
        TitleView(
          titleName: 'Diaries',
          inputDialogName: 'Diary Name',
          inputDialogHint: 'Ex: 2020, Secret ...ets',
          inputDialogCoverName: 'Diary Cover',
          inputDialogAction: AddAction.diary,
          opacityLevel: _opacityLevel,
        ),
        const SizedBox(height: 16),
        Provider.of<DiaryData>(context).items.isNotEmpty
            ? DiaryListView(_animationController)
            : Expanded(
                child: Center(
                  child: Text(
                    'Add Your frist Diary 😀',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
        const SizedBox(height: 16),
        if (Provider.of<ChapterData>(context).getClick)
          TitleView(
            titleName: 'Chapters',
            inputDialogName: 'Chapter Name',
            inputDialogHint: 'Ex: January, February, Collection ...ets',
            inputDialogCoverName: 'Chapter Cover',
            inputDialogAction: AddAction.chapter,
            opacityLevel: _opacityLevel,
          ),
        const SizedBox(height: 5),
        if (Provider.of<ChapterData>(context).getClick)
          ChapterListView(_animationController),
        // SizedBox(height: MediaQuery.of(context).padding.bottom),
      ],
    );
  }
}
