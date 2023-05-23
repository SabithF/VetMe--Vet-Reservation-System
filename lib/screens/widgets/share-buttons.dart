import 'package:flutter/material.dart';
import 'package:mad_cw2_vet_me/controllers/share-controller.dart';

import '../../models/invoice.dart';
import '../../utils.dart';

enum Options{download,share}

class ShareButtons extends StatefulWidget {
  final Invoice invoice;
  const ShareButtons({Key? key, required this.invoice}) : super(key: key);

  @override
  State<ShareButtons> createState() => _ShareButtonsState();
}

class _ShareButtonsState extends State<ShareButtons> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return InkWell(
      onTap: () async {
      await showDialog<Options>(
      context: context,
      builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text('Select an option'),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () { printDoc(Options.download.name, widget.invoice); },
            child: const Text('Download as a Pdf'),
          ),
          SimpleDialogOption(
            onPressed: () { printDoc(Options.share.name, widget.invoice); },
            child: const Text('Share'),
          ),
        ],
      );
    }
    );
      },
      child: Container(
        // autogroupnesd7VK (KxJg3Ridnr6QoEman4neSD)
        margin: EdgeInsets.fromLTRB(86.33*fem, 0*fem, 128.42*fem, 67*fem),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              // iconsaxlineardocumentdownloadE (39:570)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 8.83*fem, 0.33*fem),
              width: 33.33*fem,
              height: 33.33*fem,
              child: Image.asset(
                'assets/page-1/images/iconsax-linear-documentdownload.png',
                width: 33.33*fem,
                height: 33.33*fem,
              ),
            ),
            Text(
              // receiptuAH (39:574)
              'Receipt',
              textAlign: TextAlign.center,
              style: SafeGoogleFont (
                'Poppins',
                fontSize: 20*ffem,
                fontWeight: FontWeight.w400,
                height: 1.5*ffem/fem,
                color: const Color(0xff000000),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
