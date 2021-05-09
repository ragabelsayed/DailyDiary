import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_daily_diary/models/chapter.dart';

import 'package:my_daily_diary/models/diary.dart';
import 'package:my_daily_diary/models/page.dart';
import 'package:my_daily_diary/providers/chapter_data.dart';

import 'package:my_daily_diary/providers/diary_data.dart';
import 'package:my_daily_diary/providers/page_data.dart';
import 'package:my_daily_diary/widgets/cover_picker.dart';
import 'package:provider/provider.dart';

enum AddAction { diary, chapter, page }

// ignore: must_be_immutable
class DialogView extends StatelessWidget {
  final String? name;
  final String? hint;
  final String? coverName;
  final AddAction? action;
  final AnimationController? animationController;
  DialogView(
      {this.name,
      this.hint,
      this.coverName,
      this.action,
      this.animationController});

  final _form = GlobalKey<FormState>();
  // Diary _newDiary = Diary();
  String _name = '';
  Color _coverColor = Colors.cyan;
  // ignore: avoid_init_to_null
  File? _coverImage = null;

  // // Chapter _newChapter = Chapter();
  // String _chapterName = '';
  // Color _chapterColor = Colors.cyan;
  // // ignore: avoid_init_to_null
  // File? _chapterImage = null;
  // // ChapterPage _newPage = ChapterPage();
  // String _pageName = '';
  // Color _pageColor = Colors.cyan;
  // // ignore: avoid_init_to_null
  // File? _pageImage = null;

  void _saveForm(BuildContext context) {
    switch (action) {
      case AddAction.diary:
        _form.currentState!.save();
        Provider.of<DiaryData>(context, listen: false).addDiary(
          name: _name,
          color: _coverColor,
          image: _coverImage,
        );
        Navigator.pop(context);
        break;
      case AddAction.chapter:
        _form.currentState!.save();
        Provider.of<ChapterData>(context, listen: false).addChapter(
          name: _name,
          color: _coverColor,
          image: _coverImage,
        );
        Navigator.pop(context);
        break;
      case AddAction.page:
        _form.currentState!.save();
        Provider.of<PageData>(context, listen: false).addPage(
          name: _name,
          color: _coverColor,
          image: _coverImage,
        );
        Navigator.pop(context);
        break;
      default:
    }
  }

  void _getCover(Color? pickcolor, File? image) {
    switch (action) {
      case AddAction.diary:
        if (pickcolor != null && image == null) {
          // _newDiary = Diary(customColor: pickcolor, image: null);
          _coverColor = pickcolor;
        } else if (pickcolor == null && image != null) {
          // _newDiary = Diary(image: image);
          _coverImage = image;
        }
        break;

      case AddAction.chapter:
        if (pickcolor != null && image == null) {
          // _newChapter = Chapter(customColor: pickcolor, image: null);
          _coverColor = pickcolor;
        } else if (pickcolor == null && image != null) {
          // _newChapter = Chapter(image: image);
          _coverImage = image;
        }
        break;

      case AddAction.page:
        if (pickcolor != null && image == null) {
          // _newPage = ChapterPage(customColor: pickcolor, image: null);
          _coverColor = pickcolor;
        } else if (pickcolor == null && image != null) {
          // _newPage = ChapterPage(image: image);
          _coverImage = image;
        }
        break;
      default:
    }
  }

  void _close(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    text: name,
                    style: Theme.of(context)
                        .textTheme
                        .merge(
                          TextTheme(
                            headline6: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        )
                        .headline6,
                    // style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(
                        text: ' *',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: hint,
                    ),
                    onSaved: (newValue) {
                      switch (action) {
                        case AddAction.diary:
                          // _newDiary = Diary(
                          //   name: newValue!,
                          //   customColor: _newDiary.customColor,
                          //   image: _newDiary.image,
                          // );
                          _name = newValue!;
                          break;
                        case AddAction.chapter:
                          // _newChapter = Chapter(
                          //   name: newValue!,
                          //   customColor: _newChapter.customColor,
                          //   image: _newChapter.image,
                          // );
                          _name = newValue!;
                          break;
                        case AddAction.page:
                          // _newPage = ChapterPage(
                          //   name: newValue!,
                          //   customColor: _newPage.customColor,
                          //   image: _newPage.image,
                          // );
                          _name = newValue!;
                          break;
                        default:
                      }
                    },
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: coverName,
                    style: Theme.of(context)
                        .textTheme
                        .merge(
                          TextTheme(
                            headline6: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        )
                        .headline6,
                    // style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(
                        text: ' *',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                CoverPicker(_getCover),
                Expanded(child: Container()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: Text('Cancel'),
                      style: Theme.of(context).elevatedButtonTheme.style,
                      // ButtonStyle(
                      //   elevation: MaterialStateProperty.all<double>(3.0),
                      // ),
                      onPressed: () {
                        _close(context);
                      },
                    ),
                    ElevatedButton(
                      child: Text('Save'),
                      style: Theme.of(context).elevatedButtonTheme.style,
                      // ButtonStyle(
                      //   elevation: MaterialStateProperty.all<double>(3.0),
                      // ),
                      onPressed: () {
                        _saveForm(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
