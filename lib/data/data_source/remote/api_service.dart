import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../model/product_model.dart';

class ApiService {

  final String baseUrl = 'https://www.stockaxis.com/webservices/android/index.aspx?action=search&activity=PricingV2&CID=984493&PKGName';

  // GET request for Little Master Api
  Future<ProductModel> getLittleMasterApi() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl=LM'));
      if (response.statusCode == 200) {
        final jsonString = response.body.replaceFirst(RegExp(r'<!DOCTYPE[\s\S]*'), '');
        return littleMastersModelFromJson(jsonString);
      } else {
        throw Exception('Failed to load Little Masters API');
      }
    } catch (e) {
      throw Exception('An error occurred while fetching data');
    }
  }

  // GET request for Emerging Market Leaders Api
  Future<ProductModel> getEmergingMarKetApi() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl=EML'));
      if (response.statusCode == 200) {
        final jsonString = response.body.replaceFirst(RegExp(r'<!DOCTYPE[\s\S]*'), '');
        return littleMastersModelFromJson(jsonString);
      } else {
        throw Exception('Failed to load Emerging Market API');
      }
    } catch (e) {
      throw Exception('An error occurred while fetching data');
    }
  }

  // GET request for Large Cap Focus Leaders Api
  Future<ProductModel> getLargeCapFocusApi() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl=LCF'));
      if (response.statusCode == 200) {
        final jsonString = response.body.replaceFirst(RegExp(r'<!DOCTYPE[\s\S]*'), '');
        return littleMastersModelFromJson(jsonString);
      } else {
        throw Exception('Failed to load Large Cap Focus API');
      }
    } catch (e) {
      throw Exception('An error occurred while fetching data');
    }
  }

}
