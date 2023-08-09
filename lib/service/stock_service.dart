import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/stock_model.dart';

class StockService {
  final String url = "https://dummyjson.com/products";

  Future<StockModel> fetchStocks() async {
    var res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      var jsonBody = StockModel.fromJson(jsonDecode(res.body));
      return jsonBody;
    } else {
      throw Exception('Failed to fetch stocks');
    }
  }
}
