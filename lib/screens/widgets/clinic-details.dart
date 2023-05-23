import 'package:flutter/material.dart';
import 'package:mad_cw2_vet_me/screens/Clinic/ClinciDB.dart';

import '../../utils.dart';
import '../Clinic/bookingdetails.dart';
import '../pet-owner/CreateNewBooking.dart';

class ClinicDetails extends StatelessWidget {
  final String name, radius, location;
  const ClinicDetails(
      {Key? key,
      required this.name,
      required this.radius,
      required this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return ListTile(
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
          onPressed: () {},
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
        location,
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
class DoctorCard extends StatelessWidget {
  const DoctorCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DocCard();


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
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => BookedPg()));
          },
          leading: const Icon(Icons.person),
          title: Text('Dr John Cena', style: SafeGoogleFont(
            'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            // height: 10,
            color: Colors.blue.shade900,
          ),),

          subtitle: Text('', style: SafeGoogleFont(
            'Poppins',
            fontSize: 15,
            fontWeight: FontWeight.w600,
            // height: 10,
            color: Colors.blue.shade500,
          ),),
          trailing: Container(
            width: 80,
            height: 35,
            padding: new EdgeInsets.all(5.0),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.deepOrange,
            ),
            child: Center(child: Text('Booked',  style: SafeGoogleFont(
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

class DocCard2 extends StatelessWidget {
  const DocCard2({
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
          title: Text('Dr Peries', style: SafeGoogleFont(
            'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            // height: 10,
            color: Colors.blue.shade900,
          ),),

          subtitle: Text('', style: SafeGoogleFont(
            'Poppins',
            fontSize: 15,
            fontWeight: FontWeight.w600,
            // height: 10,
            color: Colors.blue.shade500,
          ),),
          trailing: Container(
            width: 80,
            height: 35,
            padding: new EdgeInsets.all(5.0),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.deepOrange,
            ),
            child: Center(child: Text('Booked',  style: SafeGoogleFont(
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
class DocCard3 extends StatelessWidget {
  const DocCard3({
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
          title: Text('Dr Kumara', style: SafeGoogleFont(
            'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            // height: 10,
            color: Colors.blue.shade900,
          ),),

          subtitle: Text('', style: SafeGoogleFont(
            'Poppins',
            fontSize: 15,
            fontWeight: FontWeight.w600,
            // height: 10,
            color: Colors.blue.shade500,
          ),),
          trailing: Container(
            width: 80,
            height: 35,
            padding: new EdgeInsets.all(5.0),

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
class DocCard4 extends StatelessWidget {
  const DocCard4({
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
          title: Text('Dr Silva', style: SafeGoogleFont(
            'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            // height: 10,
            color: Colors.blue.shade900,
          ),),

          subtitle: Text('', style: SafeGoogleFont(
            'Poppins',
            fontSize: 15,
            fontWeight: FontWeight.w600,
            // height: 10,
            color: Colors.blue.shade500,
          ),),
          trailing: Container(
            width: 80,
            height: 35,
            padding: new EdgeInsets.all(5.0),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.deepOrange,
            ),
            child: Center(child: Text('Booked',  style: SafeGoogleFont(
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
class DocCard5 extends StatelessWidget {
  const DocCard5({
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
          title: Text('Doc 1', style: SafeGoogleFont(
            'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            // height: 10,
            color: Colors.blue.shade900,
          ),),

          subtitle: Text('', style: SafeGoogleFont(
            'Poppins',
            fontSize: 15,
            fontWeight: FontWeight.w600,
            // height: 10,
            color: Colors.blue.shade500,
          ),),
          trailing: Container(
            width: 80,
            height: 35,
            padding: new EdgeInsets.all(5.0),

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
class DoctorCardPetBooking extends StatelessWidget {
  const DoctorCardPetBooking({
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


            Navigator.of(context).push(MaterialPageRoute(builder: (context) => BookNow()));
          },
          leading: const Icon(Icons.person),
          title: Text('Dr John Cena', style: SafeGoogleFont(
            'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            // height: 10,
            color: Colors.blue.shade900,
          ),),

          subtitle: Text('', style: SafeGoogleFont(
            'Poppins',
            fontSize: 15,
            fontWeight: FontWeight.w600,
            // height: 10,
            color: Colors.blue.shade500,
          ),),
          trailing: Container(
            width: 80,
            height: 35,
            padding: new EdgeInsets.all(5.0),

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


