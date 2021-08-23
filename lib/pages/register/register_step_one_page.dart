import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quantri_app/component/button/qa_button1.dart';
import 'package:quantri_app/component/input_form/qa_dropdown_input_field.dart';
import 'package:quantri_app/component/input_form/qa_input_field.dart';
import 'package:quantri_app/constant/color.dart';
import 'package:quantri_app/constant/router_name.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({ Key? key }) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text form controller
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _numberPhoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  // saving text dropdown value
  String? _selectedProvince;
  String? _selectedCity;
  String? _selectedDistrict;
  String? _selectedVillage;

  // dropdown input value
  List<String> _provinces = [];
  List<String> _cities = [];
  List<String> _districts = [];
  List<String> _villages = [];

  bool _isSecure = true;
  final _formKey = GlobalKey<FormState>();

  Future<void> _loadJsonAssets() async {
    List _tempVillages = [];
    List _tempDistricts = [];
    List _tempCities = [];
    List _tempProvinces = [];
    var jsonVillages = await rootBundle.loadString("assets/json/desa.json");
    var jsonDistricts = await rootBundle.loadString("assets/json/desa.json");
    var jsonCities = await rootBundle.loadString("assets/json/desa.json");
    var jsonProvinces = await rootBundle.loadString("assets/json/desa.json");
    _tempVillages = jsonDecode(jsonVillages);
    _tempDistricts = jsonDecode(jsonDistricts);
    _tempCities = jsonDecode(jsonCities);
    _tempProvinces =  jsonDecode(jsonProvinces);
    _tempVillages.shuffle();
    _tempDistricts.shuffle();
    _tempCities.shuffle();
    _tempProvinces.shuffle();

    setState(() {
      _provinces = _tempProvinces.sublist(0, 10).cast<String>();
      _cities = _tempCities.sublist(0, 10).cast<String>();
      _districts = _tempDistricts.sublist(0, 10).cast<String>();
      _villages = _tempVillages.sublist(0, 10).cast<String>();
    });
    
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadJsonAssets();
  }

  @override
  Widget build(BuildContext context) {
    // get app screen size
    Size screenSize = MediaQuery.of(context).size;

    // body
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      // app bar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_rounded, color: Colors.black87,),
        ),
        title: Text("Registrasi Pengguna", style: TextStyle(fontSize: 24, color: Colors.black87),),
      ),
      
      body: SafeArea(
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          child: Column(
            children: [
              
              // progress bar
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: Text("Step 1", style: TextStyle(fontSize: 18),),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 6,
                          width: screenSize.width/2.4,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Container(
                          height: 6,
                          width: screenSize.width / 2.4,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8,),

              // form
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 36,),

                          // username input form
                          QAInputField(
                            controller: _usernameController,
                            hintText: "User Name",
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: 24,),

                          // full name input form
                          QAInputField(
                            controller: _fullNameController,
                            hintText: "Nama Lengkap",
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: 24,),

                          // email input form
                          QAInputField(
                            controller: _emailController,
                            hintText: "Email",
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 24,),

                          // phone number input form
                          QAInputField(
                            controller: _numberPhoneController,
                            hintText: "No. HP",
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.phone,
                          ),
                          SizedBox(height: 24,),

                          // address input form
                          QAInputField(
                            controller: _addressController,
                            hintText: "Alamat",
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: 24,),

                          // province dropdown input form
                          QADropdownInputField(
                            value: _selectedProvince,
                            items: _provinces,
                            hintText: "Provinsi",
                            onChanged: (String? value) {
                              setState(() {
                                _selectedProvince = value;
                              });
                            },
                          ),
                          SizedBox(height: 24,),

                          // city dropdown input form
                          QADropdownInputField(
                            value: _selectedCity,
                            items: _cities,
                            hintText: "Kota/Kabupaten",
                            onChanged: (String? value) {
                              setState(() {
                                _selectedCity = value;
                              });
                            },
                          ),
                          SizedBox(height: 24,),

                          // districts dropdown input form
                          QADropdownInputField(
                            value: _selectedDistrict,
                            items: _districts,
                            hintText: "Kecamatan",
                            onChanged: (String? value) {
                              setState(() {
                                _selectedDistrict = value;
                              });
                            },
                          ),
                          SizedBox(height: 24,),

                          // villages dropdown input form
                          QADropdownInputField(
                            value: _selectedVillage,
                            items: _villages,
                            hintText: "Kelurahan",
                            onChanged: (String? value) {
                              setState(() {
                                _selectedVillage = value;
                              });
                            },
                          ),
                          SizedBox(height: 24,),

                          // password input form
                          QAInputField(
                            controller: _passwordController,
                            obsecureText: _isSecure,
                            hintText: "Password",
                            keyboardType: TextInputType.visiblePassword,
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  _isSecure = !_isSecure;
                                });
                              },
                              icon: _isSecure? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                            ),
                          ),
                          SizedBox(height: 24,),

                          // next button
                          QAButton1(
                            onPressed: (){

                              // validate input form
                              if (_formKey.currentState!.validate()){
                                Map<String, dynamic> _data = {
                                  "user_name": _usernameController.text,
                                  "full_name": _fullNameController.text,
                                  "email": _emailController.text,
                                  "number_phone": _numberPhoneController.text,
                                  "address": _addressController.text,
                                  "province": _selectedProvince,
                                  "city": _selectedCity,
                                  "district": _selectedDistrict,
                                  "village": _selectedVillage,
                                  "password": _passwordController.text
                                };

                                // navigate to dashboard page
                                Navigator.of(context).pushReplacementNamed(REGISTER_TWO_ROUTE, arguments: _data);
                              }
                            },
                            label: Text("Selanjutnya"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}