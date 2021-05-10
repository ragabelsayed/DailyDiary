import 'package:flutter/material.dart';

import '../widgets/chapter_screen_widget/page_list_view.dart';
import '../widgets/dialog_view.dart';
import '../widgets/change_theme_btn_widget.dart';

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
                        child: RotationTransition(
                          turns: _animationController,
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
                      ),
                    ],
                  ),
                ),
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
          bottom: const Radius.circular(15),
        ),
      ),
      actions: [ChangeThemeButtonWidget()],
    );
  }
}
