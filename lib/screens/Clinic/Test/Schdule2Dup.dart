import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:mad_cw2_vet_me/screens/Clinic/ClinciDB.dart';

import '../../../utils.dart';
import '../../pet-owner/list-of-pets.dart';
import '../../widgets/profile-avatar.dart';
import '../../widgets/text-field.dart';
import '../create-schedule.dart';

class ClinicSchedule2 extends StatelessWidget {
  ClinicSchedule2({Key? key}) : super(key: key);
  final TextEditingController _filterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()
        {}, icon: const Icon(Icons.menu)),
        actions: const [ProfileAvatar(), SizedBox(width: 10.0)],
      ),
      drawer: const Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InputField(
                  hintText: "Filter by radius",
                  controller: _filterController,
                  obscureText: false),
              Container(

                child: Align(
                  alignment: Alignment.centerLeft,

                  child: Text('Clinic Name', style: SafeGoogleFont(
                    'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    // height: 10,
                    color: const Color(0xffff7f0a),
                  ),),
                ),
              ),
              SlotCard(),
              SlotCard2(),
              SlotCard3(),
              SlotCard4(),

              TextButton(
                  style: TextButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(15),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green.shade900,
                      textStyle: const TextStyle(fontSize: 15)),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateSchedule()));
                  },
                  child: const Icon(Icons.add)),


            ],
          ),
        ),
      ),
      floatingActionButton: DraggableFab(
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClinicDb()));
            // Add your onPressed code here!
          },
          label: const Text('Home'),
          icon: const Icon(Icons.cottage_rounded),
          backgroundColor: Colors.indigo,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}

class SlotCard extends StatelessWidget {
  const SlotCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlue.shade100.withOpacity(1.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),

      ),
      child: ExpansionTile(
        //Slots---------------------
        title: Text('Slot 01', style: SafeGoogleFont(
          'Poppins',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          // height: 10,
          color: Colors.blue.shade900,
        ),),


        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(padding: EdgeInsets.only(left: 10.0),
              child: Text('Dr John Cena', style: SafeGoogleFont(
                'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w800,
                // height: 10,
                color: Colors.blue.shade800,
              ),),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
              child: Text('9.00am', style: SafeGoogleFont(
                'Poppins',
                fontSize: 15,
                fontWeight: FontWeight.w600,
                // height: 10,
                color: Colors.black,
              ),),),
          )



        ],
        leading: const Icon(Icons.person),
        trailing: InkWell(
          child: Container(

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
class SlotCard2 extends StatelessWidget {

  const SlotCard2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlue.shade100.withOpacity(1.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),

      ),
      child: ExpansionTile(
        //Slots---------------------
        title: Text('Slot 02', style: SafeGoogleFont(
          'Poppins',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          // height: 10,
          color: Colors.blue.shade900,
        ),),


        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(padding: EdgeInsets.only(left: 10.0),
              child: Text('Dr John Cena', style: SafeGoogleFont(
                'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w800,
                // height: 10,
                color: Colors.blue.shade800,
              ),),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
              child: Text('2.00pm - 13.00pm', style: SafeGoogleFont(
                'Poppins',
                fontSize: 15,
                fontWeight: FontWeight.w600,
                // height: 10,
                color: Colors.black,
              ),),),
          )



        ],
        leading: const Icon(Icons.person),
        trailing: InkWell(
          child: Container(

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
class SlotCard3 extends StatelessWidget {

  const SlotCard3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlue.shade100.withOpacity(1.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),

      ),
      child: ExpansionTile(
        //Slots---------------------
        title: Text('Slot 03', style: SafeGoogleFont(
          'Poppins',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          // height: 10,
          color: Colors.blue.shade900,
        ),),


        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(padding: EdgeInsets.only(left: 10.0),
              child: Text('Dr Silva', style: SafeGoogleFont(
                'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w800,
                // height: 10,
                color: Colors.blue.shade800,
              ),),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
              child: Text('15.00pm', style: SafeGoogleFont(
                'Poppins',
                fontSize: 15,
                fontWeight: FontWeight.w600,
                // height: 10,
                color: Colors.black,
              ),),),
          )



        ],
        leading: const Icon(Icons.person),
        trailing: InkWell(
          child: Container(

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
class SlotCard4 extends StatelessWidget {

  const SlotCard4({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlue.shade100.withOpacity(1.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),

      ),
      child: ExpansionTile(
        //Slots---------------------
        title: Text('Slot 04', style: SafeGoogleFont(
          'Poppins',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          // height: 10,
          color: Colors.blue.shade900,
        ),),


        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(padding: EdgeInsets.only(left: 10.0),
              child: Text('Dr Kumara', style: SafeGoogleFont(
                'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w800,
                // height: 10,
                color: Colors.blue.shade800,
              ),),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
              child: Text('16.00am', style: SafeGoogleFont(
                'Poppins',
                fontSize: 15,
                fontWeight: FontWeight.w600,
                // height: 10,
                color: Colors.black,
              ),),),
          )



        ],
        leading: const Icon(Icons.person),
        trailing: InkWell(
          child: Container(

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
