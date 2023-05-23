// import 'dart:core';
// import 'dart:html';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:mad_cw2_vet_me/models/doctorModel.dart';
// import 'package:riverpod/riverpod.dart';
//
// import '../providers/loadingProvider.dart';
//
//
// final createDoctorProvider = ChangeNotifierProvider((ref) => createDoctor(ref));
//
//
// class createDoctor extends ChangeNotifier {
//   var _reader;
//
//     createDoctor(this. _reader);
//
//   Doctor initial =Doctor.empty();
//
//   String? get image => initial.image.isEmpty?null:initial.image;
//   //getter
//   bool get edit => initial.id.isNotEmpty;
//
//   String? _name;
//   String get name => _name??initial.name;
//   set name(String name) {
//     _name = name;
//     notifyListeners();
//   }
//
//   String? _service;
//
//   String get service => _service??initial.service;
//
//   set service(String service) {
//     _service = service;
//     notifyListeners();
//   }
//
//   String? _contact;
//   String get contact => _contact??initial.contact;
//   set contact(String contact) {
//     _contact = contact;
//     notifyListeners();
//   }
//
//   String? _availability;
//   String? get availability => _availability ;
//
//   set availability(String? availability) {
//     _availability = availability;
//     notifyListeners();
//   }
//   // File? _file;
//   // File? get file => _file;
//   // set file(File? file){
//   //   _file = file;
//   //   notifyListeners();
//   // }
//
//
//   Loading get _loading => _reader(loadingProvider);
//   bool get enabled => name.isNotEmpty&&service.isNotEmpty&&service.isNotEmpty&&contact.isNotEmpty;
//
//   Future<void> write() async{
//     final update = initial.copyWith(
//       name: name,
//       service: service,
//       contact: contact,
//       availability: DateTime.now(),
//
//
//     );
//   }
// }
