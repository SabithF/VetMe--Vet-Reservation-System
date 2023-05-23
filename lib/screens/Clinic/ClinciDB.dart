import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:mad_cw2_vet_me/screens/Clinic/slots.dart';
import 'package:mad_cw2_vet_me/screens/widgets/banner-1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../utils.dart';
import '../widgets/Logout.dart';
import '../widgets/clinic-details.dart';
import '../widgets/my-pets-button.dart';
import '../widgets/profile-avatar.dart';
import '../widgets/text-field.dart';
import 'ClinicSchedule.dart';
import 'package:mad_cw2_vet_me/screens/Clinic/create-doctor-profile.dart';
import '../widgets/clinic-details-dashboard.dart';

class ClinicDb extends StatefulWidget {
  const ClinicDb({Key? key}) : super(key: key);

  @override
  State<ClinicDb> createState() => _ClinicDbState();
}

class _ClinicDbState extends State<ClinicDb> {
  final TextEditingController _filterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SettingsMenu(),
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
              Text(
                'Clinic Name',
                style: SafeGoogleFont(
                  'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  // height: 10,
                  color: const Color(0xffff7f0a),
                ),
              ),
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
              //Doctor and schedule button
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: InkWell(
                        child: Container(
                          height: 80,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(6, 5),
                                spreadRadius: -8,
                                blurRadius: 13,
                                color: Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.backup_table,
                              ),
                              Text('Schedule'),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SlotsScreen(),
                          ));
                        }),
                  ),
                  InkWell(
                    child: Container(
                      height: 80,
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(6, 5),
                            spreadRadius: -8,
                            blurRadius: 13,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.account_circle,
                          ),
                          Text('Doctor'),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CreateDoctorProfile(),
                      ));
                    },
                  )
                ],
              ),

              const SizedBox(
                height: 10.0,
              ),
              // SizedBox(
              //     height: 300.0,
              //     child: ListView.builder(itemBuilder: (context, index) {
              //       return DoctorCard();
              //     })),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  height: 350,
                  child: StreamBuilder(
                      stream:
                      FirebaseFirestore.instance.collection('doctors').snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else {
                          final docs = snapshot.data!.docs;
                          print(' snapshot.data!.docs.length${snapshot.data!.docs.length}');
                          return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot doctors = snapshot.data!.docs[index];

                              return snapshot.data!.docs.length != 0
                                  ? DoctorDetails(
                                docId : doctors.id,
                                name: doctors['name'],
                                contact: doctors['contact'],
                                details: doctors['details'],
                                image: doctors['image'] == null ? "" : doctors['image'],
                                uid: doctors['uid'],
                              )
                                  : Container();
                            },
                          );
                        }
                      }),
                ),
              ),

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


// import 'package:draggable_fab/draggable_fab.dart';
// import 'package:flutter/material.dart';
// import 'package:mad_cw2_vet_me/screens/Clinic/slots.dart';
// import 'package:mad_cw2_vet_me/screens/widgets/banner-1.dart';
//
// import '../../utils.dart';
// import '../widgets/clinic-details.dart';
// import '../widgets/my-pets-button.dart';
// import '../widgets/profile-avatar.dart';
// import '../widgets/text-field.dart';
// import 'ClinicSchedule.dart';
//
// class ClinicDb extends StatefulWidget {
//   const ClinicDb({Key? key}) : super(key: key);
//
//   @override
//   State<ClinicDb> createState() => _ClinicDbState();
// }
//
// class _ClinicDbState extends State<ClinicDb> {
//   final TextEditingController _filterController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
//         actions: const [ProfileAvatar(), SizedBox(width: 10.0)],
//       ),
//       drawer: const Drawer(),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 10.0,
//               ),
//               Text(
//                 'Clinic Name',
//                 style: SafeGoogleFont(
//                   'Poppins',
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600,
//                   // height: 10,
//                   color: const Color(0xffff7f0a),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10.0,
//               ),
//               InputField(
//                   hintText: "Filter by radius",
//                   controller: _filterController,
//                   obscureText: false),
//               const SizedBox(
//                 height: 10.0,
//               ),
//
//               const Banner1(),
//               //Doctor and schedule button
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(9.0),
//                     child: InkWell(
//                         child: Container(
//                           height: 80,
//                           width: 150,
//                           decoration: BoxDecoration(
//                             color: Colors.grey.shade50,
//                             borderRadius: BorderRadius.circular(10.0),
//                             boxShadow: const [
//                               BoxShadow(
//                                 offset: Offset(6, 5),
//                                 spreadRadius: -8,
//                                 blurRadius: 13,
//                                 color: Color.fromRGBO(0, 0, 0, 1),
//                               ),
//                             ],
//                           ),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: const [
//                               Icon(
//                                 Icons.backup_table,
//                               ),
//                               Text('Schedule'),
//                             ],
//                           ),
//                         ),
//                         onTap: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => SlotsScreen(),
//                           ));
//                         }),
//                   ),
//                   InkWell(
//                     child: Container(
//                       height: 80,
//                       width: 160,
//                       decoration: BoxDecoration(
//                         color: Colors.grey.shade50,
//                         borderRadius: BorderRadius.circular(10.0),
//                         boxShadow: const [
//                           BoxShadow(
//                             offset: Offset(6, 5),
//                             spreadRadius: -8,
//                             blurRadius: 13,
//                             color: Color.fromRGBO(0, 0, 0, 1),
//                           ),
//                         ],
//                       ),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: const [
//                           Icon(
//                             Icons.account_circle,
//                           ),
//                           Text('Doctor'),
//                         ],
//                       ),
//                     ),
//                     onTap: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => ClinicSchedule(),
//                       ));
//                     },
//                   )
//                 ],
//               ),
//
//               const SizedBox(
//                 height: 10.0,
//               ),
//               SizedBox(
//                   height: 300.0,
//                   child: ListView.builder(itemBuilder: (context, index) {
//                     return DoctorCard();
//                   })),
//               const SizedBox(
//                 height: 10.0,
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: DraggableFab(
//         child: FloatingActionButton.extended(
//           onPressed: () {
//             // Add your onPressed code here!
//           },
//           label: const Text('Home'),
//           icon: const Icon(Icons.cottage_rounded),
//           backgroundColor: Colors.indigo,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//         ),
//       ),
//     );
//   }
// }