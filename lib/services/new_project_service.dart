import 'package:taskline/utils/api_routes.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



class NewProjectService {
  Future<bool> createNewProject(String title, String description, List<int> team,String token) async {
    final createProjectRoute = Uri.parse(ApiRoutes.createProject);
    final requestHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "authorization": "Bearer $token",
    };
    final requestBody = json.encode({
      "title": title,
      "description": description,
      "team": team,
    });
    final response = await http.post(
      createProjectRoute,
      headers: requestHeaders,
      body: requestBody,
    );

    if (response.statusCode == 201) {
      print("Project created successfully");
      return true;
    } else {
      // Handle error
      print("Failed to create project with status code: ${response.statusCode}");
      return false;
    }
  }
}
