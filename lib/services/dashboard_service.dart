import 'package:taskline/model/Dashboard.dart';
import 'package:taskline/utils/api_routes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DashboardService {
Future<dashboardData> fetchDashboardData(String token) async {
  final dashboardRoute = Uri.parse(ApiRoutes.Dashboard);
  final requestHeaders = {
    "Content-Type": "application/json",
    "Authorization": "Bearer $token",
  };
  final response = await http.get(
    dashboardRoute,
    headers: requestHeaders,
  );

  if (response.statusCode == 200) {
    final responseData = json.decode(response.body);
    print(responseData.toString());
    return dashboardData.fromJson(responseData['data']);
  } else {
    // Handle error
    print("Failed to fetch dashboard data with status code: ${response.statusCode}");
    throw Exception('Failed to load dashboard data');
  }
}
}