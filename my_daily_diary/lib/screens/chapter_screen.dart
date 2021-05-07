import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_daily_diary/providers/page_data.dart';
import 'package:my_daily_diary/widgets/change_theme_btn_widget.dart';

import 'package:my_daily_diary/widgets/chapter_screen_widget/Page_view.dart';
import 'package:my_daily_diary/widgets/chapter_screen_widget/page_list_view.dart';

import 'package:my_daily_diary/widgets/dialog_view.dart';

import 'package:provider/provider.dart';

class ChapterScreen extends StatefulWidget {
  static const routName = '/chapter_screen';
  @override
  _ChapterScreenState createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<bool> _getData() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return true;
  }

  Widget build(BuildContext context) {
    //  final routArgs =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    // final dayId = routArgs['id'];
    // final _dayData = Provider.of<DayData>(context)
    //     .items
    //     .firstWhere((day) => day.id == dayId);
    return Scaffold(
      body: FutureBuilder(
        future: _getData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text('Add Your frist Page in this chapter 😀'),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top),
                Expanded(
                  child: Stack(
                    children: [
                      CustomScrollView(
                        slivers: [
                          _sliverAppBar(),
                          SliverToBoxAdapter(
                            child: PageListView(_animationController),
                          ),
                        ],
                      ),
                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: FloatingActionButton(
                          child: Icon(Icons.add),
                          backgroundColor: Theme.of(context)
                              .floatingActionButtonTheme
                              .backgroundColor,
                          foregroundColor: Theme.of(context)
                              .floatingActionButtonTheme
                              .foregroundColor,
                          onPressed: () {
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (context) {
                                return DialogView(
                                  name: 'Page Name',
                                  hint: 'Ex: 1, 2 ...30 ets',
                                  coverName: 'Page Cover',
                                  action: AddAction.page,
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // Expanded(
                //   child: Stack(
                //     children: [
                //       _pageData.isNotEmpty
                //           ? ListView.builder(
                //               padding: const EdgeInsets.symmetric(
                //                 horizontal: 5,
                //                 vertical: 5,
                //               ),
                //               itemCount: _pageData.length,
                //               scrollDirection: Axis.vertical,
                //               itemBuilder: (context, index) {
                //                 final int count = _pageData.length > 10
                //                     ? 10
                //                     : _pageData.length;
                //                 final Animation<double> animation =
                //                     Tween<double>(begin: 0.0, end: 1.0).animate(
                //                   CurvedAnimation(
                //                     parent: _animationController,
                //                     curve: Interval((1 / count) * index, 1.0,
                //                         curve: Curves.fastOutSlowIn),
                //                   ),
                //                 );
                //                 _animationController.forward();
                //                 return PagesView(
                //                   pageData: _pageData[index],
                //                   animation: animation,
                //                   animationController: _animationController,
                //                 );
                //               },
                //             )
                //           : Center(
                //               child:
                //                   Text('Add Your frist page in this chapter😀'),
                //             ),
                //       Positioned(
                //         right: 10,
                //         bottom: 10,
                //         child: FloatingActionButton(
                //           child: Icon(Icons.add),
                //           onPressed: () {
                //             showDialog(
                //               context: context,
                //               builder: (context) {
                //                 return DialogView(
                //                   name: 'Page Name',
                //                   hint: 'Ex: 1, 2 ...30 ets',
                //                   coverName: 'Page Cover',
                //                   action: AddAction.page,
                //                 );
                //               },
                //             );
                //           },
                //         ),
                //       ),
                // Positioned(
                //   child: Padding(
                //     padding:
                //         const EdgeInsets.only(left: 5, top: 5, bottom: 5),
                //     child: SizedBox(
                //       width: 30,
                //       height: 30,
                //       child: Material(
                //         color: Colors.transparent,
                //         child: InkWell(
                //           borderRadius: BorderRadius.circular(30),
                //           onTap: () {
                //             Navigator.pop(context);
                //           },
                //           child: Icon(
                //             Icons.arrow_back,
                //             color: Colors.black,
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                //     ],
                //   ),
                // ),
                SizedBox(height: MediaQuery.of(context).padding.bottom),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _sliverAppBar() {
    return SliverAppBar(
      floating: true,
      forceElevated: true,
      primary: false,
      // pinned: true,
      centerTitle: true,
      title: Text(
        'Pages',
        style: Theme.of(context).textTheme.headline6,
      ),
      leading: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () => Navigator.of(context).pop(),
        child: Icon(Icons.arrow_back),
      ),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
      actions: [ChangeThemeButtonWidget()],
    );
  }
}
