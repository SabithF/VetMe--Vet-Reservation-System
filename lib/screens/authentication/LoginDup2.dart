import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mad_cw2_vet_me/controllers/authentication-controller.dart';
import 'package:mad_cw2_vet_me/screens/Clinic/ClinciDB.dart';
import 'package:mad_cw2_vet_me/screens/widgets/text-field.dart';

import '../../utils.dart';

class Login2 extends StatefulWidget {
  const Login2({Key? key}) : super(key: key);

  @override
  State<Login2> createState() => _LoginState();
}

class _LoginState extends State<Login2> {
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  ClinicDb(),));
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
                  onTap: (){},
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


  }
}
