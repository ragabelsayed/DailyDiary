import 'package:flutter/material.dart';
import 'package:my_daily_diary/widgets/pin_code.dart';
import 'package:pinput/pin_put/pin_put.dart';

class LockView extends StatefulWidget {
  final void Function(String? password)? password;
  final String btnName;
  final String? lockCode;
  LockView({
    this.password,
    required this.btnName,
    this.lockCode,
  });
  @override
  LockViewState createState() => LockViewState();
}

class LockViewState extends State<LockView> {
  final List<bool> _isSelected = [false, false];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        child: ToggleButtons(
          borderRadius: BorderRadius.circular(50),
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: Icon(Icons.pin),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: Icon(Icons.fingerprint),
            ),
          ],
          onPressed: (newIndex) {
            for (var index = 0; index < _isSelected.length; index++) {
              setState(() {
                if (index == 0 && newIndex == 0) {
                  _isSelected[index] = !_isSelected[index];
                  showDialog(
                    context: context,
                    builder: (context) => PinCode(
                      btnName: widget.btnName,
                      password: widget.password,
                    ),
                  );
                } else if (index == 1 && newIndex == 1) {
                  _isSelected[index] = !_isSelected[index];
                } else {
                  _isSelected[index] = false;
                }
              });
            }
          },
          isSelected: _isSelected,
        ),
      ),
    );
  }
}
