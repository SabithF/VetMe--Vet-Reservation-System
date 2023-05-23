import 'package:flutter/material.dart';
import 'package:mad_cw2_vet_me/screens/pet-owner/list-of-pets.dart';
import 'package:mad_cw2_vet_me/screens/widgets/share-buttons.dart';

import '../../controllers/share-controller.dart';
import '../../models/invoice.dart';
import '../../utils.dart';
import '../pet-owner/filterClinics.dart';
import '../pet-owner/du/pet-owner-dashboard.dart';
import '../pet-owner/petOwnerDashboard.dart';

class SuccessMessageBooking extends StatelessWidget {
  const SuccessMessageBooking({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    Invoice newInvoice = Invoice(
        '00121', '9.00am', '15/01/2023', '03', 'Chiko', '001', '4,350.00');

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding:
            EdgeInsets.fromLTRB(32 * fem, 50.95 * fem, 23.08 * fem, 64 * fem),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(6 * fem, 0 * fem, 0 * fem, 8 * fem),
                width: 328.92 * fem,
                height: 353.05 * fem,
                child: Image.asset(
                  'assets/page-1/images/undrawmedicalresearchqg4d-1.png',
                  width: 10,
                  height: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    6 * fem, 0 * fem, 15.92 * fem, 99 * fem),
                width: double.infinity,
                height: 216 * fem,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0 * fem,
                      top: 0 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 313 * fem,
                          height: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(23 * fem),
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 45.5 * fem,
                      top: 11 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 221 * fem,
                          height: 78 * fem,
                          child: Text(
                            'Booking Successful!!',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Poppins',
                              fontSize: 26 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.5 * ffem / fem,
                              color: const Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 114 * fem,
                      top: 118 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 98 * fem,
                          height: 98 * fem,
                          child: Image.asset(
                            'assets/page-1/images/password-validation-icons-dgV.png',
                            width: 98 * fem,
                            height: 98 * fem,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue.shade900,
                      textStyle: const TextStyle(fontSize: 15)),
                  onPressed: () async {
                    await showDialog<Options>(
                        context: context,
                        builder: (BuildContext context) {
                          return SimpleDialog(
                            title: const Text('Select an option'),
                            children: <Widget>[
                              SimpleDialogOption(
                                onPressed: () {
                                  printDoc(Options.download.name, newInvoice);
                                },
                                child: const Text('Download as a Pdf'),
                              ),
                              SimpleDialogOption(
                                onPressed: () {
                                  printDoc(Options.share.name, newInvoice);
                                },
                                child: const Text('Share'),
                              ),
                            ],
                          );
                        });
                  },
                  child: const Text('Download Receipt')),
              // InkWell(
              //   onTap: () async {
              //     await showDialog<Options>(
              //         context: context,
              //         builder: (BuildContext context) {
              //           return SimpleDialog(
              //             title: const Text('Select an option'),
              //             children: <Widget>[
              //               SimpleDialogOption(
              //                 onPressed: () { printDoc(Options.download.name, newInvoice); },
              //                 child: const Text('Download as a Pdf'),
              //               ),
              //               SimpleDialogOption(
              //                 onPressed: () { printDoc(Options.share.name, newInvoice); },
              //                 child: const Text('Share'),
              //               ),
              //             ],
              //           );
              //         }
              //     );
              //   },
              //   child: Container(
              //     // autogroupnesd7VK (KxJg3Ridnr6QoEman4neSD)
              //     margin: EdgeInsets.fromLTRB(86.33*fem, 0*fem, 128.42*fem, 67*fem),
              //     width: double.infinity,
              //     child: Row(
              //       crossAxisAlignment: CrossAxisAlignment.end,
              //       children: [
              //         Container(
              //           // iconsaxlineardocumentdownloadE (39:570)
              //           margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 8.83*fem, 0.33*fem),
              //           width: 33.33*fem,
              //           height: 33.33*fem,
              //           child: Image.asset(
              //             'assets/page-1/images/iconsax-linear-documentdownload.png',
              //             width: 33.33*fem,
              //             height: 33.33*fem,
              //           ),
              //         ),
              //         Text(
              //           // receiptuAH (39:574)
              //           'Receipt',
              //           textAlign: TextAlign.center,
              //           style: SafeGoogleFont (
              //             'Poppins',
              //             fontSize: 20*ffem,
              //             fontWeight: FontWeight.w400,
              //             height: 1.5*ffem/fem,
              //             color: const Color(0xff000000),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green.shade900,
                      textStyle: const TextStyle(fontSize: 15)),
                  onPressed: ()  {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const FilterClinics()),);
                  },
                  child: const Text('Next')),
            ],
          ),
        ),
      ),
    );
  }
}
