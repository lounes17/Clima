import 'dart:convert'as convert;
import 'package:http/http.dart'as http;
class NetworkHelper{
  var url;
  NetworkHelper(this.url);
Future<dynamic> getData()async{
  var response = await http.get(url);
  if (response.statusCode == 200) {
    String data= response.body;
    return convert.jsonDecode(data);
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

}