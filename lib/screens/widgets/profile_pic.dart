import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  File? _image;

  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }
  final _picker1 = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker1() async {
    final XFile? pickedImage1 =
    await _picker1.pickImage(source: ImageSource.camera);
    if (pickedImage1 != null) {
      setState(() {
        _image = File(pickedImage1.path);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return imageProfile();
    // return Scaffold(
    //   body: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    //     child: ListView(
    //       children: <Widget>[
    //         imageProfile(),
    //       ],
    //     ),
    //   ),
    // );
  }
  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 65.0,
            backgroundColor: Colors.teal,
            child: _image != null
                ? new CircleAvatar(backgroundImage: new FileImage(_image!), radius: 100.0,)
            //Image.file(_image!)
                : const Text('Select an image'),
          ),
          Positioned(
            bottom: 10.0,
            right: 10.0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet()),
                );
              },
              child: CircleAvatar(
                radius: 15.0,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 25.0,
                ),
              ),

            ),
          ),
        ],
      ),
    );
  }

  Widget bottomSheet(){
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(children: <Widget>[
        Text(
          "Choose Display Picture",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.camera),
              onPressed: _openImagePicker1,
              label: Text("Camera"),
            ),
            TextButton.icon(
              icon: Icon(Icons.camera),
              onPressed: _openImagePicker,
              label: Text("Gallery"),
            ),
          ],
        )
      ],
      ),
    );
  }



}