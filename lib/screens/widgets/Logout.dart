import 'package:flutter/material.dart';
import 'package:mad_cw2_vet_me/controllers/authentication-controller.dart';

import '../authentication/LoginDup2.dart';
enum Settings{logout}

class SettingsMenu extends StatefulWidget {
  const SettingsMenu({Key? key}) : super(key: key);

  @override
  State<SettingsMenu> createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<SettingsMenu> {
  final auth = AuthenticationController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showDialog(
            context: context,
            builder: (BuildContext context) {
              return SimpleDialog(
                title: const Text('Settings'),
                children: <Widget>[
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login2()));
                    },
                    child: const Text('Logout'),
                  ),
                ],
              );
            }
        );
      },
      child: const Icon(Icons.menu),
    );
  }
}