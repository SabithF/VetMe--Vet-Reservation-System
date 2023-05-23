import 'package:flutter/material.dart';
import 'package:mad_cw2_vet_me/screens/pet-owner/view-pet.dart';

import '../../utils.dart';

class MedicalRecords extends StatelessWidget {
  final String title, description;
  const MedicalRecords(
      {Key? key,
        required this.title,
        required this.description,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return ListTile(
      tileColor: const Color(0xffc1eaec),
      leading: const Icon(
        Icons.pets_sharp,
        color: Color(0xff04097e),
      ),
      title: Text(
        title,
        style: SafeGoogleFont(
          'Poppins',
          fontSize: 20 * ffem,
          fontWeight: FontWeight.w600,
          height: 1.9462192535 * ffem / fem,
          color: const Color(0xff04097e),
        ),
      ),
      subtitle: Text(
        description,
        style: SafeGoogleFont(
          'Poppins',
          fontSize: 15 * ffem,
          fontWeight: FontWeight.w600,
          height: 1.9462192535 * ffem / fem,
          color: const Color(0xff04097e),
        ),
      ),
    );
  }
}
