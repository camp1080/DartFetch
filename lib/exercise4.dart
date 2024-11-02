import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() async {
  try {
    // Use a valid endpoint
    var uri = Uri.parse('https://random-data-api.com/api/v2/users');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      print('Response data: $data');
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  } catch (err) {
    print('Failed http request: $err');
  }
}
