import 'package:flutter/material.dart';
import 'package:my_daily_diary/models/days.dart';
import 'package:my_daily_diary/providers/day_data.dart';
import 'package:my_daily_diary/widgets/Lock_view.dart';
import 'package:provider/provider.dart';

class ChapterScreen extends StatelessWidget {
  static const routName = '/chapter_screen';

  // List<DaysView> getDay(){

  // }

  Future<bool> _getData() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return true;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _getData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text('Add Your frist day in this chapter 😀'),
            );
          } else {
            return ListWheelScrollView(
              itemExtent: 50,
              children: [],
            );
          }
        },
      ),
    );
  }
}

// class DaysView extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     Provider.of<DayData>(context).items;
//     return Stack(
//       children: [
//         InkWell(
//           onTap: () {},
//           child: Container(
//             width: 130,
//             height: double.infinity,
//             decoration: BoxDecoration(
//               color: diaryData!.customColor,
//               borderRadius: const BorderRadius.only(
//                 topRight: Radius.circular(15),
//                 bottomRight: Radius.circular(15),
//                 topLeft: Radius.circular(3),
//                 bottomLeft: Radius.circular(3),
//               ),
//               gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.topRight,
//                 colors: [
//                   diaryData!.customColor != null
//                       ? diaryData!.customColor!.withAlpha(255)
//                       : Colors.pink,
//                   diaryData!.customColor != null
//                       ? diaryData!.customColor!.withAlpha(50)
//                       : Colors.pink.withRed(5),
//                 ],
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.7),
//                   offset: const Offset(2.0, 2.0),
//                   blurRadius: 10,
//                 ),
//               ],
//             ),
//            // child: diaryData!.image == null
//               //  ? Text('')
//                 //:
//                  ClipRRect(
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(15),
//                       bottomRight: Radius.circular(15),
//                       topLeft: Radius.circular(3),
//                       bottomLeft: Radius.circular(3),
//                     ),
//                     child: Image.file(
//                       //diaryData!.image!,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//           ),
//         ),
//         Positioned(
//           right: 1,
//           top: 1,
//           child: PopupMenuButton(
//             itemBuilder: (context) {
//               return [
//                 PopupMenuItem(
//                   child: ListTile(
//                     leading: Icon(Icons.lock),
//                     title: Text('Lock'),
//                     onTap: () {
//                       showDialog(
//                         context: context,
//                         builder: (context) {
//                           return LockView();
//                         },
//                       );
//                     },
//                   ),
//                 ),
//                 PopupMenuItem(
//                   child: ListTile(
//                     leading: Icon(Icons.delete),
//                     title: Text('Delete'),
//                     onTap: () {
//                       showDialog(
//                         context: context,
//                         builder: (context) {
//                           return AlertDialog(
//                             content: Text(
//                                 'Are you sure that you want to delete this diary ?'),
//                             actions: [
//                               TextButton(
//                                 child: Text('No'),
//                                 onPressed: () {
//                                   Navigator.of(context).pop(false);
//                                 },
//                               ),
//                               TextButton(
//                                 child: Text('Yes'),
//                                 onPressed: () {

//                                 },
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ];
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
