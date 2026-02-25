class DummyData {
  static const String userName = 'Alex';
  static const int todayTaskCount = 5;

  // Stats for dashboard
  static final List<Map<String, dynamic>> stats = [
    {'label': 'PENDING', 'count': 12},
    {'label': 'IN PROGRESS', 'count': 5},
    {'label': 'COMPLETED', 'count': 28},
  ];

  static final List<Map<String, dynamic>> teamMembers = [
    {'id': 1, 'name': 'Alex Morgan', 'role': 'Product Lead'},
    {'id': 2, 'name': 'Priya Patel', 'role': 'UI/UX Designer'},
    {'id': 3, 'name': 'Jordan Lee', 'role': 'Flutter Developer'},
    {'id': 4, 'name': 'Samira Gomez', 'role': 'QA Lead'},
    {'id': 5, 'name': 'Noah Chen', 'role': 'Backend Engineer'},
    {'id': 6, 'name': 'Lina Torres', 'role': 'Project Manager'},
  ];

  // Projects used across app
  static final List<Map<String, dynamic>> projects = [
    {
      'title': 'Mobile App Redesign',
      'description': 'Revamp the flagship mobile experience ahead of Q4.',
      'team': [1, 2, 3],
      'progress': 0.75,
    },
    {
      'title': 'Marketing Campaign',
      'description': 'Coordinate launch content and paid media placements.',
      'team': [2, 4, 6],
      'progress': 0.30,
    },
    {
      'title': 'Brand Identity',
      'description': 'Refresh the brand visuals and messaging toolkit.',
      'team': [1, 2, 5],
      'progress': 0.90,
    },
    {
      'title': 'Data Analysis',
      'description': 'Build insights dashboard for leadership reviews.',
      'team': [3, 5],
      'progress': 0.32,
    },
    {
      'title': 'App Development',
      'description': 'Deliver MVP for the internal tasks module.',
      'team': [3, 5, 6],
      'progress': 0.92,
    },
    {
      'title': 'Video Content',
      'description': 'Produce hero spotlights for customer stories.',
      'team': [2, 4],
      'progress': 0.60,
    },
    {
      'title': 'Marketing Site',
      'description': 'Rebuild marketing site with new CMS.',
      'team': [1, 2, 3, 5],
      'progress': 0.40,
    },
    {
      'title': 'Mobile UI Redesign',
      'description': 'Finalize new UI system for Android & iOS.',
      'team': [2, 3],
      'progress': 0.75,
    },
  ];

  // Today's tasks on dashboard
  static final List<Map<String, dynamic>> todaysTasks = [
    {
      'title': 'Finalize Wireframes',
      'time': '09:00 AM - 11:00 AM',
      'done': true,
    },
    {
      'title': 'Design Review with Team',
      'time': '02:00 PM - 03:30 PM',
      'done': false,
    },
    {
      'title': 'Update Project Documentation',
      'time': '04:00 PM - 05:00 PM',
      'done': false,
    },
  ];

  static final List<Map<String, dynamic>> projectTasks = [
    {
      'id': 1,
      'title': 'User Interview Analysis',
      'dueDate': 'Due Today',
      'status': 'In Progress',
      'priority': 'High',
      'isCompleted': false,
    },
    {
      'id': 2,
      'title': 'Design System Update',
      'dueDate': 'Tomorrow',
      'status': 'Review',
      'priority': 'Medium',
      'isCompleted': false,
    },
    {
      'id': 3,
      'title': 'Dashboard QA Pass',
      'dueDate': 'Oct 27',
      'status': 'Blocked',
      'priority': 'High',
      'isCompleted': false,
    },
    {
      'id': 4,
      'title': 'Design System Update',
      'dueDate': 'Completed',
      'status': 'Done',
      'priority': 'Low',
      'isCompleted': true,
    },
  ];

  // Notifications
  static final List<Map<String, dynamic>> notificationsToday = [
    {
      'title': 'Task Assigned',
      'message': 'You were assigned to "Marketing Campaign".',
      'time': '10:24 AM',
      'unread': true,
      'icon': 0xE85D, // Icons.assignment_ind codePoint
    },
    {
      'title': 'Comment Added',
      'message': 'Alex commented on "Wireframes v2".',
      'time': '09:10 AM',
      'unread': true,
      'icon': 0xE253, // Icons.mode_comment_outlined codePoint
    },
  ];

  static final List<Map<String, dynamic>> notificationsEarlier = [
    {
      'title': 'Deadline Updated',
      'message': 'Timeline changed for "Brand Identity".',
      'time': 'Yesterday',
      'unread': false,
      'icon': 0xE878, // Icons.event codePoint
    },
    {
      'title': 'Task Completed',
      'message': '"User Research" was marked as done.',
      'time': '2 days ago',
      'unread': false,
      'icon': 0xE86C, // Icons.check_circle_outline codePoint
    },
  ];
}
