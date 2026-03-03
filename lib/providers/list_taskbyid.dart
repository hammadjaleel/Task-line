import 'package:flutter/material.dart';
import 'package:taskline/model/listTaskbyid.dart';
import 'package:taskline/services/listTaskbyId.dart';

class TaskByIdProvider extends ChangeNotifier {
  final service = Listtaskbyid();

  Future<bool> deletetask(int id, String token) async {
    try {
      final delete = await service.deleteTask(id, token);
      if (delete) {
        print("Task deleted by provider");
        notifyListeners();
      }
      return delete;
    } catch (e) {
      print("Failed to delete task by provider");
      return Future.error(e);
    }
  }

  Future<ListTaskbyid?> fetchTaskById(String projectId, String token) async {
    try {
      final task = await service.fetchTasksbyProjectId(projectId, token);

      return task;
    } catch (e) {
      debugPrint("Error fetching task: $e");
      return null;
    }
  }
}
