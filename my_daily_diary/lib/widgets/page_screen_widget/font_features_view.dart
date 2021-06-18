import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:my_daily_diary/models/page.dart';
import 'package:my_daily_diary/providers/page_data.dart';

class FontFeatures extends StatefulWidget {
  final ChapterPage pageData;
  FontFeatures({required this.pageData});
  @override
  _FontFeaturesState createState() => _FontFeaturesState();
}

class _FontFeaturesState extends State<FontFeatures> {
  List<String> fontMenu = [
    'lato',
    'roboto',
    'openSans',
    'raleway',
    'teko',
    'lobster',
    'dancingScript',
    'pacifico',
    'kaushanScript',
    'indieFlower',
  ];

  void changeColor(Color color) {
    Provider.of<PageData>(context, listen: false).setCurrentColor(color);
  }

  @override
  Widget build(BuildContext context) {
    String _dropdownValue =
        Provider.of<PageData>(context, listen: false).fontName;
    Color _currentColor = Provider.of<PageData>(context).currentColor;

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
                for (var index = 0;
                    index < widget.pageData.isSelected1.length;
                    index++) {
                  setState(() {
                    if (index == 0 && newIndex == 0) {
                      widget.pageData.isSelected1[index] =
                          !widget.pageData.isSelected1[index];
                      Provider.of<PageData>(context, listen: false)
                          .setTextAlign(TextAlign.left);
                    } else if (index == 1 && newIndex == 1) {
                      widget.pageData.isSelected1[index] =
                          !widget.pageData.isSelected1[index];
                      Provider.of<PageData>(context, listen: false)
                          .setTextAlign(TextAlign.center);
                    } else if (index == 2 && newIndex == 2) {
                      widget.pageData.isSelected1[index] =
                          !widget.pageData.isSelected1[index];
                      Provider.of<PageData>(context, listen: false)
                          .setTextAlign(TextAlign.right);
                    } else {
                      widget.pageData.isSelected1[index] = false;
                    }
                  });
                }
              },
              isSelected: widget.pageData.isSelected1,
            ),
            const SizedBox(width: 10),
            ToggleButtons(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              borderWidth: 0,
              children: [
                Icon(Icons.format_bold),
                Icon(Icons.format_italic),
              ],
              onPressed: (newIndex) {
                for (var index = 0;
                    index < widget.pageData.isSelected2.length;
                    index++) {
                  setState(() {
                    if (index == 0 && newIndex == 0) {
                      widget.pageData.isSelected2[index] =
                          !widget.pageData.isSelected2[index];
                      Provider.of<PageData>(context, listen: false)
                          .setFontweight();
                    } else if (index == 1 && newIndex == 1) {
                      widget.pageData.isSelected2[index] =
                          !widget.pageData.isSelected2[index];
                      Provider.of<PageData>(context, listen: false)
                          .setFontStyle();
                    } else {
                      widget.pageData.isSelected2[index] = false;
                    }
                  });
                }
              },
              isSelected: widget.pageData.isSelected2,
            ),
            const SizedBox(width: 10),
            IconButton(
                icon: Icon(Icons.format_color_text_rounded),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Select a color'),
                        content: SingleChildScrollView(
                          child: BlockPicker(
                            pickerColor: _currentColor,
                            onColorChanged: changeColor,
                          ),
                        ),
                      );
                    },
                  );
                }),
            const SizedBox(width: 10),
            DropdownButton(
              value: _dropdownValue,
              style: const TextStyle(color: Colors.blue),
              underline: Container(
                height: 2,
                color: Colors.blueAccent,
              ),
              onChanged: (String? newValue) {
                Provider.of<PageData>(context, listen: false)
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
