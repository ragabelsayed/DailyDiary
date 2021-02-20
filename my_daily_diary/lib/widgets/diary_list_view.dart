import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_daily_diary/widgets/dialog_view.dart';

import 'package:my_daily_diary/models/chapter.dart';
import 'package:my_daily_diary/models/diary.dart';
import 'package:my_daily_diary/providers/chapter_data.dart';
import 'package:my_daily_diary/providers/diary_data.dart';
import 'package:my_daily_diary/widgets/title_view.dart';
import 'package:provider/provider.dart';

import 'chapter_view.dart';

class DiaryListView extends StatefulWidget {
  @override
  _DiaryListViewState createState() => _DiaryListViewState();
}

class _DiaryListViewState extends State<DiaryListView>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  final key = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
  }

  void _dismissSlidableItem(
      BuildContext context, int index, SlidableAction action) {
    switch (action) {
      case SlidableAction.lock:
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Chapter has been locked', textAlign: TextAlign.center),
        ));
        break;
      case SlidableAction.delete:
        _removeChapter(index);
        break;
    }
  }

  void _removeChapter(int index) {
    Provider.of<ChapterData>(context, listen: false).removeItem(index);
    key.currentState.removeItem(index,
        (context, animation) => _buildChapterItem(index, animation, context));
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Chapter has been deleted', textAlign: TextAlign.center),
    ));
  }

  void _addChapter(int index, Chapter chapter) {
    Provider.of<ChapterData>(context, listen: false).addItem(Chapter());
    key.currentState;
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Chapter has been deleted', textAlign: TextAlign.center),
    ));
  }

  Future<bool> _getData() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _diaryData = Provider.of<DiaryData>(context).items;
    final _chapterData = Provider.of<ChapterData>(context).items;

    return FutureBuilder(
      future: _getData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Text('Add Your frist Diary 😀'),
          );
        } else {
          return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  // height: MediaQuery.of(context).size.height / 3.5,
                  height: 220,
                  width: double.infinity,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _diaryData.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final int count =
                          _diaryData.length > 10 ? 10 : _diaryData.length;
                      final Animation<double> animation =
                          Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve: Interval((1 / count) * index, 1.0,
                              curve: Curves.fastOutSlowIn),
                        ),
                      );
                      _animationController.forward();
                      return DiaryView(
                        diaryData: _diaryData[index],
                        animationController: _animationController,
                        animation: animation,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                TitleView(
                  titleName: 'Chapters',
                  inputDialogName: 'Chapter Name',
                  inputDialogHint: 'Ex: collection,importent ...ets',
                  inputDialogCoverName: 'Chapter Cover',
                  inputDialogAction: AddAction.chapter,
                ),
                const SizedBox(height: 5),
                // height: MediaQuery.of(context).size.height / 2,
                _chapterData.isNotEmpty
                    ? Expanded(
                        child: AnimatedList(
                          key: key,
                          //  padding: const EdgeInsets.only(right: 5, left: 5),
                          initialItemCount: _chapterData.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index, animation) {
                            return _buildChapterItem(index, animation, context);
                          },
                        ),
                      )
                    : Expanded(
                        child: Center(
                            child:
                                Text('Add Your frist chapter in this diary😀')),
                      ),

                SizedBox(
                  height: MediaQuery.of(context).padding.bottom,
                ),
              ],
            ),
          );
        }
      },
    );
  }

  ChapterView _buildChapterItem(
      int index, Animation<double> animation, BuildContext context) {
    final _chapterData = Provider.of<ChapterData>(context).items;

    return ChapterView(
      chapterData: _chapterData[index],
      animation: animation,
      onDismissed: (action) => _dismissSlidableItem(context, index, action),
    );
  }
}

class DiaryView extends StatelessWidget {
  final Diary diaryData;
  final AnimationController animationController;
  final Animation animation;

  const DiaryView({this.diaryData, this.animationController, this.animation});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return FadeTransition(
            opacity: animation,
            child: Transform(
              transform:
                  Matrix4.translationValues(25 * (1.0 * animation.value), 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: 130,
                        decoration: BoxDecoration(
                          color: diaryData.customColor,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                            topLeft: Radius.circular(3),
                            bottomLeft: Radius.circular(3),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                            colors: [
                              diaryData.customColor != null
                                  ? diaryData.customColor.withAlpha(255)
                                  : Colors.pink,
                              diaryData.customColor != null
                                  ? diaryData.customColor.withAlpha(50)
                                  : Colors.pink.withRed(5),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.7),
                              offset: const Offset(2.0, 2.0),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: diaryData.image == null
                            ? Text('')
                            : ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                  topLeft: Radius.circular(3),
                                  bottomLeft: Radius.circular(3),
                                ),
                                child: Image.file(
                                  diaryData.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(diaryData.name),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
