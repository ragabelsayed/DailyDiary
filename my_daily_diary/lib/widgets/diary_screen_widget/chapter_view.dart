import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:my_daily_diary/screens/chapter_screen.dart';
import 'package:my_daily_diary/models/chapter.dart';
import 'package:my_daily_diary/providers/chapter_data.dart';
import 'package:my_daily_diary/providers/page_data.dart';

import '../lock_view.dart';

enum SlidableAction { lock, delete }

class ChapterView extends StatelessWidget {
  final Chapter chapterData;
  final Animation animation;
  final AnimationController animationController;
  final Function(SlidableAction action)? onDismissed;

  const ChapterView({
    required this.chapterData,
    required this.animation,
    required this.animationController,
    this.onDismissed,
  });
  @override
  Widget build(BuildContext context) {
    final _password = chapterData.password;
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        ListTile _listTile = ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: chapterData.customColor.withAlpha(255),
            foregroundImage: chapterData.image != null
                ? FileImage(chapterData.image!)
                : null,
          ),
          title: Text(
            chapterData.name,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          trailing: IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () {
              Navigator.of(context).pushNamed(
                ChapterScreen.routName,
              );
              Provider.of<PageData>(context, listen: false)
                  .setPages(chapterData);
            },
          ),
        );
        return FadeTransition(
          opacity: animation as Animation<double>,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 25 * (-1.0 * animation.value), 0.0),
            child: Slidable(
              actionPane: SlidableBehindActionPane(),
              actions: [
                Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 8, left: 5),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).shadowColor.withOpacity(0.3),
                        offset: const Offset(1.0, 2.0),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: IconSlideAction(
                      caption: 'Lock',
                      color: Colors.grey[700]!.withOpacity(0.7),
                      icon: Icons.lock,
                      onTap: _password.isEmpty
                          ? () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return LockView(
                                    btnName: 'Lock',
                                    lockItem: (String? lockcode) {
                                      Provider.of<ChapterData>(context,
                                          listen: false)
                                        ..currentChapter(chapterData.id)
                                        ..lockDiary(lockcode!);
                                    },
                                  );
                                },
                              );
                            }
                          : null,
                    ),
                  ),
                ),
              ],
              secondaryActions: [
                Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 8, right: 5),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).shadowColor.withOpacity(0.3),
                        offset: const Offset(1.0, 2.0),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: IconSlideAction(
                      caption: 'Delete',
                      color: Colors.red,
                      icon: Icons.delete,
                      // onTap: () => onDismissed(SlidableAction.delete),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(
                                'Are you sure that you want to delete this chapter ?',
                              ),
                              actions: [
                                TextButton(
                                  child: Text('No'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text('Yes'),
                                  onPressed: () {
                                    Provider.of<ChapterData>(context,
                                            listen: false)
                                        .removeChapter(chapterData);

                                    Navigator.of(context).pop();
                                    ScaffoldMessenger.of(context)
                                      ..removeCurrentSnackBar()
                                      ..showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Chapter has been deleted',
                                            style: Theme.of(context)
                                                .snackBarTheme
                                                .contentTextStyle,
                                            textAlign: TextAlign.center,
                                          ),
                                          shape: StadiumBorder(),
                                          behavior: SnackBarBehavior.floating,
                                          duration: const Duration(seconds: 1),
                                        ),
                                      );
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).shadowColor.withOpacity(0.3),
                      offset: const Offset(1.0, 2.0),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: _password.isNotEmpty && !chapterData.passwordState
                    ? InkWell(
                        child: Stack(
                          children: [
                            Opacity(opacity: 0.3, child: _listTile),
                            Positioned(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 10,
                              child: Icon(
                                Icons.lock,
                                size: 35,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => LockView(
                              btnName: 'Unlock',
                              lockCode: _password,
                              unLockItem: () {
                                Provider.of<ChapterData>(context, listen: false)
                                  ..currentChapter(chapterData.id)
                                  ..unLockChapter(true);
                              },
                            ),
                          );
                        },
                      )
                    : _password.isNotEmpty && chapterData.passwordState
                        ? ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 10),
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundColor:
                                  chapterData.customColor.withAlpha(255),
                              foregroundImage: chapterData.image != null
                                  ? FileImage(chapterData.image!)
                                  : null,
                            ),
                            title: Text(
                              chapterData.name,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.lock_open,
                                  size: 25,
                                ),
                                IconButton(
                                  icon: Icon(Icons.arrow_forward_ios),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                      ChapterScreen.routName,
                                    );
                                    Provider.of<PageData>(context,
                                            listen: false)
                                        .setPages(chapterData);
                                  },
                                ),
                              ],
                            ),
                          )
                        : _listTile,
              ),
            ),
          ),
        );
      },
    );
  }
}
