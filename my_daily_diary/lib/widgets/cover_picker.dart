import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';

class CoverPicker extends StatefulWidget {
  final void Function(Color color, File image) covor;
  const CoverPicker(this.covor);
  @override
  _CoverPickerState createState() => _CoverPickerState();
}

class _CoverPickerState extends State<CoverPicker> {
  List<bool> _isSelected = [false, false, false];

  bool lightTheme = true;
  Color currentColor = Colors.limeAccent;
  List<Color> currentColors = [Colors.limeAccent, Colors.green];

  File _image;
  final picker = ImagePicker();
  Future _getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        widget.covor(null, _image);
      } else {
        print('No image selected.');
      }
    });
  }

  void changeColor(Color color) {
    widget.covor(color, null);
    setState(() => currentColor = color);
    print(color.red);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
      child: ToggleButtons(
        borderRadius: BorderRadius.circular(50),
        //renderBorder: false,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 6,
            child: Icon(Icons.color_lens),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 4,
            child: Icon(Icons.photo),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 6,
            child: Icon(Icons.camera_alt),
          ),
        ],
        onPressed: (newIndex) {
          for (var index = 0; index < _isSelected.length; index++) {
            setState(() {
              if (index == 0 && newIndex == 0) {
                _isSelected[index] = !_isSelected[index];
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
              } else if (index == 1 && newIndex == 1) {
                _isSelected[index] = !_isSelected[index];
                _getImage(ImageSource.gallery);
              } else if (index == 2 && newIndex == 2) {
                _isSelected[index] = !_isSelected[index];
                _getImage(ImageSource.camera);
              } else {
                _isSelected[index] = false;
              }
            });
          }
        },
        isSelected: _isSelected,
      ),
    );
  }
}
