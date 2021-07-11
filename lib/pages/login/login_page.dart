import 'package:flutter/material.dart';
import 'package:quantri_app/component/button/qa_button1.dart';
import 'package:quantri_app/component/dialog/qa_dialog.dart';
import 'package:quantri_app/constant/color.dart';
import 'package:quantri_app/constant/router_name.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isSecure = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {  
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 72,),
                    Container(
                      width: 120,
                      child: Image.asset('assets/img/logo-1.5x.png', fit: BoxFit.fitWidth,),
                    ),
                    SizedBox(height: 64,),
                    TextFormField(
                      controller: _usernameController,
                      textInputAction: TextInputAction.next,
                      validator: (String? value){
                        if (value!.isEmpty) {
                          return "Kolom ini tidak boleh kosong";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "User Name",
                        filled: true,
                        fillColor: fillColor,
                        border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    SizedBox(height: 24,),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _isSecure,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Kolom ini tidak boleh kosong";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Password",
                        filled: true,
                        fillColor: fillColor,
                        suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              _isSecure = !_isSecure;
                            });
                          },
                          icon: _isSecure? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    SizedBox(height: 120,),
                    QAButton1(
                      onPressed: (){
                        if (_formKey.currentState!.validate()) {
                          print("object");
                        }
                      },
                      label: Text("Log In", style: TextStyle(fontSize: 18),),
                      style: QAButtonStyle.PRIMARY,
                    ),
                    TextButton(
                      onPressed: (){
                        
                      },
                      style: TextButton.styleFrom(
                        primary: primaryColor
                      ),
                      child: Text('Forgot Password'),
                    ),
                    SizedBox(height: 8,),
                    Container(
                      width: screenSize.width,
                      height: 1,
                      color: Color(0xFFEAEAEA),
                    ),
                    SizedBox(height: 18,),
                    QAButton1(
                      onPressed: (){
                        Navigator.of(context).pushNamed(REGISTER_ONE_ROUTE);
                      },
                      label: Text("Register", style: TextStyle(fontSize: 18),),
                      style: QAButtonStyle.SECONDARY,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}