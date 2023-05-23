// import 'dart:convert';
//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class Doctor {
//   final String id;
//   final String image;
//   final String name;
//   final String service;
//   final String contact;
//   final DateTime availability;
//
// //  contructor
//
// Doctor({
//     required this.id,
//   required this.image,
//     required this.name,
//     required this.service,
//     required this.contact,
//     required this.availability,
// });
//
// Map<String, dynamic> toMap() {
//   return {
//     'image': image,
//     'name': name,
//     'service': service,
//     'contact' : contact,
//     'availability' : Timestamp.fromDate(availability),
//   };
// }
// factory Doctor.fromFirestore(DocumentSnapshot doc){
//   final map = doc.data() as Map<String, dynamic>;
//   return Doctor(
//   id: doc.id,
//   image: map['image'] ?? '',
//   name: map['name'] ?? '',
//   service: map['service'] ?? '',
//   contact: map['contact'] ?? '',
//   availability: map['availability'].toDate(),
//   );
// }
// // to update
// Doctor copyWith (
//   {
//   String? id,
//   String? image,
//   String? name,
//   String? service,
//   String? contact,
//   DateTime? availability,
// }){
//   return Doctor(
//     id: id ?? this.id,
//     image: image ?? this.image,
//     name:  name ?? this.name,
//     service: service ?? this.service,
//     contact: contact ?? this.contact,
//     availability: availability?? this.availability,
//
//   );
// }
// factory Doctor.empty(){
//   return Doctor(id: '', image: '', name: '', service: '', contact: '', availability: DateTime.now(),
//
//   );
// }
//
//
//
//
// }
