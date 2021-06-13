import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_daily_diary/models/diary.dart';
import 'package:my_daily_diary/providers/diary_data.dart';
import 'package:my_daily_diary/providers/chapter_data.dart';
import 'package:my_daily_diary/widgets/popup_menu.dart';
import 'package:my_daily_diary/widgets/pin_code.dart';

class DiaryView extends StatelessWidget {
  final Diary diaryData;
  final AnimationController animationController;
  final Animation animation;

  const DiaryView({
    required this.diaryData,
    required this.animationController,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    final _password = diaryData.password;

    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return FadeTransition(
            opacity: animation as Animation<double>,
            child: Transform(
              transform:
                  Matrix4.translationValues(25 * (1.0 * animation.value), 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Material(
                          child: InkWell(
                            onTap: () {
                              Provider.of<DiaryData>(context, listen: false)
                                  .currentDiary(diaryData.id);
                              if (_password.isNotEmpty &&
                                  !diaryData.passwordState) {
                                showDialog(
                                  context: context,
                                  builder: (context) => PinCode(
                                    btnName: 'Unlock',
                                    lockCode: _password,
                                    passwordState: PasswordState.diary,
                                  ),
                                );
                              } else if (_password.isNotEmpty &&
                                  diaryData.passwordState) {
                                Provider.of<ChapterData>(context, listen: false)
                                  ..setClick(true)
                                  ..setChapters(
                                    diaryData,
                                  );
                              } else {
                                Provider.of<ChapterData>(context, listen: false)
                                  ..setClick(true)
                                  ..setChapters(
                                    diaryData,
                                  );
                              }
                            },
                            child: Container(
                              width: 130,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: diaryData.customColor,
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                  topLeft: Radius.circular(3),
                                  bottomLeft: Radius.circular(3),
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    diaryData.customColor.withAlpha(255),
                                    diaryData.customColor.withAlpha(50),
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context)
                                        .shadowColor
                                        .withOpacity(0.4),
                                    offset: const Offset(2.0, 2.0),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: diaryData.image == null
                                  ? Text('')
                                  : ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(15),
                                        bottomRight: Radius.circular(15),
                                        topLeft: Radius.circular(3),
                                        bottomLeft: Radius.circular(3),
                                      ),
                                      child: Image.file(
                                        diaryData.image!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 1,
                          top: 1,
                          child: PopUpMenu(
                            dialogContent:
                                'Are you sure that you want to delete this diary ?',
                            snackBarContent: 'This diary has been deleted',
                            removeItem: () {
                              Provider.of<DiaryData>(context, listen: false)
                                  .removeDiary(diaryData);
                              Provider.of<ChapterData>(context, listen: false)
                                  .setClick(false);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    diaryData.name,
                    style: Theme.of(context)
                        .textTheme
                        .merge(TextTheme(caption: TextStyle(fontSize: 14)))
                        .caption,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
