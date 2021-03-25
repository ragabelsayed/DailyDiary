import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:my_daily_diary/providers/day_data.dart';
import 'package:provider/provider.dart';

class DayScreen extends StatelessWidget {
  static const routName = '/day_screen';
  Map<String, String> _formData = {};
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final routArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final dayId = routArgs['id'];
    final _dayData = Provider.of<DayData>(context)
        .items
        .firstWhere((day) => day.id == dayId);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text(
              DateFormat('EEEE').format(_dayData.date!),
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
                  DateFormat('MMMM').format(_dayData.date!),
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
                    DateFormat.d().format(_dayData.date!),
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: Form(
                  key: _form,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 20.0),
                          child: TextFormField(
                            minLines: 1,
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.multiline,
                            cursorColor: Color(0xFF3C4858),
                            style: TextStyle(fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              hintText: 'What\'s our topic of discussion?',
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(100),
                            ],
                            // validator: InputValidator.title,
                            onSaved: (value) => _formData['title'] = value!,
                          ),
                        ),
                        TextFormField(
                          maxLines: null,
                          // expands: true,
                          cursorColor: Color(0xFF3C4858),
                          keyboardType: TextInputType.multiline,

                          decoration: InputDecoration.collapsed(
                              hintText:
                                  'Tell me about it, I don\'t snitch 🤐..'),
                          // validator: InputValidator.content,
                          onSaved: (value) => _formData['content'] = value!,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }
}
