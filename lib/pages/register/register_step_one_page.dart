import 'package:flutter/material.dart';
import 'package:quantri_app/component/button/qa_button1.dart';
import 'package:quantri_app/constant/color.dart';
import 'package:quantri_app/constant/router_name.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({ Key? key }) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _numberPhoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  String? _selectedProvince;
  String? _selectedCity;
  String? _selectedDistrict;
  String? _selectedVillage;

  var _provinces = ['DKI Jakarta', 'Jawa Barat', 'Jawa Timur'];
  var _cities = ['Kota Bandung', 'Kota Jakarta', 'Kabupaten Bandung'];
  var _districts = ['test1', 'test2', 'test3'];
  var _villages = ['village1', 'vilage2', 'village3'];

  bool _isSecure = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
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
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 36,),
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
                            controller: _fullNameController,
                            textInputAction: TextInputAction.next,
                            validator: (String? value){
                              if (value!.isEmpty) {
                                return "Kolom ini tidak boleh kosong";
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "Nama Lengkap",
                              filled: true,
                              fillColor: fillColor,
                              border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          SizedBox(height: 24,),
                          TextFormField(
                            controller: _emailController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Kolom ini tidak boleh kosong";
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "Email",
                              filled: true,
                              fillColor: fillColor,
                              border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          SizedBox(height: 24,),
                          TextFormField(
                            controller: _numberPhoneController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.phone,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Kolom ini tidak boleh kosong";
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "No. HP",
                              filled: true,
                              fillColor: fillColor,
                              border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          SizedBox(height: 24,),
                          TextFormField(
                            controller: _addressController,
                            textInputAction: TextInputAction.next,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Kolom ini tidak boleh kosong";
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "Alamat",
                              filled: true,
                              fillColor: fillColor,
                              border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          SizedBox(height: 24,),
                          FormField<String>(
                            validator: (String? value) {
                              if (value == null) {
                                return "Kolom ini tidak boleh kosong";
                              }
                            },
                            builder: (FormFieldState<String> state){
                              return InputDecorator(
                                decoration: InputDecoration(
                                  errorText: state.errorText,
                                  hintText: "Provinsi",
                                  filled: true,
                                  fillColor: fillColor,
                                  border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                                ),
                                isEmpty: _selectedProvince == null,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: _selectedProvince,
                                    isDense: true,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedProvince = value;
                                        state.didChange(value);
                                      });
                                    },
                                    items: _provinces.map((String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    )).toList()
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 24,),
                          FormField<String>(
                            validator: (String? value) {
                              if (value == null) {
                                return "Kolom ini tidak boleh kosong";
                              }
                            },
                            builder: (FormFieldState<String> state){
                              return InputDecorator(
                                decoration: InputDecoration(
                                  errorText: state.errorText,
                                  hintText: "Kota/Kabupaten",
                                  filled: true,
                                  fillColor: fillColor,
                                  border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                                ),
                                isEmpty: _selectedCity == null,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: _selectedCity,
                                    isDense: true,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedCity = value;
                                        state.didChange(value);
                                      });
                                    },
                                    items: _cities.map((String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    )).toList()
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 24,),
                          FormField<String>(
                            validator: (String? value) {
                              if (value == null) {
                                return "Kolom ini tidak boleh kosong";
                              }
                            },
                            builder: (FormFieldState<String> state){
                              return InputDecorator(
                                decoration: InputDecoration(
                                  errorText: state.errorText,
                                  hintText: "Kecamatan",
                                  filled: true,
                                  fillColor: fillColor,
                                  border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                                ),
                                isEmpty: _selectedDistrict == null,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: _selectedDistrict,
                                    isDense: true,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedDistrict = value;
                                        state.didChange(value);
                                      });
                                    },
                                    items: _districts.map((String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    )).toList()
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 24,),
                          FormField<String>(
                            validator: (String? value) {
                              if (value == null){
                                return "Kolom ini tidak boleh kosong";
                              }
                            },
                            builder: (FormFieldState<String> state){
                              return InputDecorator(
                                decoration: InputDecoration(
                                  errorText: state.errorText,
                                  hintText: "Kelurahan",
                                  filled: true,
                                  fillColor: fillColor,
                                  border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                                ),
                                isEmpty: _selectedVillage == null,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: _selectedVillage,
                                    isDense: true,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedVillage = value;
                                        state.didChange(value);
                                      });
                                    },
                                    items: _villages.map((String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    )).toList()
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 24,),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _isSecure,
                            validator: (String? value) {
                              if (value!.isEmpty || value.length < 6) {
                                return "Password minimal 6 karakter";
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
                          SizedBox(height: 24,),
                          QAButton1(
                            onPressed: (){
                              print(_formKey.currentState!.validate());
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