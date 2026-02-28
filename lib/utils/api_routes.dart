class ApiRoutes {


  static const String baseUrl = 'https://taskline.shehzadfarooq.com/api';


  static const String register = '$baseUrl/auth/register';
  static const String login = '$baseUrl/auth/login';

  static const String Dashboard= '$baseUrl/dashboard';
  static const String createProject = '$baseUrl/projects';
  static const String createTask = '$baseUrl/tasks';

  static const String taskDetailbyProjectId = '$baseUrl/tasks?project_id='; // Append task ID to this URL;

  static const String listAllProjects= '$baseUrl/projects';
}