import 'package:flutter/material.dart';
import 'package:my_daily_diary/models/diary.dart';
import 'package:my_daily_diary/providers/diary_data.dart';
import 'package:my_daily_diary/widgets/Lock_view.dart';
import 'package:provider/provider.dart';

class DiaryView extends StatelessWidget {
  final Diary? diaryData;
  final AnimationController? animationController;
  final Animation? animation;

  const DiaryView({this.diaryData, this.animationController, this.animation});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: AnimatedBuilder(
        animation: animationController!,
        builder: (context, child) {
          return FadeTransition(
            opacity: animation as Animation<double>,
            child: Transform(
              transform: Matrix4.translationValues(
                  25 * (1.0 * animation!.value), 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 130,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: diaryData!.customColor,
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
                                  diaryData!.customColor != null
                                      ? diaryData!.customColor!.withAlpha(255)
                                      : Colors.pink,
                                  diaryData!.customColor != null
                                      ? diaryData!.customColor!.withAlpha(50)
                                      : Colors.pink.withRed(5),
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.7),
                                  offset: const Offset(2.0, 2.0),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: diaryData!.image == null
                                ? Text('')
                                : ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                      topLeft: Radius.circular(3),
                                      bottomLeft: Radius.circular(3),
                                    ),
                                    child: Image.file(
                                      diaryData!.image!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                        ),
                        Positioned(
                          right: 1,
                          top: 1,
                          child: PopupMenuButton(
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  child: ListTile(
                                    leading: Icon(Icons.lock),
                                    title: Text('Lock'),
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return LockView();
                                        },
                                      );
                                    },
                                  ),
                                ),
                                PopupMenuItem(
                                  child: ListTile(
                                    leading: Icon(Icons.delete),
                                    title: Text('Delete'),
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: Text(
                                                'Are you sure that you want to delete this diary ?'),
                                            actions: [
                                              TextButton(
                                                child: Text('No'),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop(false);
                                                },
                                              ),
                                              TextButton(
                                                child: Text('Yes'),
                                                onPressed: () {
                                                  Provider.of<DiaryData>(
                                                          context,
                                                          listen: false)
                                                      .removeDiary(
                                                          diaryData!.id);
                                                  Navigator.of(context)
                                                      .pop(false);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'This diary has been deleted',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      duration: const Duration(
                                                          seconds: 1),
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
                              ];
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(diaryData!.name!),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
