import 'package:flutter/material.dart';
import 'package:quantri_app/component/button/qa_button1.dart';
import 'package:quantri_app/component/dialog/qa_dialog.dart';
import 'package:quantri_app/component/input_form/qa_dropdown_input_field.dart';
import 'package:quantri_app/component/input_form/qa_input_field.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({ Key? key }) : super(key: key);

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  // text form controller
  TextEditingController _usernameController = TextEditingController();
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
  var _provinces = ['DKI Jakarta', 'Jawa Barat', 'Jawa Timur'];
  var _cities = ['Kota Bandung', 'Kota Jakarta', 'Kabupaten Bandung'];
  var _districts = ['test1', 'test2', 'test3'];
  var _villages = ['village1', 'vilage2', 'village3'];

  bool _isSecure = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _usernameController.text = "amalkhairin";
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            showDialog(
              context: this.context,
              builder: (context) => QADialog(
                title: "Edit Profile", 
                description: "Anda belum menyimpan peribahan.\nSimpan perubahan?",
                action: [
                  QAButton1(
                    onPressed: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    label: Text("Tidak"),
                    style: QAButtonStyle.SECONDARY,
                  ),
                  QAButton1(
                    onPressed: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    label: Text("Simpan"),
                  ),
                ],
              )
            );
          },
          icon: Icon(Icons.arrow_back, color: Colors.black,),
        ),
        title: Text("Edit Profile", style: TextStyle(color: Colors.black),),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            showDialog(
              context: this.context,
              builder: (context) => QADialog(
                title: "Edit Profile", 
                description: "Anda belum menyimpan peribahan.\nSimpan perubahan?",
                action: [
                  QAButton1(
                    onPressed: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    label: Text("Tidak"),
                    style: QAButtonStyle.SECONDARY,
                  ),
                  QAButton1(
                    onPressed: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    label: Text("Simpan"),
                  ),
                ],
              )
            );
            return true;
          },
          child: Container(
            width: screenSize.width,
            height: screenSize.height,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // username field
                          Text("User Name"),
                          SizedBox(height: 8,),
                          QAInputField(
                            controller: _usernameController,
                            hintText: "User Name",
                            readOnly: true,
                          ),
                          SizedBox(height: 24,),
        
                          // full name field
                          Text("Nama Lengkap"),
                          SizedBox(height: 8,),
                          QAInputField(
                            controller: _fullNameController,
                            hintText: "Nama Lengkap",
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: 24,),
        
                          // email field
                          Text("Email"),
                          SizedBox(height: 8,),
                          QAInputField(
                            controller: _emailController,
                            hintText: "Email",
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 24,),
        
                          // phone number field
                          Text("No. HP"),
                          SizedBox(height: 8,),
                          QAInputField(
                            controller: _numberPhoneController,
                            hintText: "No. HP",
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.phone,
                          ),
                          SizedBox(height: 24,),
        
                          // address field
                          Text("Alamat"),
                          SizedBox(height: 8,),
                          QAInputField(
                            controller: _addressController,
                            hintText: "Alamat",
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: 24,),
        
                          // province dropdown input form
                          Text("Provinsi"),
                          SizedBox(height: 8,),
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
                          Text("Kota/Kabupaten"),
                          SizedBox(height: 8,),
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
                          Text("Kecamatan"),
                          SizedBox(height: 8,),
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
                          Text("Kelurahan"),
                          SizedBox(height: 8,),
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
                          SizedBox(height: 36,),
        
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
                                };
                                
                                showDialog(
                                  context: this.context,
                                  builder: (context) => QADialog(
                                    title: "Edit Profile", 
                                    description: "Apakah anda yakin?",
                                    action: [
                                      QAButton1(
                                        onPressed: (){
                                          Navigator.of(context).pop();
                                        },
                                        label: Text("Batalkan"),
                                        style: QAButtonStyle.SECONDARY,
                                      ),
                                      QAButton1(
                                        onPressed: (){
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pop();
                                        },
                                        label: Text("Oke"),
                                      ),
                                    ],
                                  )
                                );
                                
                              }
                            },
                            label: Text("Selanjutnya"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            )
          ),
        ),
      ),
    );
  }
}