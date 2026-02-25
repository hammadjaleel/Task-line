import 'dart:convert';
import 'package:taskline/model/create_task.dart';
import 'package:taskline/utils/api_routes.dart';
import 'package:http/http.dart' as http;

class CreateTaskServies {
  Future<CreateTask?> createTask(
    String title,
    String description,
    int projectId,
    String dueDate,
    int assignedTo,
    String priority,
    String token,
  ) async {
    final requestRoute = Uri.parse(ApiRoutes.createTask);
    final requestHeaders = {
      'Content-Type': 'application/json',
      "accept": "application/json",
      "Authorization": "Bearer $token",
    };
    final requestBody = jsonEncode({
      "title": title,
      "description": description,
      "project_id": projectId,
      "due_date": dueDate,
      "assigned_to": assignedTo,
      "priority": priority,
    });
    final response = await http.post(
      requestRoute,
      headers: requestHeaders,
      body: requestBody,
    );

    if (response.statusCode == 201) {
      // Task created successfully
      print('Task created successfully');
      final responseData = jsonDecode(response.body);
      final taskData = CreateTask.fromJson(responseData);
      return taskData;
    } else {
      // Handle error
      // You can print the error message or log it for debugging
      print('Failed to create task: ${response.statusCode}');
      print('Response body: ${response.body}');
      return null;
    }
  }
}
