import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class PinCode extends StatefulWidget {
  final void Function(String? password)? password;
  final String btnName;
  final String? lockCode;
  PinCode({this.password, required this.btnName, this.lockCode});

  @override
  _PinCodeState createState() => _PinCodeState();
}

class _PinCodeState extends State<PinCode> {
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
                    if (widget.btnName == 'Save') {
                      widget.password!(_pinPutController.text);
                      _close(context);
                    }
                    if (widget.btnName == 'Unlock') {
                      if (_pinPutController.text == widget.lockCode!) {}
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
