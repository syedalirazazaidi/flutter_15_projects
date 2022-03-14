import 'package:dictionary_app/constants.dart';
import 'package:dictionary_app/theme/theme.dart';
import 'package:dictionary_app/widgets/custom_button.dart';
import 'package:dictionary_app/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DictionaryScreen extends StatefulWidget {
  @override
  _DictionaryScreenState createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  String searchStr = '';
  void updateUI(String value) {
    setState(() {
      searchStr = value;
    });
  }
  void onPress(){

  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.appTitle),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomInput(
            onChange: updateUI,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomButton(
                  title: Icon(Icons.near_me, size: 32),
                  onPressed: () {},
                  backgroundColor: theme.primaryColor,
                ),
              ),
            ],
          ),
          Divider(
            thickness: 2,
            color: theme.primaryColor,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Word: $searchStr',
              style: theme.textTheme.headline4,
            ),
          )
        ],
      ),
    );
  }
}
