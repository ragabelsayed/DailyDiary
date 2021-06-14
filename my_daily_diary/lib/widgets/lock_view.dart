import 'package:flutter/material.dart';
import 'package:my_daily_diary/providers/diary_data.dart';

import 'package:pinput/pin_put/pin_put.dart';
import 'package:provider/provider.dart';

enum AddAcionFor { diary, chapter, page }

class LockView extends StatefulWidget {
  // method to pass and save password for obj when it is created for first time from DialogView. useally use when btnName = save
  final void Function(String? password)? password;
  // name of btn. it also will used to determine the operation for this widget like (save, lock, unlock)
  final String btnName;
  // used to pass lock code from user to open obj which is already locked.
  final String? lockCode;
  // used when you want to implement some action or method for certain obj. Useally used in lock or unlock operation to lock or un lock for certain obj.
  final AddAcionFor? addAcionFor;
  LockView({
    this.password,
    required this.btnName,
    this.lockCode,
    this.addAcionFor,
  });
  @override
  LockViewState createState() => LockViewState();
}

class LockViewState extends State<LockView> {
  final TextEditingController _pinPutController = TextEditingController();

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
        height: MediaQuery.of(context).size.height / 4,
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
            ),
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
                  child: Text(widget.btnName),
                  style: Theme.of(context).elevatedButtonTheme.style,
                  onPressed: () {
                    // Save password when creating obj for first time from dialog view.
                    if (widget.btnName == 'Save') {
                      widget.password!(_pinPutController.text);
                      _close(context);
                    }
                    // add locke code for certain obj already exists.
                    if (widget.btnName == 'Lock') {
                      switch (widget.addAcionFor!) {
                        case AddAcionFor.diary:
                          // Provider.of<DiaryData>(context, listen: false)
                          //     .setlockstate(true);
                          // _close(context);

                          break;
                        default:
                      }
                    }
                    // check lock code to open certain obj.
                    if (widget.btnName == 'Unlock') {
                      if (_pinPutController.text == widget.lockCode!) {
                        switch (widget.addAcionFor!) {
                          case AddAcionFor.diary:
                            Provider.of<DiaryData>(context, listen: false)
                                .setlockstate(true);
                            _close(context);

                            break;
                          default:
                        }
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
