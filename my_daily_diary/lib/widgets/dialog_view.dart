import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_daily_diary/models/chapter.dart';
import 'package:my_daily_diary/models/diary.dart';
import 'package:my_daily_diary/providers/chapter_data.dart';
import 'package:my_daily_diary/providers/diary_data.dart';
import 'package:my_daily_diary/widgets/cover_picker.dart';
import 'package:provider/provider.dart';

enum AddAction { diary, chapter }

class DialogView extends StatefulWidget {
  final String name;
  final String hint;
  final String coverName;
  final AddAction action;
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
  );

  Chapter _newChapter = Chapter(name: '', image: '');

  void _saveForm(BuildContext context) {
    switch (widget.action) {
      case AddAction.diary:
        _form.currentState.save();
        Provider.of<DiaryData>(context, listen: false).addItem(_newDiary);
        Navigator.pop(context);
        break;
      case AddAction.chapter:
        _form.currentState.save();
        Provider.of<ChapterData>(context, listen: false).addItem(_newChapter);
        Navigator.pop(context);
        break;
    }
  }

  void _getCover(Color pickcolor, File image) {
    switch (widget.action) {
      case AddAction.diary:
        if (pickcolor != null && image == null) {
          _newDiary = Diary(
            id: _newDiary.id,
            name: _newDiary.name,
            customColor: pickcolor,
          );
        } else if (pickcolor == null && image != null) {
          setState(() {
            _newDiary = Diary(
              id: _newDiary.id,
              name: _newDiary.name,
              image: image,
            );
          });
        }
        break;

      case AddAction.chapter:
        if (pickcolor != null && image == null) {
          _newDiary = Diary(
            id: _newDiary.id,
            name: _newDiary.name,
            customColor: pickcolor,
          );
        } else if (pickcolor == null && image != null) {
          setState(() {
            _newDiary = Diary(
              id: _newDiary.id,
              name: _newDiary.name,
              image: image,
            );
          });
        }
        break;
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: widget.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
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
                      onSaved: (newValue) => _newDiary = Diary(
                        id: DateTime.now().toString(),
                        name: newValue,
                        customColor: _newDiary.customColor,
                        image: _newDiary.image,
                      ),
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: widget.coverName,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                          text: ' *',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  CoverPicker(_getCover),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RaisedButton(
                        elevation: 3.0,
                        child: Text('Cancel'),
                        onPressed: () {
                          _close(context);
                        },
                      ),
                      RaisedButton(
                        elevation: 3.0,
                        child: Text('Save'),
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
      ),
    );
  }
}
