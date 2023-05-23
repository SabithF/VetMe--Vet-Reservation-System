import 'package:flutter/material.dart';
import 'package:mad_cw2_vet_me/screens/pet/edit-medical.dart';
import '../../../utils.dart';
import '../../pet-owner/list-of-pets.dart';

import '../../widgets/medical-records.dart';
import '../../widgets/profile-avatar.dart';
import '../../widgets/profile_pic.dart';

import 'package:mad_cw2_vet_me/screens/widgets/text-field.dart';


class MedRecDb extends StatefulWidget{
  const MedRecDb({Key? key}) : super(key: key);

  @override
  _MedRecState createState() => _MedRecState();
}

class _MedRecState extends State<MedRecDb>{

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
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

          // const ProfilePic(),
          Text(
            'No medical record found!',
            style: SafeGoogleFont (
              'Poppins',
              fontSize: 20*ffem,
              fontWeight: FontWeight.w600,
              height: 1.9462193383*ffem/fem,
              color: const Color(0x06537E),
            ),
          ),
          Container(
            // addanewpeteYZ (21:170)
            margin: EdgeInsets.fromLTRB(70*fem, 0*fem, 8*fem, 10*fem),
            child: Text(
              'Hi Im Chiko',
              style: SafeGoogleFont (
                'Poppins',
                fontSize: 20*ffem,
                fontWeight: FontWeight.w600,
                height: 1.9462193383*ffem/fem,
                color: const Color(0x06537E),
              ),
            ),
          ),

          const SizedBox(
            height: 30.0,
          ),

          // const MedicalRecords(
          //   title: 'Record 2',
          //   description: 'First medical record',),

          const SizedBox(
            height: 30.0,
          ),
          ElevatedButton.icon(
            onPressed: () {

              Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditMedRec()));
            },
            style: ElevatedButton.styleFrom(primary: Colors.red),
            icon: const Icon( // <-- Icon
              Icons.add,
              size: 24.0,
            ),
            label: const Text('Medical Records'), // <-- Text
          ),

          const SizedBox(
            height: 60.0,
          ),

          TextButton(
              style: TextButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(15),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green.shade900,
                  textStyle: const TextStyle(fontSize: 15)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PetList()));
              },
              child: const Icon(Icons.pets_rounded))
        ],
      ),
    );
  }

}