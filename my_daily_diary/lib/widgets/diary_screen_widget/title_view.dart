import 'package:flutter/material.dart';

import '../dialog_view.dart';

class TitleView extends StatelessWidget {
  final String titleName;
  final String inputDialogName;
  final String inputDialogHint;
  final String inputDialogCoverName;
  final AddAction inputDialogAction;
  final String inputDialogLockName;
  final double opacityLevel;
  const TitleView({
    required this.titleName,
    required this.inputDialogName,
    required this.inputDialogHint,
    required this.inputDialogCoverName,
    required this.inputDialogAction,
    required this.inputDialogLockName,
    required this.opacityLevel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            titleName,
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
          AnimatedOpacity(
            opacity: opacityLevel,
            duration: const Duration(seconds: 3),
            child: FloatingActionButton.extended(
              heroTag: 'btn$inputDialogAction',
              label: Icon(Icons.add),
              backgroundColor:
                  Theme.of(context).floatingActionButtonTheme.backgroundColor,
              foregroundColor:
                  Theme.of(context).floatingActionButtonTheme.foregroundColor,
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) {
                    return DialogView(
                      name: inputDialogName,
                      hint: inputDialogHint,
                      coverName: inputDialogCoverName,
                      action: inputDialogAction,
                      lockName: inputDialogLockName,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
