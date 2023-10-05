import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class FireModel {
  String? motto;
  Timestamp? date;
  DocumentReference? reference;

  FireModel({
    this.motto,
    this.date,
    this.reference,
  });

  FireModel.fromJson(dynamic json, this.reference) {
    motto = json['motto'];
    date = json['date'];
  }

  FireModel.fromSnapShot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : this.fromJson(snapshot.data(), snapshot.reference);

  FireModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : this.fromJson(snapshot.data(), snapshot.reference);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['motto'] = motto;

    // DateTime dateTime = map['date'].toDate();
    // String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(dt);
    // map['date'] = formattedDate;
    map['date'] = date;

    return map;
  }
}
