import 'package:dictionary_app/constants.dart';
import 'package:dictionary_app/data/word.dart';
import 'package:dictionary_app/screens/audio.dart';
import 'package:dictionary_app/screens/card.dart';
import 'package:dictionary_app/screens/services.dart';
import 'package:dictionary_app/theme/theme.dart';
import 'package:dictionary_app/widgets/custom_button.dart';
import 'package:dictionary_app/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DictionaryScreen extends StatefulWidget {
  static const String routeName = '/';
  @override
  _DictionaryScreenState createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  Word? wordMeaning;
  String searchStr = '';
  bool isLoading = false;
  DictionaryService _dictionaryService = DictionaryService();
  void updateUI(String value) {
    setState(() {
      searchStr = value;
    });
  }

  void changeFocus() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void onPress() async {
    changeFocus();
    toggleisLoading();
    final response = await _dictionaryService.getData(searchStr);
    setState(() {
      wordMeaning = response;
    });
    toggleisLoading();
  }

  void handleaudio() {

    Navigator.pushNamed(context, AudioPlayerScreen.routeName,
      arguments:_dictionaryService.getAudioUrl(wordMeaning?.audioName)
    );
  }

  void toggleisLoading() {
    setState(() {
      isLoading = !isLoading;
    });
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
                  onPressed: onPress,
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
              '${isLoading ? AppStrings.searchingWord : AppStrings.word}',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
            ),
          ),
          wordMeaning != null ? CustomCard(word:wordMeaning!,onaudioClick:handleaudio) : Container()
        ],
      ),
    );
  }
}
