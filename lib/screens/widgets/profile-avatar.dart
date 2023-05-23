import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AdvancedAvatar(
      statusSize: 12,
      statusColor: Colors.green,
      image: AssetImage('assets/page-1/images/userpic.png'),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 16.0,
          ),
        ],
      ),
      size: 30.0,
    //   children: [
    //   Align(
    //   alignment: Alignment.topRight,
    //   child: Container(
    //     width: 20,
    //     height: 20,
    //     alignment: Alignment.center,
    //     decoration: BoxDecoration(
    //       border: Border.all(
    //         color: Colors.white,
    //         width: 0.5,
    //       ),
    //       color: Colors.red,
    //       shape: BoxShape.circle,
    //     ),
    //     child: const Text(
    //       '12',
    //       style: TextStyle(
    //         fontSize: 6,
    //         fontWeight: FontWeight.w500,
    //         color: Colors.white,
    //       ),
    //     ),
    //   ),
    // )]
    );
  }
}
