import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  File profileImage;
  String imagePath;
  ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    downloadImage();
  }

  Future getImage(bool camera) async {
    PickedFile _image = await _picker.getImage(
        source: camera ? ImageSource.camera : ImageSource.gallery,
        maxWidth: 500,
        maxHeight: 500);
    setState(() {
      imagePath = _image.path.toString();
      profileImage = File(_image.path);
      print('Select image path' + _image.path.toString());
    });
  }

  Future downloadImage() async {
    if (imagePath != null) {
      var image = new File(imagePath);
      setState(() {
        profileImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: profileImage == null
                                ? NetworkImage(
                                    "https://smartprofile.io/wp-content/uploads/2017/04/Placeholder.png")
                                : FileImage(profileImage),
                            fit: BoxFit.fill)),
                  ),
              Row(
                
              ),
              Column(children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    validator: (username) {
                      if (username.isEmpty) {
                        return 'Digite un usuario';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    validator: (password) {
                      if (password.isEmpty) {
                        return 'Digite una contraseña';
                      }
                      if (password.length < 8) {
                        return 'La contraseña debe tener 8 o más caracteres';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    validator: (password) {
                      if (password.isEmpty) {
                        return 'Digite una contraseña';
                      }
                      if (password.length < 8) {
                        return 'La contraseña debe tener 8 o más caracteres';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm password',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
              ]),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.8, 40),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    primary: Colors.lightBlue),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Cool')));
                  }
                },
                child: Text('Register',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              )
            ])),
      ),
    );
  }
}
