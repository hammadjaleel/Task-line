import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskline/data/dummy_data.dart';
import 'package:taskline/model/listTaskbyid.dart';
import 'package:taskline/providers/auth_providers.dart';
import 'package:taskline/providers/list_taskbyid.dart';
import 'package:taskline/screens/newtask.dart';

class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen({super.key, this.project});

  final Map<String, dynamic>? project;

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  String? _resolveProjectId(Map<String, dynamic>? project) {
    final dynamic rawId =
        project?['id'] ??
        project?['project_id'] ??
        project?['projectId'] ??
        project?['uuid'];
    return rawId?.toString();
  }

  String _resolveProjectTitle(Map<String, dynamic>? project) {
    final dynamic rawTitle =
        project?['title'] ??
        project?['name'] ??
        project?['project_name'] ??
        project?['projectTitle'];
    if (rawTitle is String && rawTitle.trim().isNotEmpty) {
      return rawTitle;
    }
    return 'Project Details';
  }

  String _resolveProjectDescription(Map<String, dynamic>? project) {
    final dynamic rawDescription =
        project?['description'] ?? project?['details'] ?? project?['summary'];
    if (rawDescription is String && rawDescription.trim().isNotEmpty) {
      return rawDescription;
    }
    return 'Revamping the user experience for the Q4 launch including high-fidelity prototypes and developer handoff.';
  }

  List<dynamic>? _resolveTeam(Map<String, dynamic>? project) {
    final dynamic team =
        project?['team'] ?? project?['team_members'] ?? project?['members'];
    return team is List ? team : null;
  }

  String _teamSummary(List<dynamic>? ids) {
    if (ids == null || ids.isEmpty) {
      return 'No team assigned yet';
    }
    final lookup = ids.map((id) => id as int).toSet();
    final names = DummyData.teamMembers
        .where((member) => lookup.contains(member['id'] as int))
        .map((member) => member['name'] as String)
        .toList();
    if (names.isEmpty) {
      return 'No team assigned yet';
    }
    if (names.length <= 3) {
      return names.join(', ');
    }
    return '${names.take(3).join(', ')} (+${names.length - 3})';
  }

  String _formatDueDate(DateTime? dueDate) {
    if (dueDate == null) {
      return 'No due date';
    }
    final monthNames = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    final month = monthNames[dueDate.month - 1];
    return '$month ${dueDate.day}, ${dueDate.year}';
  }

  Color _statusColor(String? status, ColorScheme colors) {
    switch ((status ?? '').toLowerCase()) {
      case 'completed':
      case 'done':
        return colors.secondary;
      case 'in progress':
      case 'review':
        return colors.primary;
      case 'blocked':
        return colors.error;
      default:
        return colors.tertiary;
    }
  }

  Color _priorityColor(String? priority, ColorScheme colors) {
    switch ((priority ?? '').toLowerCase()) {
      case 'high':
        return colors.error;
      case 'medium':
        return colors.primary;
      case 'low':
        return colors.secondary;
      default:
        return colors.outline;
    }
  }

  String _priorityLabel(String? priority) {
    if (priority == null || priority.isEmpty) {
      return 'No priority';
    }
    return priority[0].toUpperCase() + priority.substring(1).toLowerCase();
  }

  Widget _buildTaskCard(TaskItem task, ThemeData theme, ColorScheme colors) {
    final statusColor = _statusColor(task.status, colors);
    final priorityColor = _priorityColor(task.priority, colors);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: colors.onSurface.withOpacity(0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      task.projectTitle ?? 'No project title',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colors.onSurface.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  (task.status ?? 'Pending').toUpperCase(),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (task.description != null && task.description!.trim().isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(task.description!, style: theme.textTheme.bodyMedium),
            ),
          Row(
            children: [
              Icon(
                Icons.schedule,
                size: 16,
                color: colors.onSurface.withOpacity(0.6),
              ),
              const SizedBox(width: 6),
              Text(
                _formatDueDate(task.dueDate),
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.person_outline,
                size: 16,
                color: colors.onSurface.withOpacity(0.6),
              ),
              const SizedBox(width: 6),
              Text(
                task.assigneeName ?? 'Unassigned',
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.flag_outlined,
                size: 16,
                color: colors.onSurface.withOpacity(0.6),
              ),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: priorityColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _priorityLabel(task.priority),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: priorityColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final auth = Provider.of<AuthProviders>(context);
    final token = auth.user!.token;
    final taskProvider = Provider.of<TaskByIdProvider>(context);
    final project = widget.project;
    final projectId = _resolveProjectId(project);
    final resolvedTitle = _resolveProjectTitle(project);
    final resolvedDescription = _resolveProjectDescription(project);
    final resolvedTeam = _teamSummary(_resolveTeam(project));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Project Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    resolvedTitle,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(resolvedDescription, style: theme.textTheme.bodyMedium),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.groups_2,
                        size: 16,
                        color: colors.onSurface.withOpacity(0.6),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          resolvedTeam,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colors.onSurface.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: colors.onSurface.withOpacity(0.6),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Due: Oct 24, 2023',
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Overview',
                      style: TextStyle(
                        color: colors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Activity', style: theme.textTheme.bodyMedium),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Files', style: theme.textTheme.bodyMedium),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            if (projectId == null)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Project ID missing. Unable to load tasks.',
                  style: theme.textTheme.bodyMedium,
                ),
              )
            else
              FutureBuilder<ListTaskbyid?>(
                future: taskProvider.fetchTaskById(projectId, token),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                  final data = snapshot.data;
                  if (data == null || data.tasks.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'No tasks yet',
                            style: theme.textTheme.titleMedium,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Create a task to get started on this project.',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: colors.onSurface.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tasks (${data.totalTasks})',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data.tasks.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final task = data.tasks[index];
                            return _buildTaskCard(task, theme, colors);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
          ],
        ),
      ),

      // Floating Buttons
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
            heroTag: 'add',
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => AddTaskScreen()));
            },
            icon: const Icon(Icons.add),
            label: const Text('Add Task'),
          ),
        ],
      ),
    );
  }
}
