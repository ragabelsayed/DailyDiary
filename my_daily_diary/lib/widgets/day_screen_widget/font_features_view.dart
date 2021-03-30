import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:my_daily_diary/providers/day_data.dart';
import 'package:provider/provider.dart';

class FontFeatures extends StatefulWidget {
  @override
  _FontFeaturesState createState() => _FontFeaturesState();
}

class _FontFeaturesState extends State<FontFeatures> {
  List<bool> _isSelected1 = [true, false, false];
  List<bool> _isSelected2 = [false, false, false];
  List<String> fontMenu = [
    'lato',
    'roboto',
    'openSans',
    'raleway',
    'quicksand',
    'dancingScript',
    'pacifico',
    'indieFlower'
  ];

  void changeColor(Color color) {
    Provider.of<DayData>(context, listen: false).setCurrentColor(color);
  }

  @override
  Widget build(BuildContext context) {
    String _dropdownValue =
        Provider.of<DayData>(context, listen: false).fontName;
    Color _currentColor = Provider.of<DayData>(context).currentColor;

    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 20),
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
              ],
              onPressed: (newIndex) {
                for (var index = 0; index < _isSelected1.length; index++) {
                  setState(() {
                    if (index == 0 && newIndex == 0) {
                      _isSelected1[index] = !_isSelected1[index];
                      Provider.of<DayData>(context, listen: false)
                          .setTextAlign(TextAlign.left);
                    } else if (index == 1 && newIndex == 1) {
                      _isSelected1[index] = !_isSelected1[index];
                      Provider.of<DayData>(context, listen: false)
                          .setTextAlign(TextAlign.center);
                    } else if (index == 2 && newIndex == 2) {
                      _isSelected1[index] = !_isSelected1[index];
                      Provider.of<DayData>(context, listen: false)
                          .setTextAlign(TextAlign.right);
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
                // Icon(Icons.font_download),
                // Icon(Icons.format_size),
                // Icon(Icons.format_underline),
              ],
              onPressed: (newIndex) {
                for (var index = 0; index < _isSelected2.length; index++) {
                  setState(() {
                    if (index == 0 && newIndex == 0) {
                      _isSelected2[index] = !_isSelected2[index];
                      Provider.of<DayData>(context, listen: false)
                          .setFontweight();
                    } else if (index == 1 && newIndex == 1) {
                      _isSelected2[index] = !_isSelected2[index];
                      Provider.of<DayData>(context, listen: false)
                          .setFontStyle();
                    } else if (index == 2 && newIndex == 2) {
                      _isSelected2[index] = !_isSelected2[index];
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Select a color'),
                            content: SingleChildScrollView(
                              child: BlockPicker(
                                pickerColor: _currentColor,
                                onColorChanged: changeColor,
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      _isSelected2[index] = false;
                    }
                  });
                }
              },
              isSelected: _isSelected2,
            ),
            const SizedBox(width: 10),
            DropdownButton(
              value: _dropdownValue,
              // icon: const Icon(Icons.font_download),
              style: const TextStyle(color: Colors.blue),
              underline: Container(
                height: 2,
                color: Colors.blueAccent,
              ),
              onChanged: (String? newValue) {
                Provider.of<DayData>(context, listen: false)
                    .setFontName(newValue!);
              },
              items: fontMenu
                  .map(
                    (font) => DropdownMenuItem(
                      value: font,
                      child: Text(font),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
