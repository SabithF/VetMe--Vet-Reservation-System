import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../controllers/list_of_pets_controller.dart';
import '../../models/pets.dart';
import '../widgets/Logout.dart';
import '../widgets/banner-2.dart';
import '../widgets/pet-details.dart';
import '../widgets/profile-avatar.dart';
import '../../utils.dart';
import '../widgets/text-field.dart';
import 'create-pet-profile.dart';

class PetList extends StatefulWidget {
  const PetList({Key? key}) : super(key: key);

  @override
  State<PetList> createState() => _PetListDashboardState();
}

class _PetListDashboardState extends State<PetList> {
  final TextEditingController _filterController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      appBar: AppBar(
        leading: SettingsMenu(),
        actions: const [ProfileAvatar(), SizedBox(width: 10.0)],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => PetProfile()));
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'Here Are My Pets! s',
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
              // InputField(
              //     hintText: "Filter by Name",
              //     controller: _filterController,
              //     obscureText: false),

              const SizedBox(
                height: 20.0,
              ),
              const Banner2(),
              const SizedBox(
                height: 10.0,
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  height: 500,
                  child: StreamBuilder(
                      stream:
                      FirebaseFirestore.instance.collection('pets').snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else {
                          final docs = snapshot.data!.docs;
                          print(' snapshot.data!.docs.length' +
                              snapshot.data!.docs.length.toString());
                          return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot pets = snapshot.data!.docs[index];

                              return snapshot.data!.docs.length != 0
                                  ? PetDetails(
                                docId : pets.id,
                                name: pets['name'],
                                category: pets['breed'], age: pets['age'], details: pets['details'],
                                image: pets['image'] == null ? "" : pets['image'],
                                uid: pets['uid'],
                              )
                                  : Container();
                            },
                          );
                        }
                      }),
                ),
              ),
            ],
          ),
        ),
      ),




    );
  }
}
