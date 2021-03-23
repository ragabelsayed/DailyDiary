import 'package:flutter/material.dart';
import 'package:my_daily_diary/models/days.dart';
import 'package:my_daily_diary/providers/day_data.dart';
import 'package:provider/provider.dart';

import '../Lock_view.dart';

class DaysView extends StatelessWidget {
  final Day? dayData;
  final AnimationController? animationController;
  final Animation? animation;

  DaysView({
    this.dayData,
    this.animationController,
    this.animation,
  });
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (context, child) => FadeTransition(
        opacity: animation as Animation<double>,
        child: Transform(
          transform: Matrix4.translationValues(
              0.0, 25 * (-0.1 * animation!.value), 0.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    // print(format.format(DateTime.now())
                    print(dayData!.id);
                  },
                  child: Container(
                    height: 250,
                    width: double.infinity,
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
                          offset: const Offset(2.0, 4.0),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: dayData!.image == null
                        ? Text('')
                        : ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            child: Image.file(
                              dayData!.image!,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
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
                                          Provider.of<DayData>(context,
                                                  listen: false)
                                              .removeDay(dayData!.id);

                                          Navigator.of(context).pop();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'This day has been deleted',
                                                textAlign: TextAlign.center,
                                              ),
                                              duration:
                                                  const Duration(seconds: 1),
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
            ),
          ),
        ),
      ),
    );
  }
}
