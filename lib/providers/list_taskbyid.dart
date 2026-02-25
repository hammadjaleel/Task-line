import 'package:flutter/material.dart';
import 'package:taskline/model/listTaskbyid.dart';
import 'package:taskline/services/listTaskbyId.dart';

class TaskByIdProvider extends ChangeNotifier {
  final service = Listtaskbyid();

  Future<ListTaskbyid?> fetchTaskById(
      String projectId,
      String token,
  ) async {
    try {
      final task =
          await service.fetchTasksbyProjectId(projectId, token);

      return task;
    } catch (e) {
      debugPrint("Error fetching task: $e");
      return null;
    }
  }
}