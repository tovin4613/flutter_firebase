import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/FireModel.dart';

class FireService {
  static final FireService _fireService = FireService._internal();
  factory FireService() => _fireService;
  FireService._internal();

  // 데이터 추가
  Future createMemo(Map<String, dynamic> json) async {
    await FirebaseFirestore.instance.collection('memo').add(json);
  }
  
  // 데이터 가져오기
  Future<List<FireModel>> getFireModel() async {
    CollectionReference<Map<String, dynamic>> _collectionReference = FirebaseFirestore.instance.collection("memo");
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await _collectionReference.orderBy('date').get();

    List<FireModel> mottos = [];
    for (var doc in querySnapshot.docs) {
      FireModel fireModel = FireModel.fromQuerySnapshot(doc);
      mottos.add(fireModel);
    }

    return mottos;
  }

  // 데이터 삭제
  Future<void> deleteMemo(DocumentReference reference) async {
    await reference.delete();
  }
}