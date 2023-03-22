import 'package:http/http.dart' as http;
import 'package:project1/screens/feb27_screen/models/game_detail_model.dart';

class GameServices {
  static var client = http.Client();

  static Future<List<GameDetail>?> fetchGameInfo() async {
    var response = await client.get(Uri.parse('https://www.freetogame.com/api/games'));
    
    if(response.statusCode == 200){
      return gameDetailFromJson(response.body);
    } else {
      print("API Fetch Error......");
    }
    return null;
  }
}