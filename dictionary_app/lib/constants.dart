abstract class AppStrings {
  static const appTitle = 'My Dictionary App';
  static const enterWordHere = 'Enter Word here...';
  static const searchingWord = 'Searching Word';
  static const word = 'Word ';
  static const playaudio = 'Play Audio';
  static const play = 'Play';
}
abstract class ErrorStrings {
  static const String na = 'Not Available';
  static const invalidData = 'Invalid data received.';
  static const invalidAudioFile = 'invalid audio file name';
}
abstract class Configs {
  static const baseUrl =
      'https://www.dictionaryapi.com/api/v3/references/collegiate/json/';
  static const apiKey = 'e6cc555a-491e-4dd6-bd95-a2c4dd72d832';
  static const audioBaseUrl =
      'https://media.merriam-webster.com/audio/prons/en/us/mp3/';
  static const audioFileExtension = '.mp3';
}
