import 'package:flutter/material.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';



class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  late SingleValueDropDownController _cnt;
  late MultiValueDropDownController _cntMulti;
  
  @override
  void dispose(){
    _cnt.dispose();
    _cntMulti.dispose();
    super.dispose();
    
  }
  Widget build(BuildContext context) {
    return Form(
     key: _formKey,
     child: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 20),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           DropDownTextField(
             controller: _cnt,
         clearOption: true,
         enableSearch: true,
         clearIconProperty: IconProperty(color: Colors.green),
         searchDecoration: const InputDecoration(
           hintText: "Search your pet..."),
               validator: (value){
             if(value==null){
               return "Required field";
             }else{
               return null;
             }
       },
         dropDownItemCount: 5,
         
         dropDownList: [
           DropDownValueModel(name: 'Pet Name 1', value: 'value 1'),
           DropDownValueModel(
               name: 'Pet 2',
               value: 'Value 2',
           toolTipMsg: 'tool tip msg'),
           DropDownValueModel(name: 'Pet Name 3', value: 'value 2'),
           DropDownValueModel(name: 'Pet Name 4', value: 'value 4'),
           DropDownValueModel(name: 'Pet Name 5', value: 'value 5'),
         ],
         onChanged: (val) {},
       
         ),
       
       


         ],
       ),
       ),

    );
  }
}


