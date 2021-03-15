import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_daily_diary/models/chapter.dart';
import 'package:my_daily_diary/providers/chapter_data.dart';
import 'package:provider/provider.dart';

enum SlidableAction { lock, delete }

class ChapterView extends StatelessWidget {
  final Chapter? chapterData;
  final Animation? animation;
  final AnimationController? animationController;
  final Function(SlidableAction action)? onDismissed;

  const ChapterView(
      {this.chapterData,
      this.animation,
      this.animationController,
      this.onDismissed});
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (context, child) => FadeTransition(
        opacity: animation as Animation<double>,
        child: Transform(
          transform: Matrix4.translationValues(
              0.0, 25 * (-1.0 * animation!.value), 0.0),
          child: Slidable(
            actionPane: SlidableBehindActionPane(),
            actions: [
              Container(
                margin: const EdgeInsets.only(top: 8, bottom: 8, left: 5),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: const Offset(1.0, 2.0),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: IconSlideAction(
                    caption: 'Secure',
                    color: Colors.grey[700]!.withOpacity(0.7),
                    icon: Icons.lock,
                    onTap: () => onDismissed!(SlidableAction.lock),
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
                      color: Colors.grey.withOpacity(0.5),
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
                                'Are you sure that you want to delete this chapter ?'),
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
                                      .removeChapter(chapterData!.id);
                                  // Scaffold.of(context).showSnackBar(SnackBar(
                                  //   content: Text('Chapter has been deleted',
                                  //       textAlign: TextAlign.center),
                                  // ));
                                  Navigator.of(context).pop();
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: const Offset(1.0, 2.0),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                leading: CircleAvatar(
                    radius: 25,
                    //backgroundImage: AssetImage(chapterData.backgroundImage),
                    backgroundColor: chapterData!.customColor != null
                        ? chapterData!.customColor!.withAlpha(255)
                        : Colors.pink.shade700,
                    child: chapterData!.image == null
                        ? Text('')
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.file(
                              chapterData!.image!,
                              fit: BoxFit.cover,
                            ),
                          )),
                title: Text(
                  chapterData!.name!,
                  style: TextStyle(fontSize: 18),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
