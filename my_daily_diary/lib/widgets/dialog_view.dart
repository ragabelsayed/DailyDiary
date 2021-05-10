import 'dart:io';
import 'package:flutter/material.dart';

import '../providers/chapter_data.dart';

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
  DialogView({
    this.name,
    this.hint,
    this.coverName,
    this.action,
  });

  final _form = GlobalKey<FormState>();
  String _name = '';
  Color _coverColor = Colors.cyan;
  // ignore: avoid_init_to_null
  File? _coverImage = null;

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
          _coverColor = pickcolor;
        } else if (pickcolor == null && image != null) {
          _coverImage = image;
        }
        break;

      case AddAction.chapter:
        if (pickcolor != null && image == null) {
          _coverColor = pickcolor;
        } else if (pickcolor == null && image != null) {
          _coverImage = image;
        }
        break;

      case AddAction.page:
        if (pickcolor != null && image == null) {
          _coverColor = pickcolor;
        } else if (pickcolor == null && image != null) {
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
                _buildTitle(context, name),
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
                          _name = newValue!;
                          break;
                        case AddAction.chapter:
                          _name = newValue!;
                          break;
                        case AddAction.page:
                          _name = newValue!;
                          break;
                        default:
                      }
                    },
                  ),
                ),
                _buildTitle(context, coverName),
                CoverPicker(_getCover),
                Expanded(child: Container()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: Text('Cancel'),
                      style: Theme.of(context).elevatedButtonTheme.style,
                      onPressed: () {
                        _close(context);
                      },
                    ),
                    ElevatedButton(
                      child: Text('Save'),
                      style: Theme.of(context).elevatedButtonTheme.style,
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

  Text _buildTitle(BuildContext context, String? name) {
    return Text.rich(
      TextSpan(
        text: name,
        style: Theme.of(context)
            .textTheme
            .merge(
              TextTheme(
                headline6: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
            .headline6,
        children: [
          TextSpan(
            text: ' *',
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
