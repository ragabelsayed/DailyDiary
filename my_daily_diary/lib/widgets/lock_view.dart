import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class LockView extends StatefulWidget {
  @override
  LockViewState createState() => LockViewState();
}

class LockViewState extends State<LockView> {
  final List<bool> _isSelected = [false, false];
  // final TextEditingController _pinPutController = TextEditingController();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  void _pinCode() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          height: MediaQuery.of(context).size.height / 4,
          color: Theme.of(context).primaryColor,
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
                onSaved: (newValue) {},
                // controller: _pinPutController,
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
                    child: Text('Save'),
                    style: Theme.of(context).elevatedButtonTheme.style,
                    onPressed: () {
                      // _saveForm(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _close(BuildContext context) {
    Navigator.pop(context);
  }

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
                  _pinCode();
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
