class CreateTask {
  final int? id;
  final String? title;
  final String? description;
  final int? projectId;
  final String? dueDate;
  final int? assignedTo;
  final String? priority;
  final String? status;
  final bool? isCompleted;

  CreateTask({
    this.id,
    this.title,
    this.description,
    this.projectId,
    this.dueDate,
    this.assignedTo,
    this.priority,
    this.status,
    this.isCompleted = false,
  });

  factory CreateTask.fromJson(Map<String, dynamic> json) {
    final data = json['data'];

    return CreateTask(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      projectId: data['project'] != null ? data['project']['id'] : null,
      dueDate: data['due_date'],
      assignedTo: data['assigned_to'] != null
          ? data['assigned_to']['id']
          : null,
      priority: data['priority'],
      status: data['status'],
      isCompleted: data['is_done'] ?? false,
    );
  }
}
