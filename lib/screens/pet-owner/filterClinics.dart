import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:mad_cw2_vet_me/screens/pet-owner/petDashboardempty.dart';
import 'package:mad_cw2_vet_me/screens/widgets/clinicDetails2.dart';

import '../../models/users.dart';
import '../../utils.dart';
import '../widgets/banner-1.dart';
import '../widgets/clinic-details.dart';
import '../widgets/profile-avatar.dart';
import 'Clinic_DB.dart';
import 'create-pet-profile.dart';
import 'list-of-pets.dart';

List<AppUser> list = [
  AppUser(referenceId: ' ', username: 'Metro clinic', email: '', contact: '', address: '498 Galle Road, Colombo, Sri Lanka', coordinates: GeoFirePoint(0, 0), uid: ''),
  AppUser(referenceId: '', username: 'Esoft Clinic', email: '', contact: '', address: 'De Fonseka Place, Sri Lanka', coordinates: GeoFirePoint(0, 0), uid: ''),
  AppUser(referenceId: '', username: 'State Clinic', email: '', contact: '', address: 'No 6, Gall Road, Colombo 06', coordinates: GeoFirePoint(0, 0), uid: '')
];

class FilterClinics extends ConsumerWidget {
  const FilterClinics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          actions: const [
            ProfileAvatar(),  SizedBox(width: 10.0)
          ],

        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Text('Hi, User 1',  style: SafeGoogleFont(
                'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                height: 1,
                color: const Color(0xffff7f0a),
              ),),
              const Banner1(),
              const SizedBox(
                height: 20.0,
              ),
              ClinicDetails2(
                clinicDetails: list[0],
              ),
              ClinicDetails2(
                clinicDetails: list[1],
              ),
              ClinicDetails2(
                clinicDetails: list[2],
              )
            ],
          ),
        ),
      floatingActionButton: DraggableFab(
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PetList()));
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
