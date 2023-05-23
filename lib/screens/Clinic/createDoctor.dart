//
//
// import 'package:flutter/material.dart';
// import 'package:mad_cw2_vet_me/controllers/WriteDoctor.dart';
// import 'package:mad_cw2_vet_me/screens/components/loadingLayer.dart';
// import '../../utils.dart';
// import '../widgets/profile-avatar.dart';
//
// import '../widgets/profile_pic.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
//
// class CreateDoctorProfile extends ConsumerWidget {
//
//
//   // CreateDoctorProfile({super.key});
//
// //   @override
// //   State<CreateDoctorProfile> createState() => _CreateDoctorProfileState();
// // }
// //
// // class _CreateDoctorProfileState extends State<CreateDoctorProfile> {
//
//   DateTime dateTime = DateTime(2023, 01, 12, 5, 30);
//
//
//
//
//
//   final TextEditingController _dNameController = TextEditingController();
//   final TextEditingController _detailsController = TextEditingController();
//   final TextEditingController _contactController = TextEditingController();
//
//
//   // bool ch1 = false;
//   // bool ch2 = false;
//   // bool ch3 = false;
//   // bool ch4 = false;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     double baseWidth = 390;
//     double fem = MediaQuery.of(context).size.width / baseWidth;
//     double ffem = fem * 0.97;
//
//     final hours = dateTime.hour.toString().padLeft(2, '0');
//     final minutes = dateTime.minute.toString().padLeft(2, '0');
//
//     // final model = ref.watch(createDoctorProvider);
//
//     return LoadingLayer(
//       child: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.menu)
//           ),
//           actions: const [
//             ProfileAvatar(),
//             SizedBox(width: 10.0)
//           ],
//         ),
//         body: ListView(
//           padding: const EdgeInsets.symmetric(horizontal: 32),
//           physics: const BouncingScrollPhysics(),
//           children: [
//             const SizedBox(
//               height: 20.0,
//             ),
//
//             Container(
//               margin: EdgeInsets.fromLTRB(85*fem, 0*fem, 0*fem, 0*fem),
//               child: Text(
//                 'Add a new doctor',
//                 style: SafeGoogleFont (
//                   'Poppins',
//                   fontSize: 18*ffem,
//                   fontWeight: FontWeight.w600,
//                   color: const Color(0xff000000),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 20.0,
//             ),
//
//             const ProfilePic(),
//
//             const SizedBox(
//               height: 10.0,
//             ),
//
//             Text(
//               'Name',
//               style: SafeGoogleFont (
//                 'Poppins',
//                 fontSize: 18*ffem,
//                 color: const Color(0xff000000),
//               ),
//             ),
//             TextFormField(
//               // initialValue: model.name,
//               decoration: InputDecoration(
//                 labelText: "Doctor "
//               ),
//               // onChanged: (v)=> model.name=v,
//             ),
//
//             // InputField(
//             //     hintText: "Doctor Name",
//             //     controller: _dNameController,
//             //     obscureText: false,
//             // ),
//             const SizedBox(
//               height: 10.0,
//             ),
//
//             Text(
//
//               'Services provided',
//               style: SafeGoogleFont (
//                 'Poppins',
//                 fontSize: 18*ffem,
//                 color: const Color(0xff000000),
//               ),
//             ),
//             TextFormField(
//               // initialValue: model.service,
//               decoration: InputDecoration(
//                   labelText: "Service "
//               ),
//               // onChanged: (v)=> model.service=v,
//             ),
//             const SizedBox(
//               height: 10.0,
//             ),
//
//             Text(
//               'Contact Details',
//               style: SafeGoogleFont (
//                 'Poppins',
//                 fontSize: 18*ffem,
//                 color: const Color(0xff000000),
//               ),
//             ),
//             TextFormField(
//               // initialValue: model.contact,
//               decoration: InputDecoration(
//                   labelText: "Contact details "
//               ),
//               // onChanged: (v)=> model.contact=v,
//             ),
//
//             const SizedBox(
//               height: 10.0,
//             ),
//
//             Text(
//               'Date and Time',
//               style: SafeGoogleFont (
//                 'Poppins',
//                 fontSize: 18*ffem,
//                 color: const Color(0xff000000),
//               ),
//             ),
//             //date and time
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Expanded(
//                     child: ElevatedButton(
//                       child: Text('${dateTime.year}/${dateTime.month}/${dateTime.day}'),
//                       onPressed: () async {
//                         final date = await pickDate();
//                         if (date == null ) return;
//
//                         final newDateTime = DateTime(
//                           date.year,
//                           date.month,
//                           date.day,
//                           dateTime.hour,
//                           dateTime.minute,
//                         );
//                         // setState(() => dateTime = date);
//                       },
//                     )
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                     child: ElevatedButton(
//                       child: Text('$hours:$minutes'),
//                       onPressed: () async {
//                         final time = await pickTime();
//                         if (time == null ) return;
//                         final newDateTime = DateTime(
//                           dateTime.year,
//                           dateTime.month,
//                           dateTime.day,
//                           time.hour,
//                           time.minute,
//                         );
//                         // setState(() => dateTime = newDateTime);
//                       },
//                     )
//                 ),
//               ],
//             ),
//
//             const SizedBox(
//               height: 10.0,
//             ),
//
//             const SizedBox(
//               height: 10.0,
//             ),
//
//             TextButton(
//                 style: TextButton.styleFrom(
//                     foregroundColor: Colors.white,
//                     backgroundColor: Colors.green.shade800,
//                     textStyle: const TextStyle(fontSize: 18)),
//                 //
//                 onPressed: () {  },
//                 child: const Text('Save')
//             ),
//
//
//           ],
//         ),
//
//       ),
//     );
//   }
//
//   pickTime() {}
//
//   pickDate() {}
//
//   // Future<DateTime?> pickDate() => showDatePicker(
//   //     context: context,
//   //     initialDate: dateTime,
//   //     firstDate: DateTime(2020),
//   //     lastDate: DateTime(2025),
//   // );
//   // Future<TimeOfDay?> pickTime() => showTimePicker(
//   //     context: context,
//   //     initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
//   // );
// }
