import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_daily_diary/models/chapter.dart';

enum SlidableAction { lock, delete }

class ChapterView extends StatelessWidget {
  final Chapter chapterData;
  final Animation animation;
  final Function(SlidableAction action) onDismissed;

  const ChapterView({this.chapterData, this.animation, this.onDismissed});
  @override
  Widget build(BuildContext context) {
    return Slidable(
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
              color: Colors.grey[700].withOpacity(0.7),
              icon: Icons.lock,
              onTap: () => onDismissed(SlidableAction.lock),
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
              onTap: () => onDismissed(SlidableAction.delete),
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
              backgroundColor: chapterData.customColor != null
                  ? chapterData.customColor.withAlpha(255)
                  : Colors.pink.shade700,
              child: chapterData.image == null
                  ? Text('')
                  : Image.file(chapterData.image)
              // : ClipRRect(
              //     borderRadius: BorderRadius.only(
              //       topRight: Radius.circular(15),
              //       bottomRight: Radius.circular(15),
              //       topLeft: Radius.circular(3),
              //       bottomLeft: Radius.circular(3),
              //     ),
              //     child: Image.file(
              //       diaryData.image,
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              ),
          title: Text(
            chapterData.name,
            style: TextStyle(fontSize: 18),
          ),
          trailing: IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
