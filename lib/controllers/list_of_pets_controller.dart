import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../models/pets.dart';

class PetController{

  final CollectionReference collection = FirebaseFirestore.instance.collection('pet-profile');

  void addPet(Pets pet) {
    collection.withConverter(
      fromFirestore: Pets.fromFireStore,
      toFirestore: (pet, options) => pet.toFireStore(),
    ).add(pet);
  }

}


