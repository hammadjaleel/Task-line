import 'dart:math';

import 'package:flutter/material.dart';
import 'package:taskline/model/create_task.dart';
import 'package:taskline/services/create_task_servies.dart';

class CreateTaskProvider extends ChangeNotifier {
  final service = CreateTaskServies();
  Future<CreateTask?> createTask(
    String title,
    String description,
    int projectId,
    String dueDate,
    int assignedTo,
    String priority,
    String token,
  ) async {
    final success = await service.createTask(
      title,
      description,
      projectId,
      dueDate,
      assignedTo,
      priority,
      token,
    );
    if (success != null) {
      print(" Notifying listeners about new task creation");
      print(" Task created successfully, notifying listeners");
      notifyListeners();
    } else {
      print("Task creation failed, not notifying listeners");
      print("Error occurred during task creation" );
    }
    return success;
  }
  
}
