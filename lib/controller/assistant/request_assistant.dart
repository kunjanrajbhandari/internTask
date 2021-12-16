import 'dart:convert';
import 'package:http/http.dart' as http;

class RequestAssistant{
  var decodeData;
   getrequest(String url)async{
    http.Response response = await http.get(Uri.parse(url));

    try{
      if(response.statusCode == 200){
        String jsonData = response.body;
        decodeData = jsonDecode(jsonData);
        return decodeData;
      }
      else{
        return "Failed, No Response";
      }
    }
    catch(e){
      return "Failed";
    }
  }
}