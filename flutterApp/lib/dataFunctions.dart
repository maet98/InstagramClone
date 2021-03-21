import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:instagramclone/entities/user.dart';

class ServiceConsoomer {
  static final ServiceConsoomer _consoomer = ServiceConsoomer._internal();
  static final String apiRoute = 'http://www.miguelestevez.xyz:8000/api';
  static final String authRoute = 'http://www.miguelestevez.xyz:8000/api-auth';
  final http.Client client = http.Client();
  factory ServiceConsoomer() {
    return _consoomer;
  }

  ServiceConsoomer._internal();

  Future<bool> RegisterUser(User user) async {
    print('peep this one bruh');
    print(user.toString());

    var request =
        http.MultipartRequest('POST', Uri.parse(apiRoute + '/profiles'));
    request.files.add(http.MultipartFile(
        'profile_picture',
        user.profile_picture.readAsBytes().asStream(),
        user.profile_picture.lengthSync(),
        filename: user.profile_picture.path.split("/").last));
    request.fields['bio'] = user.bio;

    request.fields['user'] = jsonEncode(user.user.toMap());
    print(request.fields);
    var res = await request.send().timeout(Duration(seconds: 5));

    print('peep this one');
    print(res.toString());
    print(res.statusCode);

    return res != null ? res.statusCode >= 200 && res.statusCode <= 202 : false;
  }
}
