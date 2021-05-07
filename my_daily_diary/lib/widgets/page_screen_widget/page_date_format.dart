import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_daily_diary/widgets/change_theme_btn_widget.dart';

class PageDateFormat extends StatelessWidget {
  final DateTime _dayDate;
  PageDateFormat(this._dayDate);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                DateFormat('EEEE').format(_dayDate),
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .merge(
                      TextTheme(
                        headline5: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                        ),
                      ),
                    )
                    .headline5,
              ),
              ChangeThemeButtonWidget(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                DateFormat('MMMM').format(_dayDate),
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .merge(
                      TextTheme(
                        caption: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                        ),
                      ),
                    )
                    .caption,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  DateFormat.d().format(_dayDate),
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .merge(
                        TextTheme(
                          caption: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                          ),
                        ),
                      )
                      .caption,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
