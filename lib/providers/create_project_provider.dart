import 'package:flutter/material.dart';
import 'package:taskline/services/new_project_service.dart';

class CreateProjectProvider extends ChangeNotifier {
  final service = NewProjectService();

  Future<bool> createProject(String title, String description, List<int> team,String token) async {
    final success = await service.createNewProject(title, description, team,token);
    if (success) {
      print(" Notifying listeners about new project creation");
      notifyListeners();
    }else {
      print("Project creation failed, not notifying listeners");
    }
    return success;

  }
  notifyListeners() {
    print("Notifying listeners in CreateProjectProvider");
    super.notifyListeners();
  }
}
