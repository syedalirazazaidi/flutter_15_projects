import 'package:dictionary_app/constants.dart';
import 'package:dictionary_app/data/word.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({required this.word, required this.onaudioClick});
  Word word;
  void Function() onaudioClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
        height: 280,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            word.word.isNotEmpty
                ? Text(
                    '${AppStrings.searchingWord}${word.word}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                    // style: Theme.of(context).textTheme.headline4,
                  )
                : Container(),
            Text(
              word.word.isNotEmpty || word.meaning.isNotEmpty ? '${word.meaning}' : ErrorStrings.na,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal,),
            ),
            word.audioName.isNotEmpty
                ? GestureDetector(
                    onTap: onaudioClick,
                    child: Icon(
                      Icons.volume_up,
                      color: Colors.black,
                      size: 32,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
