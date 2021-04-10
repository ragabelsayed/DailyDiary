import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_daily_diary/models/page.dart';
import 'package:my_daily_diary/providers/page_data.dart';

import 'package:my_daily_diary/widgets/day_screen_widget/font_features_view.dart';
import 'package:provider/provider.dart';

class PageScreen extends StatelessWidget {
  static const routName = '/page_screen';

  final _form = GlobalKey<FormState>();
  // late final _pagesData;

  // @override
  // void didChangeDependencies() {
  //   _pagesData = ModalRoute.of(context)!.settings.arguments as ChapterPage;
  //   Provider.of<PageData>(context, listen: false).currentPage(_pagesData.id!);
  //   super.didChangeDependencies();
  // }

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

    // _pagesData.currenTextColor = Provider.of<PageData>(context).currentColor;
    // _pagesData.textAlign = Provider.of<PageData>(context).textAlign;
    // _pagesData.fontweight = Provider.of<PageData>(context).fontWeight;
    // _pagesData.fontStyle = Provider.of<PageData>(context).fontStyle;
    // _pagesData.fontName = Provider.of<PageData>(context).fontName;
    Color _currentColor = Provider.of<PageData>(context).currentColor;
    TextAlign _textAlign = Provider.of<PageData>(context).textAlign;
    bool _fontWeight = Provider.of<PageData>(context).fontWeight;
    bool _fontStyle = Provider.of<PageData>(context).fontStyle;
    String _fontName = Provider.of<PageData>(context).fontName;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
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
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(30),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: IconButton(
                                    padding: const EdgeInsets.only(left: 5),
                                    icon: Icon(
                                      Icons.save,
                                      size: 25,
                                    ),
                                    onPressed: _saveForm,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              DateFormat('EEEE').format(_pagesData.date!),
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
                                  DateFormat('MMMM').format(_pagesData.date!),
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
                                    DateFormat.d().format(_pagesData.date!),
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
                          ),
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
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      child: Form(
                        key: _form,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 3, bottom: 3),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(50),
                                      left: Radius.circular(50),
                                    ),
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  height: 5,
                                  width: 200,
                                  child: Divider(
                                    color: Colors.white,
                                    thickness: 1,
                                    indent: 20,
                                    endIndent: 20,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(50),
                                    left: Radius.circular(50),
                                  ),
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                                height: 5,
                                width: 150,
                                child: Divider(
                                  color: Colors.white,
                                  thickness: 1,
                                  indent: 20,
                                  endIndent: 20,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: 20.0, left: 15, right: 15),
                                child: TextFormField(
                                  minLines: 1,
                                  maxLines: 3,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.multiline,
                                  cursorColor: Color(0xFF3C4858),
                                  initialValue: _pagesData.writingArea[0]
                                      ['title'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                    hintText:
                                        'What\'s our topic of discussion?',
                                  ),
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(100),
                                  ],
                                  // validator: InputValidator.title,
                                  onSaved: (value) =>
                                      // _formData['title'] = value!,
                                      _pagesData.writingArea[0]['title'] =
                                          value!,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: TextFormField(
                                  maxLines: null,
                                  // expands: true,
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
                                          'Tell me about it, I don\'t snitch 🤐..'),
                                  // validator: InputValidator.content,
                                  onSaved: (value) =>
                                      // _formData['content'] = value!,
                                      _pagesData.writingArea[1]['content'] =
                                          value!,
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
          // const SizedBox(height: 5),
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }
}
