import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class LockView extends StatefulWidget {
  @override
  LockViewState createState() => LockViewState();
}

class LockViewState extends State<LockView> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  void _close(BuildContext context) {
    Navigator.pop(context);
  }
  // @override
  // void dispose() {
  //   _pinPutController.dispose();
  //   _pinPutFocusNode.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        // color: Colors.white,
        height: MediaQuery.of(context).size.height / 3,
        color: Theme.of(context).primaryColor,
        margin: const EdgeInsets.all(20.0),
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
            const SizedBox(height: 10),
            PinPut(
              fieldsCount: 5,
              // onSubmit: (String pin) => _showSnackBar(pin, context),
              // focusNode: _pinPutFocusNode,
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
            // Expanded(child: Container()),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     ElevatedButton(
            //       child: Text('Cancel'),
            //       style: Theme.of(context).elevatedButtonTheme.style,
            //       onPressed: () {
            //         _close(context);
            //       },
            //     ),
            //     ElevatedButton(
            //       child: Text('Save'),
            //       style: Theme.of(context).elevatedButtonTheme.style,
            //       onPressed: () {
            //         // _saveForm(context);
            //       },
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  // void _showSnackBar(String pin, BuildContext context) {
  //   final snackBar = SnackBar(
  //     duration: const Duration(seconds: 3),
  //     content: Container(
  //       height: 80.0,
  //       child: Center(
  //         child: Text(
  //           'Pin Submitted. Value: $pin',
  //           style: const TextStyle(fontSize: 25.0),
  //         ),
  //       ),
  //     ),
  //     backgroundColor: Colors.deepPurpleAccent,
  //   );
  //   Scaffold.of(context)
  //     ..hideCurrentSnackBar()
  //     ..showSnackBar(snackBar);
  // }
}
