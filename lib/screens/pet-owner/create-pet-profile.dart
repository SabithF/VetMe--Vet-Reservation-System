
import 'package:flutter/material.dart';
// import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:mad_cw2_vet_me/globals.dart';
import 'package:mad_cw2_vet_me/models/pets.dart';
import 'package:mad_cw2_vet_me/screens/pet-owner/list-of-pets.dart';
import '../../utils.dart';
import '../widgets/profile-avatar.dart';
import 'package:mad_cw2_vet_me/screens/widgets/text-field.dart';
import '../widgets/profile_pic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:mad_cw2_vet_me/models/pets.dart';
// import 'package:mad_cw2_vet_me/controllers/list_of_pets_controller.dart';

const List<String> list = <String>['Female','Male'];

class PetProfile extends StatelessWidget {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _breedController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  String dropdownValue = list.first;

  PetProfile({super.key});

  final db = FirebaseFirestore.instance;

  bookPet({uid, image, name, age, gender, breed, details,context} ) async {
    final docRef = db.collection('pets').doc();
    Pets appt =
    Pets(uid: uid, image: image, name: name, age: age, gender: gender,  breed: breed, details: details);

    await docRef.set(appt.toFireStore()).whenComplete(
            () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PetList())));
  }


  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery
        .of(context)
        .size
        .width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: const [ProfileAvatar(), SizedBox(width: 10.0)],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Container(
            // addanewpeteYZ (21:170)
            margin: EdgeInsets.fromLTRB(100 * fem, 0 * fem, 8 * fem, 10 * fem),
            child: Text(
              'Add a new pet',
              style: SafeGoogleFont(
                'Poppins',
                fontSize: 20 * ffem,
                fontWeight: FontWeight.w600,
                height: 1.9462193383 * ffem / fem,
                color: const Color(0xff000000),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),

          const ProfilePic(),

          const SizedBox(
            height: 30.0,
          ),
          Text(
            'Name',
            style: SafeGoogleFont(
              'KrubKrub:wght@600',
              fontSize: 18 * ffem,
              color: const Color(0xff000000),
            ),
          ),
          InputField(
              hintText: "Name",
              controller: _nameController,
              obscureText: false),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            'Age',
            style: SafeGoogleFont(
              'KrubKrub:wght@600',
              fontSize: 18 * ffem,
              color: const Color(0xff000000),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    controller: _ageController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Age (Years)"
                    ),
                  )
              )
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            'Gender',
            style: SafeGoogleFont(
              'KrubKrub:wght@600',
              fontSize: 18 * ffem,
              color: const Color(0xff000000),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 0,
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      dropdownValue = value!;
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
              )
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            'Breed',
            style: SafeGoogleFont(
              'KrubKrub:wght@600',
              fontSize: 18 * ffem,
              color: const Color(0xff000000),
            ),
          ),
          InputField(
              hintText: "Breed",
              controller: _breedController,
              obscureText: false),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            'Other Details',
            style: SafeGoogleFont(
              'KrubKrub:wght@600',
              fontSize: 18 * ffem,
              color: const Color(0xff000000),
            ),
          ),
          InputField(
              hintText: "Other Details",
              controller: _detailsController,
              obscureText: false),
          const SizedBox(
            height: 30.0,
          ),
          TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue.shade900,
                  textStyle: const TextStyle(fontSize: 15)),
              onPressed: () {
                try{
                  bookPet(uid:1,image: GlobalVar.path, name : _nameController.text,age: int.parse(_ageController.text) ,gender: dropdownValue,breed: _breedController.text,details: _detailsController.text,context: context);

                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Successfully Added")));


                } on FirebaseAuthException catch(error) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.message!)));
                }

              },
              child: const Text('Save')),
          const SizedBox(
            height: 30.0,
          ),
          TextButton(
              style: TextButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(15),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green.shade900,
                  textStyle: const TextStyle(fontSize: 15)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PetList()));
              },
              child: const Icon(Icons.pets_rounded))
        ],
      ),
    );
  }

}
