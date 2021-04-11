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

class DialogView extends StatefulWidget {
  final String? name;
  final String? hint;
  final String? coverName;
  final AddAction? action;
  const DialogView({this.name, this.hint, this.coverName, this.action});
  @override
  _DialogViewState createState() => _DialogViewState();
}

class _DialogViewState extends State<DialogView> {
  final _form = GlobalKey<FormState>();

  Diary _newDiary = Diary(
    id: null,
    name: '',
    customColor: Colors.cyan,
    image: null,
    chapters: [],
  );

  Chapter _newChapter = Chapter(
    id: null,
    name: '',
    image: null,
    customColor: Colors.cyan,
    pages: [],
  );

  late ChapterPage _newPage;

  void _saveForm(BuildContext context) {
    switch (widget.action) {
      case AddAction.diary:
        _form.currentState!.save();
        Provider.of<DiaryData>(context, listen: false).addDiary(_newDiary);
        Navigator.pop(context);
        break;
      case AddAction.chapter:
        _form.currentState!.save();
        Provider.of<ChapterData>(context, listen: false)
            .addChapter(_newChapter);
        Navigator.pop(context);
        break;
      case AddAction.page:
        _form.currentState!.save();
        Provider.of<PageData>(context, listen: false).addPage(_newPage);
        Navigator.pop(context);
        break;
      default:
    }
  }

  void _getCover(Color? pickcolor, File? image) {
    switch (widget.action) {
      case AddAction.diary:
        if (pickcolor != null && image == null) {
          _newDiary = Diary(
            id: _newDiary.id,
            name: _newDiary.name,
            customColor: pickcolor,
            chapters: _newDiary.chapters,
          );
        } else if (pickcolor == null && image != null) {
          setState(() {
            _newDiary = Diary(
              id: _newDiary.id,
              name: _newDiary.name,
              image: image,
              chapters: _newDiary.chapters,
            );
          });
        }
        break;

      case AddAction.chapter:
        if (pickcolor != null && image == null) {
          _newChapter = Chapter(
            id: _newChapter.id,
            name: _newChapter.name,
            customColor: pickcolor,
            pages: _newChapter.pages,
          );
        } else if (pickcolor == null && image != null) {
          setState(() {
            _newChapter = Chapter(
              id: _newChapter.id,
              name: _newChapter.name,
              image: image,
              pages: _newChapter.pages,
            );
          });
        }
        break;

      case AddAction.page:
        if (pickcolor != null && image == null) {
          _newPage = ChapterPage(customColor: pickcolor, image: null);
        } else if (pickcolor == null && image != null) {
          _newPage = ChapterPage(image: image);
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
                    text: widget.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
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
                      hintText: widget.hint,
                    ),
                    onSaved: (newValue) {
                      switch (widget.action) {
                        case AddAction.diary:
                          _newDiary = Diary(
                            id: DateTime.now().toString(),
                            name: newValue,
                            customColor: _newDiary.customColor,
                            image: _newDiary.image,
                            chapters: _newDiary.chapters,
                          );
                          break;
                        case AddAction.chapter:
                          _newChapter = Chapter(
                            id: DateTime.now().toString(),
                            name: newValue,
                            customColor: _newChapter.customColor,
                            image: _newChapter.image,
                            pages: _newChapter.pages,
                          );
                          break;
                        case AddAction.page:
                          _newPage = ChapterPage(
                            id: DateTime.now().toString(),
                            date: DateTime.now(),
                            name: newValue!,
                            customColor: _newPage.customColor,
                            image: _newPage.image,
                          );
                          break;
                        default:
                      }
                    },
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: widget.coverName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
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
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(3.0),
                      ),
                      onPressed: () {
                        _close(context);
                      },
                    ),
                    ElevatedButton(
                      child: Text('Save'),
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(3.0),
                      ),
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
