
import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';

import 'package:mad_cw2_vet_me/models/users.dart';
import 'package:mad_cw2_vet_me/screens/widgets/banner-1.dart';

import 'package:mad_cw2_vet_me/screens/widgets/my-pets-button.dart';

import '../../utils.dart';
import '../widgets/profile-avatar.dart';
import '../widgets/settingsMenue.dart';
import 'filterClinics.dart';


// class GeoLocation extends StateNotifier<GeoFirePoint> {
//   GeoLocation() : super(GeoFirePoint(0.0, 0.0));
//
//   void getLocation(Prediction prediction) {
//     if (prediction.lat != null && prediction.lng != null) {
//       double lngPrediction = double.parse(prediction.lng!);
//       double latPrediction = double.parse(prediction.lat!);
//       state.distance(lat: latPrediction, lng: lngPrediction);
//     }
//   }
// }
//
// class FilteredClinics extends StateNotifier<List<AppUser>> {
//   FilteredClinics() : super([]);
//
//   getFilteredClinics(String radius) {
//     final clinicController = ClinicController();
//     final centerLocation = GeoLocation();
//     List<AppUser> clinics = clinicController
//         .filterClinicsByRadiusForGivenLocation(radius, centerLocation.state);
//     for (var element in clinics) {
//       state.add(element);
//     }
//   }
// }
//
// final filteredClinicsProvider =
// StateNotifierProvider((ref) => FilteredClinics());
// final centerLocationProvider = StateNotifierProvider((ref) => GeoLocation());

class PetOwnerDashboard extends StatefulWidget {
  const PetOwnerDashboard({Key? key}) : super(key: key);

  @override
  State<PetOwnerDashboard> createState() => _PetOwnerDashboardState();
}

class _PetOwnerDashboardState extends State<PetOwnerDashboard> {
  final geo = GeoFlutterFire();

  double lat = 0.0;
  double lng = 0.0;

  final TextEditingController _radiusController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final String key = "AIzaSyCOpaFa6BK4mGwxG1XAEFOQOifWdCMAd8g";
  // final geo = GeoFlutterFire();
  late GeoFirePoint myLocation;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;



    return Scaffold(
      appBar: AppBar(
        leading: const SettingsMenu(),
        actions: const [ProfileAvatar(), SizedBox(width: 10.0)],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'Welcome to VetMe!',
                style: SafeGoogleFont(
                  'Poppins',
                  fontSize: 20 * ffem,
                  fontWeight: FontWeight.w600,
                  height: 1.1812192917 * ffem / fem,
                  color: const Color(0xffff7f0a),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Banner1(),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'Find clinics nearby!',
                style: SafeGoogleFont(
                  'Poppins',
                  fontSize: 20 * ffem,
                  fontWeight: FontWeight.w600,
                  height: 1.1812192917 * ffem / fem,
                  color: const Color(0xffff7f0a),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 375.0,
                child: Column(
                  children: [
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
                              controller: _radiusController,
                              decoration: const InputDecoration(
                                  border: InputBorder.none, hintText: "Radius (km)"),
                            ))),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: GooglePlaceAutoCompleteTextField(
                                textEditingController: _locationController,
                                googleAPIKey: key,
                                inputDecoration: const InputDecoration(border: InputBorder.none,hintText: "Address"),
                                countries: const ['lk'],
                                debounceTime: 800,
                                isLatLngRequired: true,
                                getPlaceDetailWithLatLng: (Prediction prediction) {
                                  myLocation = geo.point(latitude: double.parse(prediction.lat!), longitude: double.parse(prediction.lng!));
                                },
                                itmClick: (Prediction prediction) {
                                  _locationController.text = prediction.description!;

                                  _locationController.selection = TextSelection.fromPosition(
                                      TextPosition(offset: prediction.description!.length));
                                }
                              // default 600 ms ,
                            )
                        )
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton.icon(
                      style:  ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade900,
                        textStyle: SafeGoogleFont (
                          'Poppins',
                          fontSize: 15*ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.1812192917*ffem/fem,
                          color: Colors.white,
                        ) ,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FilterClinics()));
                      },
                      icon: const Icon( Icons.pets_sharp),
                      label: const Text('Filter'),),
                  ],
                ),
              ),

              const MyPetsButton()
            ],
          ),
        ),
      ),
    );
  }
}