import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_daily_diary/models/diary.dart';
import 'package:my_daily_diary/providers/diary_data.dart';
import 'package:my_daily_diary/widgets/cover_picker.dart';
import 'package:provider/provider.dart';

class DialogView extends StatefulWidget {
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

  void _saveForm(BuildContext context) {
    _form.currentState.save();
    Provider.of<DiaryData>(context, listen: false).addItem(_newDiary);
    Navigator.pop(context);
  }

  void _diaryCover(Color pickcolor, File image) {
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
                      text: 'Diary Name',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                          text: '*',
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
                        hintText: 'Ex: 2020, Secret ...ets',
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
                      text: 'Diary Cover',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                          text: '*',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  CoverPicker(_diaryCover),
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
