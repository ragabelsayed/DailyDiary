import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class LockView extends StatefulWidget {
  // method to pass and save password for obj when it is created for first time from DialogView. useally use when btnName = save
  final void Function(String? password)? password;
  // name of btn. it also will used to determine the operation for this widget like (save, lock, unlock)
  final String btnName;
  // used to pass lock code from user to open obj which is already locked.
  final String? lockCode;
  // used to make password for obj and save it in D.B.
  final Function(String? lockCode)? lockItem;
  // used to unlock item only while using the app (make obj open only in memory and running time and not saved in D.B)
  final Function? unLockItem;
  LockView({
    this.password,
    required this.btnName,
    this.lockCode,
    this.lockItem,
    this.unLockItem,
  });
  @override
  LockViewState createState() => LockViewState();
}

class LockViewState extends State<LockView> {
  final TextEditingController _pinPutController = TextEditingController();
  bool _validateCode = false;
  String _errorMessage = '';

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  void _close(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _pinPutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: MediaQuery.of(context).size.height / 4 + 15,
        // margin: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'PIN Code',
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
            ),
            const SizedBox(height: 15),
            PinPut(
              fieldsCount: 5,
              controller: _pinPutController,
              submittedFieldDecoration: _pinPutDecoration.copyWith(
                borderRadius: BorderRadius.circular(20.0),
              ),
              selectedFieldDecoration: _pinPutDecoration,
              followingFieldDecoration: _pinPutDecoration.copyWith(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: Colors.deepPurpleAccent.withOpacity(.5),
                ),
              ),
              onSubmit: (value) {
                setState(() {
                  _validateCode = !_validateCode;
                });
              },
            ),
            _validateCode
                ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _errorMessage,
                        style: TextStyle(color: Theme.of(context).errorColor),
                      ),
                    ),
                  )
                : Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton(
                  child: Text('Cancel'),
                  style: Theme.of(context).elevatedButtonTheme.style,
                  onPressed: () {
                    _close(context);
                  },
                ),
                ElevatedButton(
                  child: Text(widget.btnName),
                  style: Theme.of(context).elevatedButtonTheme.style,
                  onPressed: () {
                    // Save password when creating obj for first time from dialog view.
                    if (widget.btnName == 'Save') {
                      if (_pinPutController.text.isNotEmpty) {
                        widget.password!(_pinPutController.text);
                        _close(context);
                      } else {
                        setState(() {
                          _validateCode = !_validateCode;
                          _errorMessage = 'Enter your code first !';
                        });
                      }
                    }
                    // add locke code for certain obj already exists.
                    if (widget.btnName == 'Lock') {
                      if (_pinPutController.text.isNotEmpty) {
                        widget.lockItem!(_pinPutController.text);
                        _close(context);
                      } else {
                        setState(() {
                          _validateCode = !_validateCode;
                          _errorMessage = 'Enter your code first !';
                        });
                      }
                    }
                    // check lock code to open certain obj.
                    if (widget.btnName == 'Unlock') {
                      if (_pinPutController.text == widget.lockCode!) {
                        widget.unLockItem!();
                        _close(context);
                      }
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
