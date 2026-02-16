class dashboardData {
  final String userName;
  final int totalTasks;
  final List<Map<String, dynamic>> stats;
  final List<Map<String, dynamic>> projects;

  dashboardData({
    required this.userName,
    required this.totalTasks,
    required this.stats,
    required this.projects,
  });

  factory dashboardData.fromJson(Map<String, dynamic> json) {
    return dashboardData(
      userName: json['user_name'] as String? ?? '',
      totalTasks: json['total_tasks'] as int? ?? 0,
      stats: List<Map<String, dynamic>>.from(json['stats'] as List? ?? []),
      projects: List<Map<String, dynamic>>.from(json['projects'] as List? ?? []),
    );
  }
}
