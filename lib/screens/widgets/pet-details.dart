import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mad_cw2_vet_me/screens/pet-owner/view-pet.dart';

import '../../models/pets.dart';
import '../../utils.dart';

class PetDetails extends StatelessWidget {
  final String name,category,details,docId,image;
  final int age,uid;
  const PetDetails(
      {Key? key,
        required this.docId,
        required this.name,
        required this.category, required this.age, required this.details, required this.uid, required this.image,})
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return ListTile(
      tileColor: Colors.white,
      leading: const Icon(
        Icons.pets_sharp,
        color: Color(0xff04097e),
      ),
      trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff0bb312),
            textStyle: SafeGoogleFont(
              'Poppins',
              fontSize: 15 * ffem,
              fontWeight: FontWeight.w600,
              height: 1.9462193807 * ffem / fem,
              color: const Color(0xff000000),
            ),
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewPet(name: name,category: category,age: age,details: details,docId: docId, uid: uid, image: image,)));
          },
          child: const Text('view')),
      title: Text(
        name,
        style: SafeGoogleFont(
          'Poppins',
          fontSize: 20 * ffem,
          fontWeight: FontWeight.w600,
          height: 1.9462192535 * ffem / fem,
          color: const Color(0xff04097e),
        ),
      ),
      subtitle: Text(
        category,
        style: SafeGoogleFont(
          'Poppins',
          fontSize: 15 * ffem,
          fontWeight: FontWeight.w600,
          height: 1.9462192535 * ffem / fem,
          color: const Color(0xff04097e),
        ),
      ),
    );
  }




}
