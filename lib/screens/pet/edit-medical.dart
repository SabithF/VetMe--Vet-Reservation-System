import 'package:flutter/material.dart';
import 'package:mad_cw2_vet_me/screens/pet/pet-med-reco.dart';
import '../../utils.dart';
import '../pet-owner/list-of-pets.dart';
import '../widgets/profile-avatar.dart';
import 'package:mad_cw2_vet_me/screens/widgets/text-field.dart';
import '../widgets/profile_pic.dart';


class EditMedRec extends StatelessWidget {
  final TextEditingController _topicController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  EditMedRec({super.key});

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
            margin: EdgeInsets.fromLTRB(90 * fem, 0 * fem, 8 * fem, 10 * fem),
            child: Text(
              'Add a new record',
              style: SafeGoogleFont(
                'Poppins',
                fontSize: 18 * ffem,
                fontWeight: FontWeight.w600,
                height: 1.9462193383 * ffem / fem,
                color: const Color(0xff000000),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          // const ProfilePic(),
          Container(
            // addanewpeteYZ (21:170)
            margin: EdgeInsets.fromLTRB(70 * fem, 0 * fem, 8 * fem, 10 * fem),
            child: Text(
              'Hi Im Meow',
              style: SafeGoogleFont(
                'Poppins',
                fontSize: 20 * ffem,
                fontWeight: FontWeight.w600,
                height: 1.9462193383 * ffem / fem,
                color: const Color(0x06537E),
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Text(
            'Medical Record',
            style: SafeGoogleFont(
              'KrubKrub:wght@600',
              fontSize: 18 * ffem,
              color: const Color(0xff000000),
            ),
          ),
          InputField(
              hintText: "Topic/Something",
              controller: _topicController,
              obscureText: false),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            'Details in breif',
            style: SafeGoogleFont(
              'KrubKrub:wght@600',
              fontSize: 18 * ffem,
              color: const Color(0xff000000),
            ),
          ),
          InputField(
              hintText: "Always keep eating and sleeping....",
              controller: _descController,
              obscureText: false),

          const SizedBox(
            height: 20.0,
          ),

          // TextButton(
          //
          //
          //     style: TextButton.styleFrom(
          //
          //         foregroundColor: Colors.white,
          //         backgroundColor: Colors.blue.shade900,
          //         textStyle: const TextStyle(fontSize: 15)),
          //
          //     onPressed: (){
          //
          //     },
          //     child: const Text('Attachment')),

          const SizedBox(
            height: 40.0,
          ),

          // TextButton(
          //     style: TextButton.styleFrom(
          //         foregroundColor: Colors.white,
          //         backgroundColor: Colors.green,
          //         textStyle: const TextStyle(fontSize: 15)),
          //     onPressed: (){
          //
          //     },
          //     child: const Text('Save')),
          ElevatedButton(
            style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue.shade900,
                textStyle: const TextStyle(fontSize: 15)),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MedRec()));
              final snackBar = SnackBar(
                content: const Text('Medical record saved'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {

                  },
                ),
              );

              // Find the ScaffoldMessenger in the widget tree
              // and use it to show a SnackBar.
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: const Text('Save'),
          ),

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
}
