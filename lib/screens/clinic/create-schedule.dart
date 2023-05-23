import 'package:flutter/material.dart';
import '../../utils.dart';
import '../widgets/profile-avatar.dart';
import 'package:mad_cw2_vet_me/screens/widgets/text-field.dart';

import 'ClinicSchedule.dart';
import 'Test/Schdule2Dup.dart';


class CreateSchedule extends StatefulWidget {

  CreateSchedule({super.key});

  @override
  State<CreateSchedule> createState() => _CreateScheduleState();
}

class _CreateScheduleState extends State<CreateSchedule> {

  //variables
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();

  DateTime dateTime = DateTime(2023, 01, 12, 5, 30);

  bool ch1 = false;
  bool ch2 = false;

  String dropdownvalue = 'Slot 4';
  var items = [

    'Slot 4',
    'Slot 5',
  ];

  String dropdownvalue2 = 'Dr John Cena';
  var doctorsList = ['Dr John Cena', 'Dr Kumara,', 'Dr Silva'];

  String statusDropDown = 'Available';
  var statusList = ['Available', 'Booked', 'Cancelled '];


  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu)
        ),
        actions: const [
          ProfileAvatar(),
          SizedBox(width: 10.0)
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 20.0,
          ),

          Container(
            margin: EdgeInsets.fromLTRB(85*fem, 0*fem, 0*fem, 0*fem),
            child: Text(
              'Appointment',
              style: SafeGoogleFont (
                'Poppins',
                fontSize: 18*ffem,
                fontWeight: FontWeight.w600,
                color: const Color(0xff000000),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),

          Text(
            'Slot',
            style: SafeGoogleFont (
              'Poppins',
              fontSize: 18*ffem,
              color: const Color(0xff000000),
            ),
          ),
          DropdownButton(
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue){
                setState(() {
                  dropdownvalue = newValue!;
                });
              }
          ),

          const SizedBox(
            height: 20.0,
          ),

          // Text(
          //   'Time',
          //   style: SafeGoogleFont (
          //     'Poppins',
          //     fontSize: 18*ffem,
          //     color: const Color(0xff000000),
          //   ),
          // ),
          // Row(
          //   children: [
          //     Checkbox(
          //       value: ch1,
          //       onChanged: (val) {
          //         setState(() {
          //           ch1 = val!;
          //         });
          //       },
          //     ),
          //     const Text("09.00 - 12.00"),
          //   ],
          // ),
          // Row(
          //   children: [
          //     Checkbox(
          //       value: ch2,
          //       onChanged: (val) {
          //         setState(() {
          //           ch2 = val!;
          //         });
          //       },
          //     ),
          //     const Text("13.00 - 15.00"),
          //   ],
          // ),
          //
          // const SizedBox(
          //   height: 10.0,
          // ),

          Text(
            'Doctor',
            style: SafeGoogleFont (
              'Poppins',
              fontSize: 18*ffem,
              color: const Color(0xff000000),
            ),
          ),
          DropdownButton(
              value: dropdownvalue2,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: doctorsList.map((String doctorsList) {
                return DropdownMenuItem(
                  value: doctorsList ,
                  child: Text(doctorsList),
                );
              }).toList(),
              onChanged: (String? newValue2){
                setState(() {
                  dropdownvalue2 = newValue2!;
                });
              }
          ),
          const SizedBox(
            height: 10.0,
          ),


          Text(
            'Status',
            style: SafeGoogleFont (
              'Poppins',
              fontSize: 18*ffem,
              color: const Color(0xff000000),
            ),
          ),
          DropdownButton(
              value: statusDropDown,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: statusList.map((String statusList) {
                return DropdownMenuItem(
                  value: statusList,
                  child: Text(statusList),
                );
              }).toList(),
              onChanged: (String? newValue3){
                setState(() {
                  statusDropDown = newValue3!;
                });
              }
          ),
          const SizedBox(
            height: 10.0,
          ),

          Text(
            'Description',
            style: SafeGoogleFont (
              'Poppins',
              fontSize: 18*ffem,
              color: const Color(0xff000000),
            ),
          ),
          InputField(
              hintText: "Description",
              controller: _descriptionController,
              obscureText: false),
          const SizedBox(
            height: 10.0,
          ),


          Text(
            'Details',
            style: SafeGoogleFont (
              'Poppins',
              fontSize: 18*ffem,
              color: const Color(0xff000000),
            ),
          ),
          InputField(
              hintText: "Details",
              controller: _detailsController,
              obscureText: false),
          const SizedBox(
            height: 30.0,
          ),
          Text(
            'Date and Time',
            style: SafeGoogleFont (
              'Poppins',
              fontSize: 18*ffem,
              color: const Color(0xff000000),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: ElevatedButton(
                    child: Text('${dateTime.year}/${dateTime.month}/${dateTime.day}'),
                    onPressed: () async {
                      final date = await pickDate();
                      if (date == null ) return;

                      final newDateTime = DateTime(
                        date.year,
                        date.month,
                        date.day,
                        dateTime.hour,
                        dateTime.minute,
                      );
                      setState(() => dateTime = date);
                    },
                  )
              ),
              const SizedBox(width: 12),
              Expanded(
                  child: ElevatedButton(
                    child: Text('$hours:$minutes'),
                    onPressed: () async {
                      final time = await pickTime();
                      if (time == null ) return;
                      final newDateTime = DateTime(
                        dateTime.year,
                        dateTime.month,
                        dateTime.day,
                        time.hour,
                        time.minute,
                      );
                      setState(() => dateTime = newDateTime);
                    },
                  )
              ),
            ],
          ),
          const SizedBox(
            height: 30.0,
          ),
          ElevatedButton(
            style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
                textStyle: const TextStyle(fontSize: 15)),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClinicSchedule2()));
              final snackBar = SnackBar(
                content: const Text('Schedule created'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {

                  },
                ),
              );

              // Find the ScaffoldMessenger in the widget tree
              // and use it to show a SnackBar.
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: const Text('Save'),
          ),

          // TextButton(
          //     style: TextButton.styleFrom(
          //         foregroundColor: Colors.white,
          //         backgroundColor: Colors.green.shade800,
          //         textStyle: const TextStyle(fontSize: 18)),
          //     onPressed: (){},
          //     child: const Text('Save')
          // ),
          // const SizedBox(
          //   height: 30.0,
          // ),





        ],
      ),

    );
  }
  Future<DateTime?> pickDate() => showDatePicker(
    context: context,
    initialDate: dateTime,
    firstDate: DateTime(2020),
    lastDate: DateTime(2025),
  );
  Future<TimeOfDay?> pickTime() => showTimePicker(
    context: context,
    initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
  );
}