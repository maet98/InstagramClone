import 'package:flutter/material.dart';

import './registerPage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
            child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/LogoCISCGris.png'),
                    fit: BoxFit.fitHeight),
              ),
            ),
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
              child: Text('Login',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            )
          ],
        )),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('¿No tienes una cuenta?'),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Text('Registrate',
                  style: TextStyle(fontWeight: FontWeight.bold)))
        ],
      ),
    );
  }
}
