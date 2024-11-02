import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() async {
  try {
    var uri = Uri.parse('https://random-data-api.com/api/v2/users?size=12');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> users = convert.jsonDecode(response.body);

      users.forEach((user) {
        print('UID: ${user['uid']}, FIRST_NAME: ${user['first_name']}, LAST_NAME: ${user['last_name']}');
      });
    } else {
      print('Request failed: ${response.statusCode}');
    }
  } catch (err) {
    print('Failed http request: $err');
  }
}
