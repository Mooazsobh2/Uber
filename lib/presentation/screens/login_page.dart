
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/getx/login/login_controller.dart';
import 'package:flutter_maps/presentation/screens/registration_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../widgets/header_widget.dart';
import '../widgets/theme_helper.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  LoginController controller = Get.put(LoginController());

  double _headerHeight = 250;
  Key _formKey = GlobalKey<FormState>();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  // late AuthBloc authBloc;
  @override
  void initState() {
    controller.fetchLogin();
    // authBloc=BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final msg=Text("data");
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight,true, Icons.login_rounded,), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),// This will be the login form
                child: Column(
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Signin into your account',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 30.0),
                    _loginform()
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );

  }
  Widget _loginform(){
    return
       Form(
          key: _formKey,
          child: Column(
            children: [
              // Text("mooaz ${controller.list[0].user}"),
              Container(
                child: TextFormField(
                  controller:controller.emailController ,

                  // onChanged: (value) {
                  //   controller.email = value;
                  // },
                  decoration: ThemeHelper().textInputDecoration("E-mail address", "Enter your email"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    if(!(val!.isEmpty) && !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
                      return "Enter a valid email address";
                    }
                    return null;
                  },
                ),
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
              ),
              SizedBox(height: 30.0),
              Container(
                child: TextField(
                  controller:controller.passwordController ,
                  // onChanged: (value) {
                  //   controller.password = value;
                  // },
                  obscureText: true,
                  decoration: ThemeHelper().textInputDecoration('Password', 'Enter your password'),
                ),
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
              ),
              SizedBox(height: 15.0),
              Container(
                margin: EdgeInsets.fromLTRB(10,0,10,20),
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push( context, MaterialPageRoute( builder: (context) => ForgotPasswordPage()), );
                  },
                  child: Text( "Forgot your password?", style: TextStyle( color: Colors.grey, ),
                  ),
                ),
              ),

              Container(
                decoration: ThemeHelper().buttonBoxDecoration(context),
                child: ElevatedButton(
                  style: ThemeHelper().buttonStyle(),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                    child: Text('Sign In'.toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                  ),
                  onPressed: (){
                    controller.onClickLogin();
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10,20,10,20),
                //child: Text('Don\'t have an account? Create'),
                child: Text.rich(
                    TextSpan(
                        children: [
                          TextSpan(text: "Don\'t have an account? "),
                          TextSpan(
                            text: 'Create',
                            recognizer: TapGestureRecognizer()
                              ..onTap = (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                              },
                            style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.errorContainer),
                          ),
                        ]
                    )
                ),
              ),
            ],
          )
      );

  }

}