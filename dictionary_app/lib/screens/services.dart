import 'dart:convert';

import 'package:dictionary_app/app_constant.dart';
import 'package:dictionary_app/constants.dart';
import 'package:dictionary_app/data/word.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class DictionaryService {


   Future<Word> getData(String word) async {
    Uri url =
        Uri.parse('${AppConstants.baseUrl}${word}?key=${AppConstants.apiKey}');
    print('Data Fetching  In progress');

    final response = await http.get(url);
    print('Error Fetching  complete');
    if (response.statusCode != 200) {
      throw Exception('Error Fetching data from server');
    }
    final decodeData= jsonDecode(response.body);

    final parsedData = decodeData.isNotEmpty?decodeData[0]:{} ;
    final meaning =parsedData['shortdef']?[0]??'';
    String audioName = parsedData['hwi']!=null?parsedData['hwi']['prs'].length != 0
        ? parsedData['hwi']['prs'][0]['sound']['audio']
        : '':'';
    return Word (word:word,meaning: meaning,audioName:audioName);
  }
   String getAudioUrl(String audioFileName) {
     String folderName = '';
     final startWithAlphabetsOnly = RegExp(r'^[A-Za-z]');

     if (audioFileName.isEmpty) {
       throw new Exception(ErrorStrings.invalidAudioFile);
     }

     if (audioFileName.startsWith('gg')) {
       folderName = 'gg';
     } else if (audioFileName.startsWith('bix')) {
       folderName = 'bix';
     } else if (!startWithAlphabetsOnly.hasMatch(audioFileName)) {
       folderName = '_';
     } else {
       folderName = audioFileName[0];
     }

     return '${Configs.audioBaseUrl}${folderName}/${audioFileName}${Configs.audioFileExtension}';
   }
}
