import 'package:flutter/material.dart';

import '../../utils.dart';

class MyPetsButton extends StatefulWidget {
  const MyPetsButton({Key? key}) : super(key: key);

  @override
  State<MyPetsButton> createState() => _MyPetsButtonState();
}

class _MyPetsButtonState extends State<MyPetsButton> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: ElevatedButton.icon(
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
          onPressed: () {},
          icon: Icon( Icons.pets_sharp, ),
          label: const Text('My Pets >'),

        ),
      ),
    );
  }
}
class HomeBtn extends StatefulWidget {
  const HomeBtn({Key? key}) : super(key: key);

  @override
  State<HomeBtn> createState() => _HomeBtnState();
}

class _HomeBtnState extends State<HomeBtn> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Align(
        alignment: Alignment.center,
        child: ElevatedButton.icon(
          style:  ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade900,
            textStyle: SafeGoogleFont (
              'Poppins',
              fontSize: 15,
              fontWeight: FontWeight.w600,

              color: Colors.white,
            ) ,
          ),
          onPressed: () {},
          icon: Icon( Icons.medical_services, ),
          label: const Text('Home >'),

        ),
      ),
    );
  }
}



