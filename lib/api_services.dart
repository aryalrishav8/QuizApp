import 'dart:convert';

import 'package:http/http.dart' as http;

var link = 'https://opentdb.com/api.php?amount=20&category=18&difficulty=medium';

getQuiz() async {
  var res = await http.get(Uri.parse(link));
  if (res.statusCode==200) {
    var data=jsonDecode(res.body.toString());
    print("data is loaded");
    return data;
  }
}