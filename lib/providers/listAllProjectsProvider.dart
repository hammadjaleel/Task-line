import 'package:flutter/material.dart';
import 'package:taskline/model/listAllProjects.dart';
import 'package:taskline/services/listAllProjectsService.dart';

class Listallprojectsprovider extends ChangeNotifier {

  final service = Listallprojectsservice();

  Future<Listallprojects?> fetchAllProjects(String token) async {
    try {
      final result = await service.fetchAllProjects(token);
      print("Projects are in provider");
      print("projects fetched successfully: ${result.toString()}");
      return result;
    } catch (e) {
      print("Error fetching projects: $e");
      return Future.error(e);
    }
  }

  Future<bool> deleteProject(String token, int projectId) async {
    try {
      final result = await service.deleteProject(token, projectId);
      return result;
    } catch (e) {
      print("Error deleting project: $e");
      return Future.error(e);
    }
  }
}