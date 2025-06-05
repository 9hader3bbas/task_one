import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_one/app/modules/dashboard/models/lead_model/lead_model.dart';

class LeadService {
  static const String baseUrl = 'https://crm.wlslabs.com/api/v1/lead';

  static Future<LeadModel?> fetchLeadDetails(int leadId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      print("=============== $token");

      if (token == null) {
        print('No token found in SharedPreferences');
        return null;
      }

      final url = Uri.parse('$baseUrl/$leadId');
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);
        log(json.encode(decoded['data']['lead']));
        log("Success of Get Data");
        if (decoded['success'] == true) {
          final leadJson = decoded['data']['lead'];
          return LeadModel.fromJson(leadJson);
        } else {
          print('API responded with success: false');
          return null;
        }
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching lead details: $e');
      return null;
    }
  }
}
