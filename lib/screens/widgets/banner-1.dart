import 'package:flutter/material.dart';

import '../../utils.dart';

class Banner1 extends StatelessWidget {
  const Banner1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Card(
      color: const Color(0xff000746),
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 140.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                width: 130 * fem,
                height: 71 * fem,
                child: RichText(
                  softWrap: true,
                  text: TextSpan(
                    style: SafeGoogleFont(
                      'Poppins',
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.1812192917 * ffem / fem,
                      color: const Color(0xf7ffffff),
                    ),
                    children: [
                      const TextSpan(
                        text: 'Let the ',
                      ),
                      TextSpan(
                        text: 'Vet',
                        style: SafeGoogleFont(
                          'Poppins',
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.1812192917 * ffem / fem,
                          color: const Color(0xffff7f0a),
                        ),
                      ),
                      const TextSpan(
                        text: ', Take care of your ',
                      ),
                      TextSpan(
                        text: 'Pet',
                        style: SafeGoogleFont(
                          'Poppins',
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.1812192917 * ffem / fem,
                          color: const Color(0xffff7f0a),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 209 * fem,
                height: 149 * fem,
                child: Image.asset(
                  'assets/page-1/images/pleased-young-female-doctor-wearing-medical-robe-stethoscope-around-neck-standing-with-closed-posture409827-254-removebg-preview-1.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    //   Stack(
    //   children: [
    //     Positioned(
    //       // rectangle26317L5 (20:50)
    //       left: 0 * fem,
    //       top: 21 * fem,
    //       child: Align(
    //         child: SizedBox(
    //           width: 333 * fem,
    //           height: 128 * fem,
    //           child:
    //           Container(
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(10 * fem),
    //               color: const Color(0xff000746),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //     Positioned(
    //       // letthevettakecareofyorpetDtu (20:51)
    //       left: 25 * fem,
    //       top: 49 * fem,
    //       child: Align(
    //         child: SizedBox(
    //           width: 130 * fem,
    //           height: 71 * fem,
    //           child: RichText(
    //             text: TextSpan(
    //               style: SafeGoogleFont(
    //                 'Poppins',
    //                 fontSize: 20 * ffem,
    //                 fontWeight: FontWeight.w600,
    //                 height: 1.1812192917 * ffem / fem,
    //                 color: const Color(0xf7ffffff),
    //               ),
    //               children: [
    //                 const TextSpan(
    //                   text: 'Let the ',
    //                 ),
    //                 TextSpan(
    //                   text: 'Vet',
    //                   style: SafeGoogleFont(
    //                     'Poppins',
    //                     fontSize: 20 * ffem,
    //                     fontWeight: FontWeight.w600,
    //                     height: 1.1812192917 * ffem / fem,
    //                     color: const Color(0xffff7f0a),
    //                   ),
    //                 ),
    //                 const TextSpan(
    //                   text: ', Take care of yor ',
    //                 ),
    //                 TextSpan(
    //                   text: 'Pet',
    //                   style: SafeGoogleFont(
    //                     'Poppins',
    //                     fontSize: 20 * ffem,
    //                     fontWeight: FontWeight.w600,
    //                     height: 1.1812192917 * ffem / fem,
    //                     color: const Color(0xffff7f0a),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //     Positioned(
    //       // pleasedyoungfemaledoctorwearin (20:52)
    //       left: 158 * fem,
    //       top: 0 * fem,
    //       child: Align(
    //         child: SizedBox(
    //           width: 209 * fem,
    //           height: 149 * fem,
    //           child: Image.asset(
    //             'assets/page-1/images/pleased-young-female-doctor-wearing-medical-robe-stethoscope-around-neck-standing-with-closed-posture409827-254-removebg-preview-1.png',
    //             fit: BoxFit.cover,
    //           ),
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
