class ListTaskbyid {
  final int totalTasks;
  final List<TaskItem> tasks;

  const ListTaskbyid({this.totalTasks = 0, this.tasks = const []});

  factory ListTaskbyid.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>?;
    if (data == null) {
      return const ListTaskbyid();
    }
    final rawTasks = data['tasks'] as List<dynamic>? ?? const [];
    return ListTaskbyid(
      totalTasks: data['total_tasks'] as int? ?? rawTasks.length,
      tasks: rawTasks
          .whereType<Map<String, dynamic>>()
          .map(TaskItem.fromJson)
          .toList(),
    );
  }
}

class TaskItem {
  final int id;
  final String title;
  final String? description;
  final DateTime? dueDate;
  final int? assigneeId;
  final String? assigneeName;
  final String? priority;
  final String? status;
  final bool isDone;
  final int? projectId;
  final String? projectTitle;

  const TaskItem({
    required this.id,
    required this.title,
    this.description,
    this.dueDate,
    this.assigneeId,
    this.assigneeName,
    this.priority,
    this.status,
    this.isDone = false,
    this.projectId,
    this.projectTitle,
  });

  factory TaskItem.fromJson(Map<String, dynamic> json) {
    final assigned = json['assigned_to'] as Map<String, dynamic>?;
    final project = json['project'] as Map<String, dynamic>?;
    final dueDateRaw = json['due_date'] as String?;
    DateTime? dueDate;
    if (dueDateRaw != null) {
      try {
        dueDate = DateTime.parse(dueDateRaw);
      } catch (_) {
        dueDate = null;
      }
    }

    return TaskItem(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? 'Untitled Task',
      description: json['description'] as String?,
      dueDate: dueDate,
      assigneeId: assigned?['id'] as int?,
      assigneeName: assigned?['name'] as String?,
      priority: json['priority'] as String?,
      status: json['status'] as String?,
      isDone: json['is_done'] as bool? ?? false,
      projectId: project?['id'] as int?,
      projectTitle: project?['title'] as String?,
    );
  }
}
