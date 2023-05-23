import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:mad_cw2_vet_me/controllers/authentication-controller.dart';

import 'package:mad_cw2_vet_me/controllers/pet-owner-controller.dart';
import 'package:mad_cw2_vet_me/models/users.dart';
import 'package:mad_cw2_vet_me/screens/widgets/success-message.dart';
import 'package:mad_cw2_vet_me/screens/widgets/text-field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../utils.dart';
import '../pet-owner/du/ClinicDb-PetOwner.dart';
import '../pet-owner/petOwnerDashboard.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

const List<String> list = <String>['Pet Owner', 'Clinic'];

class _RegistrationState extends State<Registration> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final String key = "AIzaSyCOpaFa6BK4mGwxG1XAEFOQOifWdCMAd8g";
  final geo = GeoFlutterFire();
  late GeoFirePoint myLocation;
  final maskFormatter = MaskTextInputFormatter(mask: "### ### ####");
  List<bool> isSelected = [true, false];
  static const List<Widget> user = <Widget>[Text('Pet Owner'), Text('Clinic')];

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    PetOwnerController newPet = PetOwnerController();
    // ClinicController newClinic = ClinicController();
    AuthenticationController auth = AuthenticationController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'Create an account',
                textAlign: TextAlign.start,
                style: SafeGoogleFont(
                  'Inter',
                  fontSize: 20 * ffem,
                  fontWeight: FontWeight.w600,
                  height: 1.2125 * ffem / fem,
                  color: const Color(0xff000000),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'Hello, Create an account and join us',
                textAlign: TextAlign.start,
                style: SafeGoogleFont(
                  'Inter',
                  fontSize: 14 * ffem,
                  fontWeight: FontWeight.w600,
                  height: 1.2125 * ffem / fem,
                  color: const Color(0xff595959),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              ToggleButtons(
                direction: Axis.horizontal,
                onPressed: (index) {
                    setState(() {
                      for (int buttonIndex = 0;
                      buttonIndex < isSelected.length;
                      buttonIndex++) {
                        if (buttonIndex == index) {
                          isSelected[buttonIndex] = true;
                        }else{
                          isSelected[buttonIndex] = false;
                        }
                      }
                    });
                },
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                selectedBorderColor: Colors.deepOrange[700],
                selectedColor: Colors.white,
                fillColor: Colors.deepOrange[200],
                color: Colors.deepOrange[400],
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                  minWidth: 80.0,
                ),
                isSelected: isSelected,
                children: user,
              ),
              const SizedBox(
                height: 30.0,
              ),
              InputField(
                  hintText: "Username",
                  controller: _usernameController,
                  obscureText: false),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12.0)),
                  child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Email'),
                      ))),
              const SizedBox(
                height: 10.0,
              ),
              InputField(
                  hintText: "Password",
                  controller: _passwordController,
                  obscureText: true),
              const SizedBox(
                height: 10.0,
              ),
              InputField(
                  hintText: "Confirm Password",
                  controller: _confirmPasswordController,
                  obscureText: true),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12.0)),
                  child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _phoneNumberController,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Phone Number'),
                        inputFormatters: [maskFormatter],
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
                          inputDecoration: const InputDecoration(
                              border: InputBorder.none, hintText: "Address"),
                          countries: const ['lk'],
                          debounceTime: 800,
                          isLatLngRequired: true,
                          getPlaceDetailWithLatLng: (Prediction prediction) {
                            myLocation = geo.point(
                                latitude: double.parse(prediction.lat!),
                                longitude: double.parse(prediction.lng!));
                          },
                          itmClick: (Prediction prediction) {
                            _locationController.text = prediction.description!;

                            _locationController.selection =
                                TextSelection.fromPosition(TextPosition(
                                    offset: prediction.description!.length));
                          }
                          // default 600 ms ,
                          ))),
              const SizedBox(
                height: 40.0,
              ),
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SuccessMessage()));


                    AppUser newUser = AppUser.user(
                        _usernameController.text,
                        _emailController.text,
                        _phoneNumberController.text,
                        _locationController.text,
                        myLocation,
                        FirebaseAuth.instance.currentUser!.uid);

                    if (isSelected[0] == true) {
                      newPet.addPetOwner(newUser);
                    } else {
                      // newClinic.addClinic(newUser);
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Welcome to VetMe!")));
                  },
                  child: Container(
                    // autogroupyrimvbK (KxJZrwMJRpCK8LHMSCYrim)
                    // margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 67 * fem),
                    width: double.infinity,
                    height: 50 * fem,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15 * fem),
                      gradient: const LinearGradient(
                        begin: Alignment(-0.118, -1.684),
                        end: Alignment(-0.096, 2.702),
                        colors: <Color>[Color(0xb204097e), Color(0xb20019ff)],
                        stops: <double>[0, 1],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Register',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 14 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.2125 * ffem / fem,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              const SizedBox(
                height: 50.0,
              ),
              Container(
                // notregisteredyetcreateanaccoun (1:429)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 10.59 * fem, 0 * fem),
                child: InkWell(
                  onTap: () {},
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 13 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.2102272327 * ffem / fem,
                        color: const Color(0xff979797),
                      ),
                      children: [
                        TextSpan(
                          text: 'Already have an account? ',
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 13 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.2125 * ffem / fem,
                            color: const Color(0xff979797),
                          ),
                        ),
                        TextSpan(
                          text: 'Sign in',
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 13 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.2125 * ffem / fem,
                            color: const Color(0xffff7f0a),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                width: 227 * fem,
                height: 80 * fem,
                child: Image.asset(
                  'assets/page-1/images/logo-1.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
