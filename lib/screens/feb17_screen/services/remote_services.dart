import 'package:http/http.dart' as http;
import 'package:project1/screens/feb17_screen/models/product_model.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<ProductInfo>?> fetchProductInfo() async {
    var response = await client.get(Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json'));

    if(response.statusCode == 200){
      return productInfoFromJson(response.body);
    } else {
      // error message
    }
  }
}