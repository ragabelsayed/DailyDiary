import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class LockView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

// class LocalAuth {
//   static final _auth = LocalAuthentication();

//   static Future<bool> authentication() async {
//     return await _auth.authenticateWithBiometrics(
//       localizedReason: 'Scan Fingerprint to Authnticate',
//       useErrorDialogs: true,
//       stickyAuth: true,
//     );
//   }
// }
