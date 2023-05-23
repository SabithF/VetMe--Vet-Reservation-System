import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mad_cw2_vet_me/controllers/authentication-controller.dart';
import 'package:mad_cw2_vet_me/screens/authentication/registration.dart';
import 'package:mad_cw2_vet_me/screens/widgets/text-field.dart';

import '../../utils.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    AuthenticationController auth = AuthenticationController();


    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10.0,),
              Text(
                'Login',
                textAlign: TextAlign.start,
                style: SafeGoogleFont(
                  'Inter',
                  fontSize: 20 * ffem,
                  fontWeight: FontWeight.w600,
                  height: 1.2125 * ffem / fem,
                  color: const Color(0xff000000),
                ),
              ),
              const SizedBox(height: 10.0,),
              Text(
                'Hello, welcome back to our account!',
                textAlign: TextAlign.start,
                style: SafeGoogleFont(
                  'Inter',
                  fontSize: 14 * ffem,
                  fontWeight: FontWeight.w600,
                  height: 1.2125 * ffem / fem,
                  color: const Color(0xff595959),
                ),
              ),
              const SizedBox(height: 30.0,),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12.0)),
                  child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Email'),
                      ))),
              const SizedBox(height: 10.0,),
              InputField(
                  hintText: "Password",
                  controller: _passwordController,
                  obscureText: true),
              const SizedBox(height: 40.0,),
              InkWell(
                onTap: () {
                  try{
                    auth.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Welcome back to VetMe")));
                  } on FirebaseAuthException catch(error){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.message!)));
                  }
                },
                child: Container(
                  // autogroupyrimvbK (KxJZrwMJRpCK8LHMSCYrim)
                  // margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 67 * fem),
                  width: double.infinity,
                  height: 50 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15 * fem),
                    gradient: const LinearGradient(
                      begin: Alignment(-0.118, -1.684),
                      end: Alignment(-0.096, 2.702),
                      colors: <Color>[Color(0xb204097e), Color(0xb20019ff)],
                      stops: <double>[0, 1],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 14 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.2125 * ffem / fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50.0,),
              Text('------- OR -------',
                  style: SafeGoogleFont(
                    'Inter',
                    fontSize: 14 * ffem,
                    fontWeight: FontWeight.w600,
                    height: 1.2125 * ffem / fem,
                    color: const Color(0xff000000),
                  )),
              const SizedBox(height: 50.0,),
              InkWell(
                onTap: (){
                  auth.signInWithGoogle();
                },
                child: Container(
                  // autogroupfxa1sS1 (KxJa5BVu9GdfM2Ep9BfXa1)
                  // margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 35 * fem),
                  padding: EdgeInsets.fromLTRB(
                      32.25 * fem, 14.17 * fem, 123.29 * fem, 14.17 * fem),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0x60615e5e)),
                    borderRadius: BorderRadius.circular(15 * fem),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x11000000),
                        offset: Offset(0 * fem, 3 * fem),
                        blurRadius: 5 * fem,
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // flatcoloriconsgoogleguF (1:435)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 10.96 * fem, 0 * fem),
                        width: 22.5 * fem,
                        height: 21.67 * fem,
                        child: Image.asset(
                          'assets/page-1/images/flat-color-icons-google.png',
                          width: 22.5 * fem,
                          height: 21.67 * fem,
                        ),
                      ),
                      Container(
                        // loginwithgoogleMkV (1:430)
                        margin:
                            EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 1 * fem),
                        child: Text(
                          'Login with Google',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 14 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.2125 * ffem / fem,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30.0,),
              Container(
                // notregisteredyetcreateanaccoun (1:429)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 10.59 * fem, 0 * fem),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Registration()));
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 13 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.2102272327 * ffem / fem,
                        color: const Color(0xff979797),
                      ),
                      children: [
                        TextSpan(
                          text: 'Not Registered yet? ',
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 13 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.2125 * ffem / fem,
                            color: const Color(0xff979797),
                          ),
                        ),
                        TextSpan(
                          text: 'Create an Account',
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 13 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.2125 * ffem / fem,
                            color: const Color(0xffff7f0a),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30.0,),
              SizedBox(
                width: 227*fem,
                height: 80*fem,
                child: Image.asset(
                  'assets/page-1/images/logo-1.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // SizedBox(
    // width: double.infinity,
    // child: Container(
    //   // loginscreen5R3 (1:398)
    //   width: double.infinity,
    //   height: 844*fem,
    //   decoration: const BoxDecoration (
    //     color: Color(0xffffffff),
    //   ),
    //   child: Stack(
    //     children: [
    //       Positioned(
    //         // loginaccountBiy (1:365)
    //         left: 27*fem,
    //         top: 35*fem,
    //         child: Align(
    //           child: SizedBox(
    //             width: 140*fem,
    //             height: 25*fem,
    //             child: Text(
    //               'Login Account',
    //               textAlign: TextAlign.center,
    //               style: SafeGoogleFont (
    //                 'Inter',
    //                 fontSize: 20*ffem,
    //                 fontWeight: FontWeight.w600,
    //                 height: 1.2125*ffem/fem,
    //                 color: const  Color(0xff000000),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         // hellowelcomebacktoouraccountd5 (1:366)
    //         left: 26.5*fem,
    //         top: 69*fem,
    //         child: Align(
    //           child: SizedBox(
    //             width: 242*fem,
    //             height: 17*fem,
    //             child: Text(
    //               'Hello, welcome back to our account',
    //               textAlign: TextAlign.center,
    //               style: SafeGoogleFont (
    //                 'Inter',
    //                 fontSize: 14*ffem,
    //                 fontWeight: FontWeight.w600,
    //                 height: 1.2125*ffem/fem,
    //                 color: const  Color(0xff595959),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         // group29Eqf (1:392)
    //         left: 17*fem,
    //         top: 111*fem,
    //         child: Container(
    //           padding: EdgeInsets.fromLTRB(57*fem, 6*fem, 6*fem, 6*fem),
    //           width: 356*fem,
    //           height: 56*fem,
    //           decoration: BoxDecoration (
    //             color:  const  Color(0xffededed),
    //             borderRadius: BorderRadius.circular(15*fem),
    //           ),
    //           child: Row(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               Container(
    //                 // petownercrD (1:395)
    //                 margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 50*fem, 0*fem),
    //                 child: Text(
    //                   'Pet Owner',
    //                   textAlign: TextAlign.center,
    //                   style: SafeGoogleFont (
    //                     'Inter',
    //                     fontSize: 14*ffem,
    //                     fontWeight: FontWeight.w600,
    //                     height: 1.2125*ffem/fem,
    //                     color:  const  Color(0xff4f4f4f),
    //                   ),
    //                 ),
    //               ),
    //               Container(
    //                 // autogroupw4pb3wX (KxJZDCwAswW5MK54EiW4Pb)
    //                 width: 172*fem,
    //                 height: double.infinity,
    //                 decoration: BoxDecoration (
    //                   color:  const  Color(0xffffc107),
    //                   borderRadius: BorderRadius.circular(15*fem),
    //                   boxShadow: [
    //                     BoxShadow(
    //                       color: const  Color(0x3f000000),
    //                       offset: Offset(0*fem, 1*fem),
    //                       blurRadius: 3.5*fem,
    //                     ),
    //                   ],
    //                 ),
    //                 child: Center(
    //                   child: Text(
    //                     'Clinic',
    //                     textAlign: TextAlign.center,
    //                     style: SafeGoogleFont (
    //                       'Inter',
    //                       fontSize: 14*ffem,
    //                       fontWeight: FontWeight.w700,
    //                       height: 1.2125*ffem/fem,
    //                       color:  const  Color(0xff000000),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         // logo3fT7 (3:1051)
    //         left: 81*fem,
    //         top: 715*fem,
    //         child: Align(
    //           child: SizedBox(
    //             width: 227*fem,
    //             height: 80*fem,
    //             child: Image.asset(
    //               'assets/page-1/images/logo-3.png',
    //               fit: BoxFit.cover,
    //             ),
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         // group90MKw (1:440)
    //         left: 39*fem,
    //         top: 244*fem,
    //         child: Container(
    //           padding: EdgeInsets.fromLTRB(0*fem, 1.76*fem, 0*fem, 10.46*fem),
    //           width: 312.59*fem,
    //           height: 98.46*fem,
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Container(
    //                 // autogroupekarzNu (KxJZSCZX9XUZuiXxFbeKaR)
    //                 margin: EdgeInsets.fromLTRB(1.76*fem, 0*fem, 203.09*fem, 8.85*fem),
    //                 width: double.infinity,
    //                 child: Row(
    //                   crossAxisAlignment: CrossAxisAlignment.end,
    //                   children: [
    //                     Container(
    //                       // icroundalternateemail6gq (1:445)
    //                       margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 36.18*fem, 1.68*fem),
    //                       width: 17.56*fem,
    //                       height: 17.56*fem,
    //                       child: Image.asset(
    //                         'assets/page-1/images/ic-round-alternate-email.png',
    //                         width: 17.56*fem,
    //                         height: 17.56*fem,
    //                       ),
    //                     ),
    //                     Text(
    //                       // emailidBTP (1:441)
    //                       'Email ID',
    //                       textAlign: TextAlign.center,
    //                       style: SafeGoogleFont (
    //                         'Inter',
    //                         fontSize: 14*ffem,
    //                         fontWeight: FontWeight.w600,
    //                         height: 1.2125*ffem/fem,
    //                         color:  const  Color(0xff595959),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Container(
    //                 // line1hRj (1:443)
    //                 margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 38.51*fem),
    //                 width: double.infinity,
    //                 height: 1*fem,
    //                 decoration:  const  BoxDecoration (
    //                   color: Color(0xff979797),
    //                 ),
    //               ),
    //               Container(
    //                 // autogroupdtgdpFT (KxJZXs4kSjJzFnp92bdTgd)
    //                 margin: EdgeInsets.fromLTRB(4.39*fem, 0*fem, 192.09*fem, 9.46*fem),
    //                 width: double.infinity,
    //                 child: Row(
    //                   crossAxisAlignment: CrossAxisAlignment.end,
    //                   children: [
    //                     Container(
    //                       // iconparkoutlinelockoneX9s (1:447)
    //                       margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 36.82*fem, 1.07*fem),
    //                       width: 12.29*fem,
    //                       height: 17.56*fem,
    //                       child: Image.asset(
    //                         'assets/page-1/images/icon-park-outline-lock-one.png',
    //                         width: 12.29*fem,
    //                         height: 17.56*fem,
    //                       ),
    //                     ),
    //                     Text(
    //                       // passwordb9j (1:442)
    //                       'Password',
    //                       textAlign: TextAlign.center,
    //                       style: SafeGoogleFont (
    //                         'Inter',
    //                         fontSize: 14*ffem,
    //                         fontWeight: FontWeight.w600,
    //                         height: 1.2125*ffem/fem,
    //                         color:  const  Color(0xff595959),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         // group94ted (3:1074)
    //         left: 39*fem,
    //         top: 394*fem,
    //         child: Container(
    //           padding: EdgeInsets.fromLTRB(0.29*fem, 0*fem, 0*fem, 0*fem),
    //           width: 312.29*fem,
    //           height: 284*fem,
    //           decoration: BoxDecoration (
    //             borderRadius: BorderRadius.circular(15*fem),
    //           ),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               Container(
    //                 // autogroupyrimvbK (KxJZrwMJRpCK8LHMSCYrim)
    //                 margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 67*fem),
    //                 width: double.infinity,
    //                 height: 50*fem,
    //                 decoration: BoxDecoration (
    //                   borderRadius: BorderRadius.circular(15*fem),
    //                   gradient:  const  LinearGradient (
    //                     begin: Alignment(-0.118, -1.684),
    //                     end: Alignment(-0.096, 2.702),
    //                     colors: <Color>[Color(0xb204097e), Color(0xb20019ff)],
    //                     stops: <double>[0, 1],
    //                   ),
    //                 ),
    //                 child: Center(
    //                   child: Text(
    //                     'Login',
    //                     textAlign: TextAlign.center,
    //                     style: SafeGoogleFont (
    //                       'Inter',
    //                       fontSize: 14*ffem,
    //                       fontWeight: FontWeight.w600,
    //                       height: 1.2125*ffem/fem,
    //                       color:  const  Color(0xffffffff),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               Container(
    //                 // autogroupqd3xTzZ (KxJZwbtCKWeYMTDd8fqD3X)
    //                 margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 51*fem),
    //                 width: double.infinity,
    //                 child: Row(
    //                   crossAxisAlignment: CrossAxisAlignment.center,
    //                   children: [
    //                     Container(
    //                       // line4Nrd (1:434)
    //                       margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 9.21*fem, 0*fem),
    //                       width: 137*fem,
    //                       height: 1*fem,
    //                       decoration: const  BoxDecoration (
    //                         color: Color(0xffb5b5b5),
    //                       ),
    //                     ),
    //                     Container(
    //                       // orgsK (1:431)
    //                       margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10.79*fem, 0*fem),
    //                       child: Text(
    //                         'OR',
    //                         textAlign: TextAlign.center,
    //                         style: SafeGoogleFont (
    //                           'Inter',
    //                           fontSize: 12*ffem,
    //                           fontWeight: FontWeight.w600,
    //                           height: 1.2125*ffem/fem,
    //                           color: const  Color(0xff000000),
    //                         ),
    //                       ),
    //                     ),
    //                     Container(
    //                       // line3y5j (1:433)
    //                       margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
    //                       width: 137*fem,
    //                       height: 1*fem,
    //                       decoration: const  BoxDecoration (
    //                         color: Color(0xffb5b5b5),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Container(
    //                 // autogroupfxa1sS1 (KxJa5BVu9GdfM2Ep9BfXa1)
    //                 margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 35*fem),
    //                 padding: EdgeInsets.fromLTRB(32.25*fem, 14.17*fem, 123.29*fem, 14.17*fem),
    //                 width: double.infinity,
    //                 decoration: BoxDecoration (
    //                   border: Border.all(color:  const Color(0x60615e5e)),
    //                   borderRadius: BorderRadius.circular(15*fem),
    //                   boxShadow: [
    //                     BoxShadow(
    //                       color:  const  Color(0x11000000),
    //                       offset: Offset(0*fem, 3*fem),
    //                       blurRadius: 5*fem,
    //                     ),
    //                   ],
    //                 ),
    //                 child: Row(
    //                   crossAxisAlignment: CrossAxisAlignment.center,
    //                   children: [
    //                     Container(
    //                       // flatcoloriconsgoogleguF (1:435)
    //                       margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10.96*fem, 0*fem),
    //                       width: 22.5*fem,
    //                       height: 21.67*fem,
    //                       child: Image.asset(
    //                         'assets/page-1/images/flat-color-icons-google.png',
    //                         width: 22.5*fem,
    //                         height: 21.67*fem,
    //                       ),
    //                     ),
    //                     Container(
    //                       // loginwithgoogleMkV (1:430)
    //                       margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
    //                       child: Text(
    //                         'Login with Google',
    //                         textAlign: TextAlign.center,
    //                         style: SafeGoogleFont (
    //                           'Inter',
    //                           fontSize: 14*ffem,
    //                           fontWeight: FontWeight.w600,
    //                           height: 1.2125*ffem/fem,
    //                           color:  const  Color(0xff000000),
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Container(
    //                 // notregisteredyetcreateanaccoun (1:429)
    //                 margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10.59*fem, 0*fem),
    //                 child: RichText(
    //                   textAlign: TextAlign.center,
    //                   text: TextSpan(
    //                     style: SafeGoogleFont (
    //                       'Inter',
    //                       fontSize: 13*ffem,
    //                       fontWeight: FontWeight.w600,
    //                       height: 1.2102272327*ffem/fem,
    //                       color:  const Color(0xff979797),
    //                     ),
    //                     children: [
    //                       TextSpan(
    //                         text: 'Not Registered yet? ',
    //                         style: SafeGoogleFont (
    //                           'Inter',
    //                           fontSize: 13*ffem,
    //                           fontWeight: FontWeight.w600,
    //                           height: 1.2125*ffem/fem,
    //                           color:  const  Color(0xff979797),
    //                         ),
    //                       ),
    //                       TextSpan(
    //                         text: 'Create an Account',
    //                         style: SafeGoogleFont (
    //                           'Inter',
    //                           fontSize: 13*ffem,
    //                           fontWeight: FontWeight.w600,
    //                           height: 1.2125*ffem/fem,
    //                           color: const  Color(0xffff7f0a),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // ),
    //     );
  }
}
