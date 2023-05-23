import 'package:flutter/material.dart';

import '../../utils.dart';

class Banner2 extends StatelessWidget {
  const Banner2({Key? key}) : super(key: key);

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
                        text: 'I am ',
                      ),
                      TextSpan(
                        text: 'Your',
                        style: SafeGoogleFont(
                          'Poppins',
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.1812192917 * ffem / fem,
                          color: const Color(0xffff7f0a),
                        ),
                      ),
                    const TextSpan(
                       text: ' Lovely ',
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
                width: 160 * fem,
                height: 129 * fem,
                child: Image.asset(
                  'assets/page-1/images/beautiful-pet-portrait-dog-2.png',
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
