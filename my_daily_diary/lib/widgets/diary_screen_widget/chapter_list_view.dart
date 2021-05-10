import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'chapter_view.dart';
import 'package:my_daily_diary/providers/chapter_data.dart';

class ChapterListView extends StatelessWidget {
  final AnimationController _animationController;
  ChapterListView(this._animationController);
  @override
  Widget build(BuildContext context) {
    final _chapterData = Provider.of<ChapterData>(context).items;
    return _chapterData.isNotEmpty
        ? Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 25),
              itemCount: _chapterData.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final int count =
                    _chapterData.length > 10 ? 10 : _chapterData.length;
                final Animation<double> animation =
                    Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                    parent: _animationController,
                    curve: Interval((1 / count) * index, 1.0,
                        curve: Curves.fastOutSlowIn),
                  ),
                );
                _animationController.forward();
                return ChapterView(
                  chapterData: _chapterData[index],
                  animation: animation,
                  animationController: _animationController,
                );
              },
            ),
          )
        : Expanded(
            child: Center(
              child: Text(
                'Add Your frist chapter in this diary 😀',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          );
  }
}
