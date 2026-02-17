class CreateProjectData {
  final String title;
  final String description;
  final List<int> team;

  CreateProjectData({required this.title, required this.description, required this.team});

factory CreateProjectData.fromJson(Map<String, dynamic> json) {
    return CreateProjectData(
      title: json['title'] as String,
      description: json['description'] as String,
      team: List<int>.from(json['team'] as List<dynamic>),
    );
  } 
  }
