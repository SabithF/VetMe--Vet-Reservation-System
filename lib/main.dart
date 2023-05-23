import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mad_cw2_vet_me/screens/Clinic/ClinciDB.dart';
import 'package:mad_cw2_vet_me/screens/Clinic/Test/pro.dart';
import 'package:mad_cw2_vet_me/screens/Clinic/bookingdetails.dart';
import 'package:mad_cw2_vet_me/screens/Clinic/create-doctor-profile.dart';
import 'package:mad_cw2_vet_me/screens/Clinic/create-schedule.dart';
import 'package:mad_cw2_vet_me/screens/Clinic/createDoctor.dart';
import 'package:mad_cw2_vet_me/screens/Clinic/slots.dart';
import 'package:mad_cw2_vet_me/screens/authentication/LoginDup2.dart';
import 'package:mad_cw2_vet_me/screens/authentication/login-screen.dart';
import 'package:mad_cw2_vet_me/screens/authentication/opening-screen-default.dart';
import 'package:mad_cw2_vet_me/screens/authentication/registration.dart';
import 'package:mad_cw2_vet_me/screens/pet-owner/Clinic_DB.dart';
import 'package:mad_cw2_vet_me/screens/pet-owner/du/ClinicDb-PetOwner.dart';
import 'package:mad_cw2_vet_me/screens/pet-owner/CreateNewBooking.dart';
import 'package:mad_cw2_vet_me/screens/pet-owner/create-pet-profile.dart';
import 'package:mad_cw2_vet_me/screens/pet-owner/filterClinics.dart';
import 'package:mad_cw2_vet_me/screens/pet-owner/list-of-pets.dart';
import 'package:mad_cw2_vet_me/screens/pet-owner/petDashboardempty.dart';
import 'package:mad_cw2_vet_me/screens/pet-owner/view-pet.dart';
import 'package:mad_cw2_vet_me/screens/pet/edit-medical.dart';
import 'package:mad_cw2_vet_me/screens/pet/empty/medicalRecordDb-Empt.dart';
import 'package:mad_cw2_vet_me/screens/pet/pet-med-reco.dart';
import 'package:mad_cw2_vet_me/screens/pet/view-pet.dart';
import 'package:mad_cw2_vet_me/utils.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp( MyApp());
}

class MyApp extends ConsumerWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      scrollBehavior: MyCustomScrollBehavior(),
      home:  DefaultOpeningScreen(),
    );
  }
}




