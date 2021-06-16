import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_daily_diary/screens/page_screen.dart';
import 'package:my_daily_diary/models/page.dart';
import 'package:my_daily_diary/providers/page_data.dart';
import 'package:my_daily_diary/widgets/popup_menu.dart';

import '../lock_view.dart';

class PagesView extends StatelessWidget {
  final ChapterPage pageData;
  final AnimationController animationController;
  final Animation animation;

  PagesView({
    required this.pageData,
    required this.animationController,
    required this.animation,
  });
  @override
  Widget build(BuildContext context) {
    final _password = pageData.password;
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) => FadeTransition(
        opacity: animation as Animation<double>,
        child: Transform(
          transform: Matrix4.translationValues(
              0.0, 25 * (-0.1 * animation.value), 0.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    if (_password.isNotEmpty && !pageData.passwordState) {
                      showDialog(
                        context: context,
                        builder: (context) => LockView(
                          btnName: 'Unlock',
                          lockCode: _password,
                          unLockItem: () {
                            Provider.of<PageData>(context, listen: false)
                              ..currentPage(pageData.id)
                              ..unLockPage(true);
                          },
                        ),
                      );
                    } else if (_password.isNotEmpty && pageData.passwordState) {
                      Navigator.of(context).pushNamed(
                        PageScreen.routName,
                        arguments: pageData,
                      );
                      Provider.of<PageData>(context, listen: false)
                          .currentPage(pageData.id);
                    } else {
                      Navigator.of(context).pushNamed(
                        PageScreen.routName,
                        arguments: pageData,
                      );
                      Provider.of<PageData>(context, listen: false)
                          .currentPage(pageData.id);
                    }
                  },
                  child: Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: pageData.customColor,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          pageData.customColor.withAlpha(255),
                          pageData.customColor.withAlpha(50),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).shadowColor.withOpacity(0.4),
                          offset: const Offset(2.0, 4.0),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: pageData.image == null
                        ? _password.isNotEmpty && !pageData.passwordState
                            ? Stack(
                                fit: StackFit.expand,
                                children: [
                                  SizedBox(),
                                  Icon(
                                    Icons.lock,
                                    size: 60,
                                  ),
                                ],
                              )
                            : _password.isNotEmpty && pageData.passwordState
                                ? Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      SizedBox(),
                                      Positioned(
                                        left: 10,
                                        bottom: 10,
                                        child: Icon(
                                          Icons.lock_open,
                                          size: 40,
                                        ),
                                      ),
                                    ],
                                  )
                                : SizedBox()
                        : ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            child: _password.isNotEmpty &&
                                    !pageData.passwordState
                                ? Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Opacity(
                                        opacity: 0.3,
                                        child: Image.file(
                                          pageData.image!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Icon(
                                        Icons.lock,
                                        size: 60,
                                      ),
                                    ],
                                  )
                                : _password.isNotEmpty && pageData.passwordState
                                    ? Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          Image.file(
                                            pageData.image!,
                                            fit: BoxFit.cover,
                                          ),
                                          Positioned(
                                            left: 10,
                                            bottom: 10,
                                            child: Icon(
                                              Icons.lock_open,
                                              size: 40,
                                            ),
                                          ),
                                        ],
                                      )
                                    : Image.file(
                                        pageData.image!,
                                        fit: BoxFit.cover,
                                      ),
                          ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: PopUpMenu(
                    dialogContent:
                        'Are you sure that you want to delete this page ?',
                    snackBarContent: 'This page has been deleted',
                    removeItem: () {
                      Provider.of<PageData>(context, listen: false)
                          .removePage(pageData);
                    },
                    itemPassword: _password,
                  ),
                ),
                pageData.name.isNotEmpty
                    ? Positioned(
                        left: 10,
                        top: 10,
                        child: Container(
                          width: 250,
                          alignment: Alignment.centerLeft,
                          child: Chip(
                            avatar: CircleAvatar(),
                            backgroundColor:
                                Theme.of(context).chipTheme.backgroundColor,
                            labelStyle: Theme.of(context).textTheme.headline5,
                            label: Text(
                              pageData.name,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
