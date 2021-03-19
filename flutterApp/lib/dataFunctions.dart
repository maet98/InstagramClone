import 'dart:io';

import 'package:http/http.dart' as http;

class ServiceConsoomer {
  static final ServiceConsoomer _consoomer = ServiceConsoomer._internal();
  static final String apiRoute = 'http://10.0.0.134:8000/api';
  final http.Client client = http.Client();
  factory ServiceConsoomer() {
    return _consoomer;
  }

  ServiceConsoomer._internal();

  bool RegisterUser(String user, String password, File profilePic) {
    client.post(Uri);
    return false;
  }
}
