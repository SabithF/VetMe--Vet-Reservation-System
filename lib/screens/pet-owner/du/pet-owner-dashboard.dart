// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:geoflutterfire2/geoflutterfire2.dart';
// import 'package:google_places_flutter/google_places_flutter.dart';
// import 'package:google_places_flutter/model/prediction.dart';
// // import 'package:mad_cw2_vet_me/controllers/clinic-controller.dart';
// import 'package:mad_cw2_vet_me/screens/widgets/banner-1.dart';
// import 'package:mad_cw2_vet_me/screens/widgets/clinic-details.dart';
// import 'package:mad_cw2_vet_me/screens/widgets/my-pets-button.dart';
// import 'package:mad_cw2_vet_me/screens/widgets/profile-avatar.dart';
//
// import '../../utils.dart';
//
// final clinicsStreamProvider = StreamProvider<List<DocumentSnapshot>>(
//     (ref) {      final clinicController = ClinicController();
//       // return clinicController.filterClinicsByRadiusForGivenLocation(radius, center,);
//     }
// );
//
// class PetOwnerDashboard extends ConsumerStatefulWidget {
//   const PetOwnerDashboard({Key? key}) : super(key: key);
//
//   @override
//   ConsumerState<PetOwnerDashboard> createState() => _PetOwnerDashboardState();
// }
//
// class _PetOwnerDashboardState extends ConsumerState<PetOwnerDashboard> {
//   final geo = GeoFlutterFire();
//
//   double lat = 0.0;
//   double lng = 0.0;
//
//   final TextEditingController _radiusController = TextEditingController();
//   final TextEditingController _locationController = TextEditingController();
//   final String key = "AIzaSyCOpaFa6BK4mGwxG1XAEFOQOifWdCMAd8g";
//
//   // ClinicController clinicController = ClinicController();
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     GeoFirePoint myLocation = geo.point(latitude: lat, longitude: lng);
//     double baseWidth = 390;
//     double fem = MediaQuery.of(context).size.width / baseWidth;
//     double ffem = fem * 0.97;
//
//     final clinicsNearby = ref.watch(clinicsStreamProvider);
//
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
//         actions: const [ProfileAvatar(), SizedBox(width: 10.0)],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 10.0,
//               ),
//               Text(
//                 'Hi Tiger!',
//                 style: SafeGoogleFont(
//                   'Poppins',
//                   fontSize: 20 * ffem,
//                   fontWeight: FontWeight.w600,
//                   height: 1.1812192917 * ffem / fem,
//                   color: const Color(0xffff7f0a),
//                 ),
//               ),
//               Container(
//                   decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey.shade300),
//                       borderRadius: BorderRadius.circular(12.0)),
//                   child: Padding(
//                       padding: const EdgeInsets.only(left: 20.0),
//                       child: GooglePlaceAutoCompleteTextField(
//                           textEditingController: _locationController,
//                           googleAPIKey: key,
//                           inputDecoration: const InputDecoration(border: InputBorder.none,hintText: "Address"),
//                           countries: const ['lk'],
//                           debounceTime: 800,
//                           isLatLngRequired: true,
//                           getPlaceDetailWithLatLng: (Prediction prediction) {
//                             lat = double.parse(prediction.lat!);
//                             lng =  double.parse(prediction.lng!);
//                           },
//                           itmClick: (Prediction prediction) {
//                             _locationController.text = prediction.description!;
//
//                             _locationController.selection = TextSelection.fromPosition(
//                                 TextPosition(offset: prediction.description!.length));
//                           }
//                         // default 600 ms ,
//                       )
//                   )
//               ),
//               const SizedBox(
//                 height: 10.0,
//               ),
//               Container(
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       border: Border.all(color: Colors.grey.shade300),
//                       borderRadius: BorderRadius.circular(12.0)),
//                   child: Padding(
//                       padding: const EdgeInsets.only(left: 20.0),
//                       child: TextField(
//                         keyboardType: TextInputType.number,
//                         textInputAction: TextInputAction.done,
//                         controller: _radiusController,
//                         decoration: const InputDecoration(
//                             border: InputBorder.none, hintText: "Radius (km)"),
//                       ))),
//               const SizedBox(
//                 height: 10.0,
//               ),
//               const Banner1(),
//               const SizedBox(
//                 height: 10.0,
//               ),
//               clinicsNearby.when(
//                   data: (data) => ListView.builder(
//                     itemCount: data.length,
//                     itemBuilder: (context,index) =>
//                        ClinicDetails(name: data[index].id, radius: 'radius', location: 'location'),
//                   ),
//                   error: (error,stackTrace) => SnackBar(content: Text(error.toString())),
//                   loading: () => const Center(
//                 child: CircularProgressIndicator()
//               )),
//               const ClinicDetails(
//                         name: "clinin",
//                         radius: '200',
//                         location: '49/11,fife rod'),
//               const SizedBox(
//                 height: 10.0,
//               ),
//               const MyPetsButton()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
