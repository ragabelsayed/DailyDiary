import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_daily_diary/models/days.dart';
import 'package:my_daily_diary/providers/day_data.dart';
import 'package:provider/provider.dart';

class DayScreen extends StatelessWidget {
  static const routName = '/day_screen';

  @override
  Widget build(BuildContext context) {
    // DateFormat.E().format(dayData!.date!)
    final routArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final dayId = routArgs['id'];
    final _dayData = Provider.of<DayData>(context)
        .items
        .firstWhere((day) => day.id == dayId);
    // .where((day) => day.id == dayId).toList() ;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            DateFormat.E().format(_dayData.date!),
          )
        ],
      ),
    );
  }
}
