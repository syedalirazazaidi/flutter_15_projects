import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notice_board/constants/appConfig.dart';
import 'package:notice_board/constants/error.dart';

abstract class DBBase {
  Future<String?> addNotification(String noticeText, String userId);
  Future<String?> deleteData(String userId);
  Stream<QuerySnapshot<Map<String, dynamic>>> getDataStream();
}

class DBService extends DBBase {
  static final DBService instance = DBService._internal();
  final FirebaseFirestore _dbService = FirebaseFirestore.instance;
  DBService._internal() {}

  factory DBService() {
    return instance;
  }
  @override
  Future<String?> addNotification(String noticeText, String userId) async {
    final response = await _dbService.collection(AppConfig.collectionName).add({
      'message': noticeText,
      'createdBy': userId,
      'createdAt': DateTime.now()
    });
    if (response.id == null) {
      throw Exception(ErrorString.userCreationFailed);
    }
    return response.id;
  }

  //GET ALL DATA
  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getDataStream() =>
      _dbService.collection(AppConfig.collectionName).snapshots();



  //DELETE DATA BY ID
  @override
  Future<String?> deleteData(String userId) async {
    await _dbService.collection(AppConfig.collectionName).doc(userId).delete();
  }


}
