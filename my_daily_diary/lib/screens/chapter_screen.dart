import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_daily_diary/models/days.dart';
import 'package:my_daily_diary/providers/day_data.dart';
import 'package:my_daily_diary/widgets/Lock_view.dart';
import 'package:my_daily_diary/widgets/dialog_view.dart';

import 'package:provider/provider.dart';

class ChapterScreen extends StatelessWidget {
  static const routName = '/chapter_screen';

  Future<bool> _getData() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return true;
  }

  Widget build(BuildContext context) {
    final _dayData = Provider.of<DayData>(context).items;
    return Scaffold(
      body: FutureBuilder(
        future: _getData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text('Add Your frist day in this chapter 😀'),
            );
          } else {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListWheelScrollView(
                    itemExtent: 250,
                    // diameterRatio: 0.1,
                    //magnification: 5.5,
                    // offAxisFraction: 0,
                    // overAndUnderCenterOpacity: 0.8,
                    // perspective: 0.01,
                    // renderChildrenOutsideViewport: false,
                    // squeeze: 5.0,
                    // useMagnifier: false,

                    children: _dayData
                        .map((day) => DaysView(
                              dayData: day,
                              click: () {
                                print(day.name);
                              },
                            ))
                        .toList(),
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return DialogView(
                            name: 'Day Name',
                            hint: 'Ex: 1, 2 ...30 ets',
                            coverName: 'Day Cover',
                            action: AddAction.day,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class DaysView extends StatelessWidget {
  final Day? dayData;
  final Function? click;
  // final PopupMenuButton? pop;
  DaysView({this.dayData, this.click});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: click!(),
          child: Container(
            // width: 130,
            width: double.maxFinite,
            height: double.infinity,
            decoration: BoxDecoration(
              color: dayData!.customColor,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [
                  dayData!.customColor != null
                      ? dayData!.customColor!.withAlpha(255)
                      : Colors.pink,
                  dayData!.customColor != null
                      ? dayData!.customColor!.withAlpha(50)
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
            child: dayData!.image == null
                ? Text('')
                : ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Image.file(
                      dayData!.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
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
                                  Navigator.of(context).pop(false);
                                },
                              ),
                              TextButton(
                                child: Text('Yes'),
                                onPressed: () {
                                  Provider.of<DayData>(context, listen: false)
                                      .removeDay(dayData!.id);
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
              ];
            },
          ),
        ),
        Positioned(
          left: 10,
          top: 10,
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.withOpacity(0.4)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  offset: const Offset(1, 2),
                  blurRadius: 10,
                )
              ],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Text(
                  dayData!.name!,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  // softWrap: false,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
