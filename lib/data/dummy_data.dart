class DummyData {
  static const String userName = 'Alex';
  static const int todayTaskCount = 5;

  // Stats for dashboard
  static final List<Map<String, dynamic>> stats = [
    {'label': 'PENDING', 'count': 12},
    {'label': 'IN PROGRESS', 'count': 5},
    {'label': 'COMPLETED', 'count': 28},
  ];

  // Projects used across app
  static final List<Map<String, dynamic>> projects = [
    {
      'title': 'Mobile App Redesign',
      'team': 'Internal Tooling',
      'progress': 0.75,
    },
    {'title': 'Marketing Campaign', 'team': 'Summer Launch', 'progress': 0.30},
    {'title': 'Brand Identity', 'team': 'Rebranding 2024', 'progress': 0.90},
    {'title': 'Data Analysis', 'team': 'Research', 'progress': 0.32},
    {'title': 'App Development', 'team': 'Engineering', 'progress': 0.92},
    {'title': 'Video Content', 'team': 'Production', 'progress': 0.60},
    {'title': 'Marketing Site', 'team': 'Marketing', 'progress': 0.40},
    {'title': 'Mobile UI Redesign', 'team': 'Design Team', 'progress': 0.75},
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
