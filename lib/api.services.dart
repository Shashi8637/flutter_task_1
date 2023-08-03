import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  var lessonData;
  var programData;
  Future<dynamic> getLessonData() async {
    final response = await http.get(
        Uri.parse('https://632017e19f82827dcf24a655.mockapi.io/api/lessons'));
    if (response.statusCode == 200) {
      lessonData = jsonDecode(response.body.toString());
      return lessonData;
    } else {
      print('Cannot fetch your request');
    }
  }

  Future<dynamic> getProgramData() async {
    final response = await http.get(
        Uri.parse('https://632017e19f82827dcf24a655.mockapi.io/api/programs'));
    if (response.statusCode == 200) {
      programData = jsonDecode(response.body.toString());
      return programData;
    } else {
      print('Cannot fetch your request');
    }
  }
}
