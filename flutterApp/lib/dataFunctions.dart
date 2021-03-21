import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:instagramclone/entities/user.dart';

class ServiceConsoomer {
  static final ServiceConsoomer _consoomer = ServiceConsoomer._internal();
  static final String apiRoute = 'http://www.miguelestevez.xyz:8000/api';
  static final String authRoute = 'http://www.miguelestevez.xyz:8000/api-auth';
  static String authToken;
  static User loggedUser;
  final http.Client client = http.Client();
  factory ServiceConsoomer() {
    return _consoomer;
  }

  ServiceConsoomer._internal();

  Future<bool> RegisterUser(User user) async {
    var request =
        http.MultipartRequest('POST', Uri.parse(apiRoute + '/profiles'));

    request.files.add(http.MultipartFile(
        'profile_picture',
        user.profile_picture.readAsBytes().asStream(),
        user.profile_picture.lengthSync(),
        filename: user.profile_picture.path.split("/").last));

    request.fields['bio'] = user.bio;
    request.fields['user'] = jsonEncode(user.user.toMap());

    request.headers.addAll(<String, String>{
      'Accept': "*/*",
      'connection': 'keep-alive',
      'Accept-Encoding': 'gzip, deflate, br',
    });

    var res = await request.send().timeout(Duration(seconds: 5));

    return res.statusCode >= 200;
  }

  Future<bool> LoginUser(String username, String password) async {
    Map credentials = <String, String>{
      'username': username,
      'password': password
    };
    http.Response loggedIn = await client.post(
        Uri.parse(apiRoute + '/auth/token/login'),
        headers: {
          'Content-Type': 'application/json',
          'connection': 'keep-alive'
        },
        body: jsonEncode(credentials));
    if (loggedIn.statusCode != 200) {
      return false;
    }
    authToken = jsonDecode(loggedIn.body)['auth_token'];
    print(authToken);

    //TODO: get user info
  }
}
