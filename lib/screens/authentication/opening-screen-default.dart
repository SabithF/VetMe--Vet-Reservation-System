import 'package:flutter/material.dart';

import '../../utils.dart';
import 'login-screen.dart';

class DefaultOpeningScreen extends StatelessWidget {
  const DefaultOpeningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Container(
          // openingscreendefaultGGy (3:1052)
          decoration: const BoxDecoration (
            color: Colors.white,
          ),
          child: Container(
            // iphone1313pro1cLq (1:317)
            width: double.infinity,
            height: 844*fem,
            decoration: const BoxDecoration (
              color: Colors.white,
            ),
            child: Container(
              // loginreg9Lm (1:318)
              width: 428*fem,
              height: 926*fem,
              decoration: const BoxDecoration (
                color: Colors.white,
                // gradient: LinearGradient (
                //   begin: Alignment(-0.118, -1.684),
                //   end: Alignment(-0.096, 2.702),
                //   colors: <Color>[Color(0xff000746), Color(0xff05537e)],
                //   stops: <double>[0, 1],
                // ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    // adorablepuppysoloportrait1NDX (3:1048)
                    // left: 0*fem,
                    // top: 250*fem,
                    child: Align(
                      child: SizedBox(
                        width: 894*fem,
                        height: 596*fem,
                        child: FittedBox(
                          child: Image.asset(
                            'assets/page-1/images/dog.jpg',
                            // fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // findthebestcliniconyourareaEmX (1:328)
                    left: 73.5*fem,
                    top: 250*fem,
                    child: Align(
                      child: SizedBox(
                        width: 242*fem,
                        height: 23*fem,
                        child: Text(
                          'Find the best clinic on your area',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont (
                            'Inter',
                            fontSize: 16*ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.4375*ffem/fem,
                            color: const Color(0xff000741),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // logo1frq (3:1049)
                    left: 82*fem,
                    top: 162*fem,
                    child: Align(
                      child: SizedBox(
                        width: 227*fem,
                        height: 80*fem,
                        child: Image.asset(
                          'assets/page-1/images/logo-1.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // logo2kdP (3:1050)
                    left: 82*fem,
                    top: 162*fem,
                    child: Align(
                      child: SizedBox(
                        width: 227*fem,
                        height: 80*fem,
                        child: Image.asset(
                          'assets/page-1/images/logo-2.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // iconsaxlineararrowsquarerightf (3:1076)
                    left: 305*fem,
                    top: 766*fem,
                    child: Align(
                      child: SizedBox(
                        width: 66*fem,
                        height: 66*fem,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
                          },
                          style: TextButton.styleFrom (
                            padding: EdgeInsets.zero,
                          ),
                          child: Image.asset(
                            'assets/page-1/images/iconsax-linear-arrowsquareright.png',
                            width: 66*fem,
                            height: 66*fem,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
            ),
    );
  }
}