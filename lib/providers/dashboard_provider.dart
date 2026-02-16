import 'package:flutter/material.dart';
import 'package:taskline/model/Dashboard.dart';
import 'package:taskline/services/dashboard_service.dart';

class DashboardProvider extends ChangeNotifier{
  final DashboardService _dashboardService = DashboardService();
  Future<dashboardData> fetchDashboardData(String token) async {
    try {
      final dashboardData = await _dashboardService.fetchDashboardData(token);
      print("Dashboard data fetched successfully: ${dashboardData.toString()}");
      print("Dashboard data fetched successfully");
      return dashboardData;
    } catch (e) {
      print("Error fetching dashboard data: $e");
      return Future.error(e);
    }
  }
}