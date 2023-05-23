import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../models/pets.dart';
import '../../utils.dart';
import '../pet/empty/medicalRecordDb-Empt.dart';
import '../widgets/profile-avatar.dart';
import 'package:mad_cw2_vet_me/screens/widgets/text-field.dart';
import '../widgets/profile_pic.dart';
import 'list-of-pets.dart';

const List<String> list = <String>['Female','Male'];
class ViewPet extends StatefulWidget {
  String name,category,details,docId,image;
  int uid,age;

  ViewPet({Key? key, required this.name, required this.category, required this.age, required this.details, required this.docId, required this.uid, required this.image,}) : super(key: key);
  @override
  _ViewPetState createState() => _ViewPetState();
}

class _ViewPetState extends State<ViewPet> {

  String dropdownValue = list.first;
  final  _nameController = TextEditingController();
  final  _ageController = TextEditingController();
  final  _breedController = TextEditingController();
  final  _detailsController = TextEditingController();
  @override
  void initState() {
    _nameController.text = widget.name;
    _ageController.text = widget.age.toString();
    _breedController.text = widget.category;
    _detailsController.text = widget.details;
    super.initState();
  }
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

          Container(
            // addanewpeteYZ (21:170)
            margin: EdgeInsets.fromLTRB(70*fem, 0*fem, 8*fem, 10*fem),
            child: Text(
              'Update Pet Details',
              style: SafeGoogleFont (
                'Poppins',
                fontSize: 18*ffem,
                fontWeight: FontWeight.w600,
                height: 1.9462193383*ffem/fem,
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
            style: SafeGoogleFont (
              'KrubKrub:wght@600',
              fontSize: 18*ffem,
              color: const Color(0xff000000),
            ),
          ),
          TextField(

              controller: _nameController,
              obscureText: false),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            'Age',
            style: SafeGoogleFont (
              'KrubKrub:wght@600',
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
            style: SafeGoogleFont (
              'KrubKrub:wght@600',
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
            style: SafeGoogleFont (
              'KrubKrub:wght@600',
              fontSize: 18*ffem,
              color: const Color(0xff000000),
            ),
          ),
          TextField(

              controller: _breedController,
              obscureText: false),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            'Other Details',
            style: SafeGoogleFont (
              'KrubKrub:wght@600',
              fontSize: 18*ffem,
              color: const Color(0xff000000),
            ),
          ),
          TextField(

              controller: _detailsController,
              obscureText: false),
          const SizedBox(
            height: 30.0,
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MedRecDb()));
            },
            style: ElevatedButton.styleFrom(primary: Colors.red),
            icon: const Icon( // <-- Icon
              Icons.medical_information,
              size: 24.0,
            ),
            label: const Text('Medical Records'), // <-- Text
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue.shade900,
                  textStyle: const TextStyle(fontSize: 15)),
              onPressed: (){

                var updatePetResult = updatePet(name: _nameController.text,age: _ageController.text,breed: _breedController.text,image: widget.image,uid: widget.uid,gender: dropdownValue,details: _detailsController.text);
                updatePetResult.whenComplete((){
                  // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Successfully Updated!")));
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PetList()));
                },
                    // onError: (e) => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("error")))
                );
              },
              child: const Text('Edit')),
          const SizedBox(
            height: 30.0,
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

  updatePet({uid, image, name, age, gender, breed, details}) async {
    var db = FirebaseFirestore.instance;
    final docRef = db.collection('pets');
    String resultMsg;
    print('widget.docId ' + widget.docId);
    Pets appt =
    Pets(uid: uid, image: image, name: name, age: int.parse(age), gender: gender,  breed: breed, details: details);
    await docRef.doc(widget.docId).update(appt.toFireStore()).then(
            (value) => log("Pet Details Updated Successfully!"),
        onError: (e) => log("Error Updating Pet Details: $e"));

  }
}


