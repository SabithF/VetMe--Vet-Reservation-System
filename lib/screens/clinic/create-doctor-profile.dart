import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';
import 'package:mad_cw2_vet_me/globals.dart';
import 'package:flutter/material.dart';
import '../../models/doctorModel.dart';
import '../../utils.dart';
import '../widgets/profile-avatar.dart';
import 'package:mad_cw2_vet_me/screens/widgets/text-field.dart';
import '../widgets/profile_pic.dart';
import 'ClinciDB.dart';
//import 'package:mad_cw2_vet_me/controllers/doctor-controller.dart';
import 'package:mad_cw2_vet_me/models/doctors.dart';

class CreateDoctorProfile extends StatefulWidget {

  CreateDoctorProfile({super.key});

  @override
  State<CreateDoctorProfile> createState() => _CreateDoctorProfileState();
}

class _CreateDoctorProfileState extends State<CreateDoctorProfile> {

  // DateTime dateTime = DateTime(2023, 01, 12, 5, 30);

  final TextEditingController _dNameController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();

  final db = FirebaseFirestore.instance;

  addDoctor({uid, name, image, contact, details}) async {
    final docRef = db.collection('doctors').doc();
    Doctor appt =
    Doctor(uid: uid,name: name, image: image, contact: contact, details: details);

    await docRef.set(appt.toFireStore()).then(
            (value) => log("Doctor Added Successfully!"),
        onError: (e) => log("Error Adding Doctor: $e"));
  }

  bool ch1 = false;
  bool ch2 = false;
  bool ch3 = false;
  bool ch4 = false;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    //DoctorController newDoctor = DoctorController();

    // final hours = dateTime.hour.toString().padLeft(2, '0');
    // final minutes = dateTime.minute.toString().padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed:  () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClinicDb()))),
        actions: const [
          ProfileAvatar(),
          SizedBox(width: 10.0)
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 20.0,
          ),

          Container(
            margin: EdgeInsets.fromLTRB(85*fem, 0*fem, 0*fem, 0*fem),
            child: Text(
              'Add a new doctor',
              style: SafeGoogleFont (
                'Poppins',
                fontSize: 18*ffem,
                fontWeight: FontWeight.w600,
                color: const Color(0xff000000),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),

          const ProfilePic(),

          const SizedBox(
            height: 10.0,
          ),

          Text(
            'Name',
            style: SafeGoogleFont (
              'Poppins',
              fontSize: 18*ffem,
              color: const Color(0xff000000),
            ),
          ),
          InputField(
              hintText: "Doctor Name",
              controller: _dNameController,
              obscureText: false),
          const SizedBox(
            height: 10.0,
          ),

          Text(
            'Details',
            style: SafeGoogleFont (
              'Poppins',
              fontSize: 18*ffem,
              color: const Color(0xff000000),
            ),
          ),
          InputField(
              hintText: "Services",
              controller: _detailsController,
              obscureText: false),
          const SizedBox(
            height: 10.0,
          ),

          Text(
            'Contact',
            style: SafeGoogleFont (
              'Poppins',
              fontSize: 18*ffem,
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
                    controller: _contactController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Contact Details"
                    ),
                  )
              )
          ),

          const SizedBox(
            height: 10.0,
          ),

          const SizedBox(
            height: 10.0,
          ),

          const SizedBox(
            height: 10.0,
          ),

          ElevatedButton(
            style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
                textStyle: const TextStyle(fontSize: 15)),
            onPressed: () {
              try{
                addDoctor(uid:1, image: GlobalVar.path, name : _dNameController.text, contact : _contactController.text, details: _detailsController.text);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Successful")));
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClinicDb()));
              } on FirebaseAuthException catch(error) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.message!)));
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }


}