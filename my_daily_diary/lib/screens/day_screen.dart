import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';

import 'package:my_daily_diary/providers/day_data.dart';
import 'package:provider/provider.dart';

class DayScreen extends StatefulWidget {
  static const routName = '/day_screen';

  @override
  _DayScreenState createState() => _DayScreenState();
}

class _DayScreenState extends State<DayScreen> {
  Map<String, String> _formData = {};

  final _form = GlobalKey<FormState>();

  List<bool> _isSelected1 = [true, false, false];
  List<bool> _isSelected2 = [false, false, false, false];
  Color currentColor = Colors.limeAccent;
  TextAlign _textAlign = TextAlign.left;
  late FontWeight _fontweight;
  late FontStyle _fontStyle;
  bool _fontweightBool = false;
  bool _fontStyleBool = false;

  void changeColor(Color color) {
    // widget.covor(color, null);
    setState(() => currentColor = color);
    print(color.red);
  }

  @override
  Widget build(BuildContext context) {
    final routArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final dayId = routArgs['id'];
    final _dayData = Provider.of<DayData>(context)
        .items
        .firstWhere((day) => day.id == dayId);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text(
              DateFormat('EEEE').format(_dayData.date!),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  DateFormat('MMMM').format(_dayData.date!),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey.withOpacity(0.7),
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    DateFormat.d().format(_dayData.date!),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey.withOpacity(0.7),
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ToggleButtons(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderWidth: 0,
                    children: [
                      Icon(Icons.format_align_left),
                      Icon(Icons.format_align_center),
                      Icon(Icons.format_align_right),

                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width / 6,
                      //   child: Icon(Icons.format_align_left),
                      // ),
                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width / 4,
                      //   child: Icon(Icons.format_align_center),
                      // ),
                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width / 6,
                      //   child: Icon(Icons.format_align_right),
                      // ),
                    ],
                    onPressed: (newIndex) {
                      for (var index = 0;
                          index < _isSelected1.length;
                          index++) {
                        setState(() {
                          if (index == 0 && newIndex == 0) {
                            _isSelected1[index] = !_isSelected1[index];
                            _textAlign = TextAlign.left;
                          } else if (index == 1 && newIndex == 1) {
                            _isSelected1[index] = !_isSelected1[index];
                            _textAlign = TextAlign.center;
                          } else if (index == 2 && newIndex == 2) {
                            _isSelected1[index] = !_isSelected1[index];
                            _textAlign = TextAlign.right;
                          } else {
                            _isSelected1[index] = false;
                          }
                        });
                      }
                    },
                    isSelected: _isSelected1,
                  ),
                  const SizedBox(width: 10),
                  ToggleButtons(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderWidth: 0,
                    children: [
                      Icon(Icons.format_bold),
                      Icon(Icons.format_italic),
                      Icon(Icons.format_color_text),
                      Icon(Icons.font_download),

                      // Icon(Icons.format_size),
                      // Icon(Icons.format_underline),

                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width / 6,
                      //   child: Icon(Icons.format_align_left),
                      // ),
                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width / 4,
                      //   child: Icon(Icons.format_align_center),
                      // ),
                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width / 6,
                      //   child: Icon(Icons.format_align_right),
                      // ),
                    ],
                    onPressed: (newIndex) {
                      for (var index = 0;
                          index < _isSelected2.length;
                          index++) {
                        setState(() {
                          if (index == 0 && newIndex == 0) {
                            _isSelected2[index] = !_isSelected2[index];
                            _fontweightBool = !_fontweightBool;
                            _fontweight = FontWeight.bold;
                          } else if (index == 1 && newIndex == 1) {
                            _isSelected2[index] = !_isSelected2[index];
                            _fontStyleBool = !_fontStyleBool;
                            _fontStyle = FontStyle.italic;
                          } else if (index == 2 && newIndex == 2) {
                            _isSelected2[index] = !_isSelected2[index];
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Select a color'),
                                  content: SingleChildScrollView(
                                    child: BlockPicker(
                                      pickerColor: currentColor,
                                      onColorChanged: changeColor,
                                    ),
                                  ),
                                );
                              },
                            );
                          } else if (index == 3 && newIndex == 3) {
                          } else {
                            _isSelected2[index] = false;
                          }
                        });
                      }
                    },
                    isSelected: _isSelected2,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: Form(
                  key: _form,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 20.0),
                          child: TextFormField(
                            minLines: 1,
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.multiline,
                            cursorColor: Color(0xFF3C4858),
                            style: TextStyle(fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              hintText: 'What\'s our topic of discussion?',
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(100),
                            ],
                            // validator: InputValidator.title,
                            onSaved: (value) => _formData['title'] = value!,
                          ),
                        ),
                        TextFormField(
                          maxLines: null,
                          // expands: true,
                          textAlign: _textAlign,
                          style: TextStyle(
                            color: currentColor,
                            fontWeight: _fontweightBool
                                ? _fontweight
                                : FontWeight.normal,
                            fontStyle:
                                _fontStyleBool ? _fontStyle : FontStyle.normal,
                          ),
                          cursorColor: Color(0xFF3C4858),
                          keyboardType: TextInputType.multiline,

                          decoration: InputDecoration.collapsed(
                              hintText:
                                  'Tell me about it, I don\'t snitch 🤐..'),
                          // validator: InputValidator.content,
                          onSaved: (value) => _formData['content'] = value!,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }
}
