import 'package:taskline/model/listTaskbyid.dart';
import 'package:taskline/utils/api_routes.dart';
import 'package:http/http.dart' as http;
import  'dart:convert';

class Listtaskbyid {

  Future<ListTaskbyid?> fetchTasksbyProjectId (String ProjectID, String token) async {
    String url = ApiRoutes.taskDetailbyProjectId + ProjectID;
    Uri uri = Uri.parse(url);

    final requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final response = await http.get(uri, headers: requestHeaders);

    if (response.statusCode == 200) {
      // Successfully fetched tasks
      print('Tasks fetched successfully');
      print('Response body: ${response.body}');
      final responceData = json.decode(response.body);
      return ListTaskbyid.fromJson(responceData);
      
    } else {
      // Handle error
      print('Failed to fetch tasks: ${response.statusCode}');
      print('Response body: ${response.body}');
    }

  }
  
}