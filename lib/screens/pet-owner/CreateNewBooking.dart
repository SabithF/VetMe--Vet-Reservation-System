import 'package:draggable_fab/draggable_fab.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:mad_cw2_vet_me/models/invoice.dart';
import 'package:mad_cw2_vet_me/screens/pet-owner/petDashboardempty.dart';
import 'package:mad_cw2_vet_me/screens/pet-owner/petOwnerDashboard.dart';
import 'package:mad_cw2_vet_me/screens/pet-owner/view-pet.dart';
import 'package:mad_cw2_vet_me/screens/widgets/success-message-booking.dart';
import 'package:mad_cw2_vet_me/screens/widgets/success-message.dart';

import '../../utils.dart';
import '../widgets/banner-1.dart';

import '../widgets/profile-avatar.dart';
import 'du/ClinicDb-PetOwner.dart';

class BookNow extends StatefulWidget {
  const BookNow({Key? key}) : super(key: key);

  @override
  State<BookNow> createState() => _BookNowState();
}
const List<String> list = <String>['Dog1', 'Chiko', 'Balla' ,'Poosa'];
class _BookNowState extends State<BookNow> {


  String dropdownValue = list.first;





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
        padding: const EdgeInsets.all(9.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Book now', style: SafeGoogleFont(
                    'Poppins',
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                    // height: 10,
                    color: const Color(0xffff7f0a),
                  ), ),
                ),
              ),
              const Banner1(),
              Text('Booking Details', style: SafeGoogleFont(
                'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                // height: 10,
                color: Colors.blue.shade900,
              ),),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 10.0),
                  child: Row(
                    children: [
                      Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [


                              Text('Ref.no', style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                // height: 10,
                                color: Colors.black,

                              ), textAlign: TextAlign.left,),
                              SizedBox(height: 12,),
                              Text('Time', style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                // height: 10,
                                color: Colors.black,
                              ), textAlign: TextAlign.start),
                              SizedBox(height: 12,),
                              Text('Appoinmet Date', style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                // height: 10,
                                color: Colors.black,
                              ), ),
                              SizedBox(height: 12,),
                              Text('Appoinment No', style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                // height: 10,
                                color: Colors.black,
                              ), ),
                              SizedBox(height: 12,),
                              Text('Patient Details', style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                // height: 10,
                                color: Colors.black,
                              ), ),
                              SizedBox(height: 12,),
                              Text('Name', style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                // height: 10,
                                color: Colors.black,
                              ), ),
                              SizedBox(height: 12,),
                              Text('Pet ID', style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                // height: 10,
                                color: Colors.black,
                              ), ),
                              SizedBox(height: 18,),
                              Text('Total Fee (LKR)', style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 23,
                                fontWeight: FontWeight.w600,
                                // height: 10,
                                color: Colors.black,
                              ), ),


                            ]),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,

                            children: [


                              Text(':', style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                // height: 10,
                                color: Colors.black,

                              ), textAlign: TextAlign.left,),
                              SizedBox(height: 12,),
                              Text(':', style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                // height: 10,
                                color: Colors.black,

                              ), textAlign: TextAlign.left,),
                              SizedBox(height: 12,),
                              Text(':', style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                // height: 10,
                                color: Colors.black,

                              ), textAlign: TextAlign.left,),
                              SizedBox(height: 12,),
                              Text(':', style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                // height: 10,
                                color: Colors.black,

                              ), textAlign: TextAlign.left,),
                              SizedBox(height: 12,),
                              Text('', style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                // height: 10,
                                color: Colors.black,

                              ), textAlign: TextAlign.left,),
                              SizedBox(height: 12,),
                              Text(':', style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                // height: 10,
                                color: Colors.black,

                              ), textAlign: TextAlign.left,),
                              SizedBox(height: 12,),
                              Text(':', style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                // height: 10,
                                color: Colors.black,

                              ), textAlign: TextAlign.left,),
                              SizedBox(height: 18,),
                              Text(':', style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 23,
                                fontWeight: FontWeight.w600,
                                // height: 10,
                                color: Colors.black,

                              ), textAlign: TextAlign.left,),



                            ]),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [


                              Text('00121', style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                // height: 10,
                                color: Colors.black,

                              ), textAlign: TextAlign.left,),
                              SizedBox(height: 12,),
                              Text('9.00am', style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                // height: 10,
                                color: Colors.black,
                              ), textAlign: TextAlign.start),
                              SizedBox(height: 12,),
                              Text('15/01/2023', style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                // height: 10,
                                color: Colors.black,
                              ), ),
                              SizedBox(height: 12,),
                              Text('03', style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                // height: 10,
                                color: Colors.black,
                              ), ),
                              SizedBox(height: 12,),
                              Text('', style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                // height: 10,
                                color: Colors.black,
                              ), ),
                              SizedBox(height: 12,),

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

                              SizedBox(height: 12,),
                              Text('0618', style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                // height: 10,
                                color: Colors.black,
                              ), ),
                              SizedBox(height: 18,),
                              Text('4,350.00', style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 23,
                                fontWeight: FontWeight.w600,
                                // height: 10,
                                color: Colors.black,
                              ), ),



                            ]),
                      ),




                    ],
                  ),

                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                height: 35,
                width: double.infinity,
                child: TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                        textStyle:  SafeGoogleFont (
                      'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,

                      color: Colors.white,
                    ) ,),

                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SuccessMessageBooking()));
                    },
                    child: const Text('Book now')),
              ),

            ],


          ),

        ),
      ),
      floatingActionButton: DraggableFab(
        child: FloatingActionButton.extended(
          onPressed: () {

            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClinicDbPetOwner()));
            // Add your onPressed code here!
          },
          label: const Text('Back', ),
          icon: const Icon(Icons.cottage_rounded),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),

    );
  }
}
// class DropDown extends StatefulWidget {
//   const DropDown({Key? key}) : super(key: key);
//
//   @override
//   State<DropDown> createState() => _DropDownState();
// }
//
// class _DropDownState extends State<DropDown> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   FocusNode searchFocusNode = FocusNode();
//   FocusNode textFieldFocusNode = FocusNode();
//   late SingleValueDropDownController _cnt;
//   late MultiValueDropDownController _cntMulti;
//
//   @override
//   void dispose(){
//     _cnt.dispose();
//     _cntMulti.dispose();
//     super.dispose();
//
//   }
//   Widget build(BuildContext context) {
//     return null (),
//   }
// }
