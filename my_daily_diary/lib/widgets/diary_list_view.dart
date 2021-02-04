import 'package:flutter/material.dart';
import 'package:my_daily_diary/models/diary.dart';
import 'package:my_daily_diary/providers/diary_data.dart';
import 'package:provider/provider.dart';

class DiaryListView extends StatefulWidget {
  @override
  _DiaryListViewState createState() => _DiaryListViewState();
}

class _DiaryListViewState extends State<DiaryListView>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
  }

  Future<bool> _getData() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
          return Container(
            height: 220,
            width: double.infinity,
            child: ListView.builder(
              padding: const EdgeInsets.only(right: 16, left: 16),
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
          );
        }
      },
    );
  }
}

class DiaryView extends StatelessWidget {
  final Diary diaryData;
  final AnimationController animationController;
  final Animation animation;

  const DiaryView({this.diaryData, this.animationController, this.animation});
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform:
                Matrix4.translationValues(100 * (1.0 * animation.value), 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: 130,
                      decoration: BoxDecoration(
                        color: diaryData.customColor,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            offset: const Offset(2.0, 2.0),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: null,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Text(diaryData.name),
              ],
            ),
          ),
        );
      },
    );
  }
}
