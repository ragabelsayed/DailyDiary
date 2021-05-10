import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/page_screen_widget/page_date_format.dart';
import '../widgets/page_screen_widget/drag_view.dart';
import '../widgets/page_screen_widget/font_features_view.dart';
import '../providers/page_data.dart';
import '../models/page.dart';

class PageScreen extends StatelessWidget {
  static const routName = '/page_screen';
  final _form = GlobalKey<FormState>();

  TextStyle? textStyle({
    required String font,
    required Color color,
    required FontWeight fontWeight,
    required FontStyle fontStyle,
  }) {
    switch (font) {
      case 'lato':
        return GoogleFonts.lato(
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
        );

      case 'roboto':
        return GoogleFonts.roboto(
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
        );

      case 'openSans':
        return GoogleFonts.openSans(
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
        );

      case 'raleway':
        return GoogleFonts.raleway(
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
        );

      case 'quicksand':
        return GoogleFonts.quicksand(
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
        );

      case 'dancingScript':
        return GoogleFonts.dancingScript(
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
        );

      case 'pacifico':
        return GoogleFonts.pacifico(
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
        );

      case 'indieFlower':
        return GoogleFonts.indieFlower(
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
        );

      default:
        GoogleFonts.lato(
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
        );
    }
    return null;
  }

  void _saveForm() {
    _form.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    final _pagesData =
        ModalRoute.of(context)!.settings.arguments as ChapterPage;

    Color _currentColor = Provider.of<PageData>(context).currentColor;
    TextAlign _textAlign = Provider.of<PageData>(context).textAlign;
    bool _fontWeight = Provider.of<PageData>(context).fontWeight;
    bool _fontStyle = Provider.of<PageData>(context).fontStyle;
    String _fontName = Provider.of<PageData>(context).fontName;

    return Scaffold(
      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 5),
                              child: SizedBox(
                                width: 30,
                                height: 30,
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(30),
                                    onTap: () {
                                      Navigator.pop(context);
                                      _saveForm();
                                      _pagesData.save();
                                    },
                                    child: const Icon(Icons.arrow_back),
                                  ),
                                ),
                              ),
                            ),
                            PageDateFormat(_pagesData.date),
                            FontFeatures(pageData: _pagesData),
                          ],
                        );
                      },
                      childCount: 1,
                    ),
                  ),
                  SliverFillRemaining(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Form(
                          key: _form,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                DragView(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 20.0, left: 15, right: 15),
                                  child: TextFormField(
                                    minLines: 1,
                                    maxLines: 3,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.multiline,
                                    cursorColor: Color(0xFF3C4858),
                                    initialValue: _pagesData.writingArea[0]
                                        ['title'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    decoration: InputDecoration(
                                      hintText:
                                          'What\'s our topic of discussion?',
                                    ),
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(100),
                                    ],
                                    onSaved: (value) => _pagesData
                                        .writingArea[0]['title'] = value!,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: TextFormField(
                                    maxLines: null,
                                    textAlign: _textAlign,
                                    style: textStyle(
                                      font: _fontName,
                                      color: _currentColor,
                                      fontWeight: _fontWeight
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      fontStyle: _fontStyle
                                          ? FontStyle.italic
                                          : FontStyle.normal,
                                    ),
                                    cursorColor: Color(0xFF3C4858),
                                    keyboardType: TextInputType.multiline,
                                    initialValue: _pagesData.writingArea[1]
                                        ['content'],
                                    decoration: InputDecoration.collapsed(
                                      hintText:
                                          'Tell me about it, I don\'t snitch 🤐..',
                                    ),
                                    onSaved: (value) => _pagesData
                                        .writingArea[1]['content'] = value!,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
