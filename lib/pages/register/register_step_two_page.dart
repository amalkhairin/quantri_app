import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quantri_app/component/button/qa_button1.dart';
import 'package:quantri_app/component/form/image_input.dart';
import 'package:quantri_app/constant/color.dart';
import 'package:quantri_app/constant/router_name.dart';

class RegisterStepTwoPage extends StatefulWidget {
  final data;
  const RegisterStepTwoPage({ Key? key, this.data }) : super(key: key);

  @override
  _RegisterStepTwoPageState createState() => _RegisterStepTwoPageState();
}

class _RegisterStepTwoPageState extends State<RegisterStepTwoPage> {
  
  final _picker = ImagePicker();
  File? _closeUpImage;
  File? _ktpImage;

  Future getCloseUpImage() async {
    final PickedFile? pickedFile = await _picker.getImage(source: ImageSource.camera);
    if (pickedFile != null){
      if (mounted) {
        setState(() {
          _closeUpImage = File(pickedFile.path);
        });
      }
    }
  }

  Future getKTPImage() async {
    final PickedFile? pickedFile = await _picker.getImage(source: ImageSource.camera);
    if (pickedFile != null){
      if (mounted) {
        setState(() {
          _ktpImage = File(pickedFile.path);
        });
      }
    }
  }

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
                    child: Text("Step 2", style: TextStyle(fontSize: 18),),
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
                            color: primaryColor,
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
                    padding: const EdgeInsets.fromLTRB(24, 14, 24, 24),
                    child: Column(
                      children: [
                        QAImageInputField(
                          onPressed: () async {
                            await getCloseUpImage();
                          },
                          label: Text("Foto close up", style: TextStyle(fontSize: 18)),
                          icon: _closeUpImage != null
                          ? Image.file(_closeUpImage!, fit: BoxFit.fitHeight,)
                          : Center(
                            child: Icon(Icons.add_a_photo, size: 72, color: Colors.grey[500]),
                          ),
                        ),
                        SizedBox(height: 24,),
                        QAImageInputField(
                          onPressed: () async {
                            await getKTPImage();
                          },
                          label: Text("Foto KTP", style: TextStyle(fontSize: 18)),
                          icon: _ktpImage != null
                          ? Image.file(_ktpImage!, fit: BoxFit.fitHeight,)
                          : Center(
                            child: Icon(Icons.add_a_photo, size: 72, color: Colors.grey[500]),
                          ),
                        ),
                        SizedBox(height: 54,),
                        QAButton1(
                          onPressed: _closeUpImage == null || _ktpImage == null? (){} : (){
                            Navigator.of(context).pushNamedAndRemoveUntil(DASHBOARD_ROUTE, (route) => false);
                          },
                          label: Text("Simpan"),
                        ),
                      ],
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