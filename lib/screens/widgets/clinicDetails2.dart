import 'package:flutter/material.dart';

import '../../models/users.dart';
import '../../utils.dart';
import '../pet-owner/Clinic_DB.dart';
import '../pet-owner/du/ClinicDb-PetOwner.dart';
import '../pet-owner/list-of-pets.dart';

class ClinicDetails2 extends StatelessWidget {
  final AppUser clinicDetails;
  const ClinicDetails2(
      {Key? key, required this.clinicDetails,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        tileColor: const Color(0xffc1eaec),
        leading: const Icon(
          Icons.location_on,
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
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => PetOwnerClinicDb()));
            },
            child: const Text('view')),
        title: Text(
          clinicDetails.username,
          style: SafeGoogleFont(
            'Poppins',
            fontSize: 20 * ffem,
            fontWeight: FontWeight.w600,
            height: 1.9462192535 * ffem / fem,
            color: const Color(0xff04097e),
          ),
        ),
        subtitle: Text(
          clinicDetails.address,
          style: SafeGoogleFont(
            'Poppins',
            fontSize: 15 * ffem,
            fontWeight: FontWeight.w600,
            height: 1.9462192535 * ffem / fem,
            color: const Color(0xff04097e),
          ),
        ),
      ),
    );
  }
}
class DoctorCard extends StatelessWidget {
  const DoctorCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DocCard();


  }
}

class DocCard extends StatelessWidget {
  const DocCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110,
      padding: new EdgeInsets.all(5.0),
      child: Card(
        color: Colors.lightBlue.shade100.withOpacity(1.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          onTap: (){

          },
          leading: const Icon(Icons.person),
          title: Text('Doctor Name', style: SafeGoogleFont(
            'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            // height: 10,
            color: Colors.blue.shade900,
          ),),

          subtitle: Text('9.00am- 1.00pm', style: SafeGoogleFont(
            'Poppins',
            fontSize: 15,
            fontWeight: FontWeight.w600,
            // height: 10,
            color: Colors.blue.shade500,
          ),),
          trailing: Container(
            width: 80,
            height: 35,
            padding:  const EdgeInsets.all(5.0),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.green,
            ),
            child: Center(child: Text('Available',  style: SafeGoogleFont(
              'Poppins',
              fontSize: 13,
              fontWeight: FontWeight.w600,
              // height: 10,
              color: Colors.black,
            ),)),

          ),

        ),

      ),
    );
  }
}

class SlotCard extends StatelessWidget {
  const SlotCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

