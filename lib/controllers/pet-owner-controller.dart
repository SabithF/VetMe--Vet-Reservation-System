import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/users.dart';

class PetOwnerController{

  final CollectionReference collection =
  FirebaseFirestore.instance.collection('pet-owner');

  void addPetOwner(AppUser user) {
    collection.withConverter(
      fromFirestore: AppUser.fromFireStore,
      toFirestore: (user, options) => user.toFireStore(),
    ).add(user);
  }

  getDocumentOfCurrentUser(){
    if(FirebaseAuth.instance.currentUser != null){
      var documentIdOfCurrentUser = FirebaseAuth.instance.currentUser!.uid;
      var emailOfCurrentUser = FirebaseAuth.instance.currentUser!.email;

      return collection.where('uid', isEqualTo: documentIdOfCurrentUser).where('email',isEqualTo: emailOfCurrentUser).withConverter(
        fromFirestore: AppUser.fromFireStore,
        toFirestore: (user, options) => user.toFireStore(),
      ).get();
    }
  }


}