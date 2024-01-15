import 'package:http/http.dart' as http;
//https://www.youtube.com/watch?v=jpLa3NjWqs0
const String baseUrl = 'https://65a590bc52f07a8b4a3f5b98.mockapi.io/api';

class BaseClient {
  
  var client = http.Client();
  //GET
  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl + api);
    client.get(url);

    var response = await client.get(url);
    if(response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }

  }

}