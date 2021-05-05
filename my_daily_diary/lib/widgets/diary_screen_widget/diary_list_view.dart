import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:my_daily_diary/providers/diary_data.dart';

import 'diary_view.dart';

class DiaryListView extends StatelessWidget {
  final AnimationController _animationController;

  DiaryListView(this._animationController);
  Future<bool> _getData() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final _diaryData = Provider.of<DiaryData>(context).items;

    return FutureBuilder(
      future: _getData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Text('Add Your frist Diary 😀'),
          );
        } else {
          return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 220,
                  width: double.infinity,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _diaryData.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final int count =
                          _diaryData.length > 10 ? 10 : _diaryData.length;
                      final Animation<double> animation =
                          Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve: Interval((1 / count) * index, 1.0,
                              curve: Curves.fastOutSlowIn),
                        ),
                      );
                      _animationController.forward();
                      return DiaryView(
                        diaryData: _diaryData[index],
                        animationController: _animationController,
                        animation: animation,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
