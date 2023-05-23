import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:mad_cw2_vet_me/screens/pet-owner/petDashboardempty.dart';
import 'package:mad_cw2_vet_me/screens/widgets/banner-1.dart';

import '../../../utils.dart';
import '../../widgets/clinic-details.dart';
import '../../widgets/my-pets-button.dart';
import '../../widgets/profile-avatar.dart';
import '../../widgets/text-field.dart';
import '../filterClinics.dart';



class ClinicDbPetOwner extends StatefulWidget {
  const ClinicDbPetOwner({Key? key}) : super(key: key);

  @override
  State<ClinicDbPetOwner> createState() => _ClinicDbState();
}

class _ClinicDbState extends State<ClinicDbPetOwner> {
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
              const SizedBox(
                height: 10.0,
              ),
              Text('Metro Clinic', style: SafeGoogleFont(
                'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                // height: 10,
                color: const Color(0xffff7f0a),
              ),),
              const SizedBox(
                height: 10.0,
              ),
              InputField(
                  hintText: "Filter by radius",
                  controller: _filterController,
                  obscureText: false),
              const SizedBox(
                height: 10.0,
              ),


              const Banner1(),
              const SizedBox(
                height: 10.0,
              ),
              // const ClinicDetails(
              //     name: 'Ss clinic',
              //     radius: '200',
              //     location: '49/11,fife rod'),
              DoctorCardPetBooking(),
              DocCard2(),
              DocCard3(),
              DocCard4(),
              DoctorCard(),


              const SizedBox(
                height: 10.0,
              ),



            ],

          ),
        ),
      ),
      floatingActionButton: DraggableFab(
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PetListDb()));
            // Add your onPressed code here!
          },
          label: const Text('MyPets >'),
          icon: const Icon(Icons.pets_rounded),
          backgroundColor: Colors.indigo,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),



    );
  }
}

