import 'package:flutter/material.dart';
import 'package:mad_cw2_vet_me/screens/Clinic/ClinciDB.dart';

import 'package:mad_cw2_vet_me/screens/widgets/banner-1.dart';
import 'package:mad_cw2_vet_me/screens/widgets/clinic-details.dart';
import 'package:mad_cw2_vet_me/screens/widgets/my-pets-button.dart';
import 'package:mad_cw2_vet_me/screens/widgets/profile-avatar.dart';
import 'package:mad_cw2_vet_me/screens/widgets/text-field.dart';

import '../../utils.dart';
import '../pet-owner/du/pet-owner-dashboard.dart';


class Drawer extends StatelessWidget {
  const Drawer({Key? key, required ListView child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,

          children: [
            const DrawerHeader(

              decoration: BoxDecoration(
                color: Colors.black87,
              ),
              child: Text(' VetMe',
                  style:
                  TextStyle(color: Colors.white,)),
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 5,),
            ListTile(
              title: const Text('Home',),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ClinicDb()),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}
class AppBarN extends StatefulWidget {
  const AppBarN({Key? key}) : super(key: key);

  @override
  State<AppBarN> createState() => _AppBarNState();
}

class _AppBarNState extends State<AppBarN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: const [ProfileAvatar(), SizedBox(width: 10.0)],
      ),
    );
  }
}



