import 'package:cloud_firestore/cloud_firestore.dart';

class Pets{
  int uid;
  String image;
  String name;
  int age;
  String gender;
  String breed;
  String details;

  Pets(
      {required this.uid,
        required this.image,
        required this.name,
        required this.age,
        required this.gender,
        required this.breed,
        required this.details,

      });


  Pets.user(this.uid, this.image, this.name, this.age, this.gender, this.breed, this.details, );


  factory Pets.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();

    return Pets(
      uid:data!['uid'],
      image: data!['image'],
      name: data['name'],
      age:data['age'],
      gender:data['gender'],
      breed:data['breed'],
      details:data['details'],
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      "uid": uid,
      "image": image,
      "name": name,
      "age": age,
      "gender": gender,
      "breed": breed,
      "details": details,
    };
  }

}
