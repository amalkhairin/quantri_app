import 'package:flutter/material.dart';
import 'package:quantri_app/constant/color.dart';
import 'package:quantri_app/constant/router_name.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(fontSize: 24,)),
        titleSpacing: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, PROFILE_EDIT_ROUTE);
            },
            icon: Icon(Icons.edit, color: Colors.white),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          child: Stack(
            children: [

              // background container
              Stack(
                children: [
                  Container(
                    color: primaryColor,
                    width: screenSize.width,
                    height: screenSize.height * 0.5,
                    child: Image.asset("assets/img/pattern.png", fit: BoxFit.cover,),
                  ),
                  
                  Container(
                    width: screenSize.width,
                    height: screenSize.height * 0.3,
                    padding: EdgeInsets.all(24),
                    child: Stack(
                      children: [
                        Container(
                          height: screenSize.height * 0.2,
                          padding: EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: screenSize.width/2.4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(child: Text("Amal Khairin", maxLines: 3, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white,))),
                                    SizedBox(height: 8,),
                                    Text("085xxxxxxx", style: TextStyle(fontSize: 18, color: Colors.white),)
                                  ],
                                ),
                              ),
                              CircleAvatar(
                                radius: 42,
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.red,
                                child: Text("A", style: TextStyle(fontSize: 24)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // dashboard container
              Positioned(
                top: screenSize.height - screenSize.height / 1.4,
                bottom: MediaQuery.of(context).viewInsets.bottom,
                child: Container(
                  height: screenSize.height/1.45,
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),)
                  ),
                  child: Stack(
                    children: [
                      // profile data
                      profileData(),

                      // add inner glow to list top and bottom edge
                      Positioned(
                        top: 0,
                        child: Container(
                          height: 24,
                          width: screenSize.width,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.white, Colors.white.withOpacity(0.3) ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter
                            ),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),)
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: 42,
                          width: screenSize.width,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.white, Colors.white.withOpacity(0.3) ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget profileData(){
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Text("Username"),
                  SizedBox(height: 8,),
                  TextFormField(
                    initialValue: "amalkhrn",
                    readOnly: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: fillColor,
                      border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: 24,),
                  Text("Nama Lengkap"),
                  SizedBox(height: 8,),
                  TextFormField(
                    initialValue: "Amal Khairin",
                    readOnly: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: fillColor,
                      border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: 24,),
                  Text("Email"),
                  SizedBox(height: 8,),
                  TextFormField(
                    initialValue: "amalkhrn@gmail.com",
                    readOnly: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: fillColor,
                      border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: 24,),
                  Text("No. HP"),
                  SizedBox(height: 8,),
                  TextFormField(
                    initialValue: "08xxxxxxxx",
                    readOnly: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: fillColor,
                      border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: 24,),
                  Text("Alamat"),
                  SizedBox(height: 8,),
                  TextFormField(
                    initialValue: "Jl. Telekomunikasi no.1, Kab. Bandung",
                    readOnly: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: fillColor,
                      border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: 24,),
                  Text("Provinsi"),
                  SizedBox(height: 8,),
                  TextFormField(
                    initialValue: "Jawa Barat",
                    readOnly: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: fillColor,
                      border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: 24,),
                  Text("Kota/Kabupaten"),
                  SizedBox(height: 8,),
                  TextFormField(
                    initialValue: "Bandung",
                    readOnly: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: fillColor,
                      border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: 24,),
                  Text("Kecamatan"),
                  SizedBox(height: 8,),
                  TextFormField(
                    initialValue: "Dayeuhkolot",
                    readOnly: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: fillColor,
                      border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: 24,),
                  Text("Kelurahan"),
                  SizedBox(height: 8,),
                  TextFormField(
                    initialValue: "Sukabirus",
                    readOnly: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: fillColor,
                      border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: 24,),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

