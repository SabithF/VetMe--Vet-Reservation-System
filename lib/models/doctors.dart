import 'package:cloud_firestore/cloud_firestore.dart';

class Doctor{
  int uid;
  String image;
  String name;
  String details;
  String contact;

  Doctor({required this.uid,
    required this.image,
    required this.name,
    required this.details,
    required this.contact,
  });

  Doctor.user(
      this.uid,
      this.name,
      this.image,
      this.details,
      this.contact,
      );

  factory Doctor.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();

    return Doctor(
      uid:data!['uid'],
      image: data!['image'],
      name: data['name'],
      details:data['details'],
      contact:data['contact'],
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      "uid": uid,
      "image": image,
      "name": name,
      "details": details,
      "contact": contact,
    };
  }
}