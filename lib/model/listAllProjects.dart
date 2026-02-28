

class Listallprojects {
  final int totalprojects;
  final List<Map<String, dynamic>> projects;

  Listallprojects({
    required this.totalprojects,
    required this.projects,
  });

  factory Listallprojects.fromJson(Map<String, dynamic> json) {
    final data=json['data'] as Map<String, dynamic>? ?? {};
    return Listallprojects(
      totalprojects: data['total_projects'] as int? ?? 0,
      projects: List<Map<String, dynamic>>.from(data['projects'] as List? ?? []),
    );  
  }
}