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

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text(
              DateFormat('EEEE').format(_dayData.date!),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  DateFormat('MMMM').format(_dayData.date!),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey.withOpacity(0.7),
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    DateFormat.d().format(_dayData.date!),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey.withOpacity(0.7),
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
