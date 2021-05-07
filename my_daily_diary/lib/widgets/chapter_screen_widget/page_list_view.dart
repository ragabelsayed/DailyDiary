import 'package:flutter/material.dart';
import 'package:my_daily_diary/providers/page_data.dart';
import 'package:my_daily_diary/widgets/chapter_screen_widget/page_view.dart';
import 'package:provider/provider.dart';

class PageListView extends StatelessWidget {
  final AnimationController _animationController;
  PageListView(this._animationController);
  @override
  Widget build(BuildContext context) {
    final _pageData = Provider.of<PageData>(context).items;

    return _pageData.isNotEmpty
        ? ListView.builder(
            primary: false,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 5,
            ),
            itemCount: _pageData.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              final int count = _pageData.length > 10 ? 10 : _pageData.length;
              final Animation<double> animation =
                  Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: Interval((1 / count) * index, 1.0,
                      curve: Curves.fastOutSlowIn),
                ),
              );
              _animationController.forward();
              return PagesView(
                pageData: _pageData[index],
                animation: animation,
                animationController: _animationController,
              );
            },
          )
        : Center(
            child: Text(
              'Add Your frist page in this chapter😀',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          );
  }
  // Padding(
  //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //   child: ListWheelScrollView(
  //     itemExtent: 250,
  // diameterRatio: 0.1,
  //magnification: 5.5,
  // offAxisFraction: 0,
  // overAndUnderCenterOpacity: 0.8,
  // perspective: 0.01,
  // renderChildrenOutsideViewport: false,
  // squeeze: 5.0,
  // useMagnifier: false,
  //     children: _dayData
  //         .map((day) => DaysView(
  //               dayData: day,
  //               click: () {
  //                 print(day.name);
  //               },
  //             ))
  //         .toList(),
  //   ),
  // ),

}
