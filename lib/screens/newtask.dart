import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:taskline/providers/auth_providers.dart';
import 'package:taskline/providers/create_task_provider.dart';

class AddTaskScreen extends StatefulWidget {
  final Map<String, dynamic>? projectData;
  const AddTaskScreen({super.key, this.projectData});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String _selectedPriority = 'Medium';
  DateTime? _dueDate;
  bool _isSubmitting = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController descriptioncontroller = TextEditingController();
  Future<void> _pickDueDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDate ?? now,
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year + 10),
    );
    if (picked != null) {
      setState(() => _dueDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final taskprovider = Provider.of<CreateTaskProvider>(
      context,
      listen: false,
    );
    final authProvider = Provider.of<AuthProviders>(context, listen: false);
    final token = authProvider.user!.token;
    final int projectId = widget.projectData?['id'] as int? ?? 0;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leadingWidth: 90,
        leading: TextButton.icon(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.chevron_left, color: colors.primary),
          label: Text(
            'Back',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        title: Text(
          'New Task',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Discard',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onSurface.withOpacity(0.6),
              ),
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 140),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Task Title
                Text(
                  'Task Title',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colors.onSurface.withOpacity(0.6),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: titlecontroller,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a task title';
                    }
                    return null;
                  },
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    hintText: 'What needs to be done?',
                    filled: true,
                    fillColor: colors.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: colors.onSurface.withOpacity(0.1),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: colors.onSurface.withOpacity(0.1),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                /// Description
                Text(
                  'Description',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colors.onSurface.withOpacity(0.6),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: descriptioncontroller,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                  maxLines: 6,
                  decoration: InputDecoration(
                    hintText: 'Add more details about this task...',
                    filled: true,
                    fillColor: colors.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: colors.onSurface.withOpacity(0.1),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: colors.onSurface.withOpacity(0.1),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                /// Due Date
                _selectionRow(
                  context,
                  icon: Icons.calendar_today,
                  title: 'Due Date',
                  trailing: _dueDate != null
                      ? MaterialLocalizations.of(
                          context,
                        ).formatMediumDate(_dueDate!)
                      : 'Select date',
                  onTap: _pickDueDate,
                ),

                const SizedBox(height: 12),

                /// Assign To
                _selectionRow(
                  context,
                  icon: Icons.person_add,
                  title: 'Assign To',
                  trailing: 'Me',
                  showAvatar: true,
                ),

                const SizedBox(height: 24),

                /// Priority
                Text(
                  'Priority',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colors.onSurface.withOpacity(0.6),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),

                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: colors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: colors.onSurface.withOpacity(0.1),
                    ),
                  ),
                  child: Row(
                    children: [
                      _priorityChip(
                        context,
                        'Low',
                        _selectedPriority == 'Low',
                        () => setState(() => _selectedPriority = 'Low'),
                      ),
                      _priorityChip(
                        context,
                        'Medium',
                        _selectedPriority == 'Medium',
                        () => setState(() => _selectedPriority = 'Medium'),
                      ),
                      _priorityChip(
                        context,
                        'High',
                        _selectedPriority == 'High',
                        () => setState(() => _selectedPriority = 'High'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isSubmitting
                          ? null
                          : () async {
                              print("Task Title: ${titlecontroller.text}");
                              print(
                                "Description: ${descriptioncontroller.text}",
                              );
                              print("Due Date: ${_dueDate}");
                              print("Priority: $_selectedPriority");

                              if (!_formKey.currentState!.validate()) {
                                print(
                                  "Form validation failed, not creating task.",
                                );
                                return;
                              }

                              if (_dueDate == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Please select a due date before saving.',
                                    ),
                                  ),
                                );
                                return;
                              }

                              setState(() => _isSubmitting = true);

                              final dueDateFormatted = DateFormat(
                                'yyyy-MM-dd',
                              ).format(_dueDate!);
                              final priorityValue = _selectedPriority
                                  .toLowerCase();

                              try {
                                final success = await taskprovider.createTask(
                                  titlecontroller.text.trim(),
                                  descriptioncontroller.text.trim(),
                                  projectId,
                                  dueDateFormatted,
                                  1,
                                  priorityValue,
                                  token,
                                );

                                if (!mounted) {
                                  return;
                                }

                                if (success != null) {
                                  print(
                                    "Task created successfully, closing screen...",
                                  );
                                  Navigator.pop(context);
                                } else {
                                  print(
                                    "Task creation failed, showing error...",
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Failed to create task. Please try again.',
                                      ),
                                    ),
                                  );
                                }
                              } finally {
                                if (mounted) {
                                  setState(() => _isSubmitting = false);
                                }
                              }
                            },
                      child: _isSubmitting
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation(
                                      colors.onPrimary,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text('Saving...'),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.check_circle),
                                SizedBox(width: 8),
                                Text('Save Task'),
                              ],
                            ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      /// Bottom Save Button
    );
  }

  /// Selection Row
  Widget _selectionRow(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String trailing,
    bool showAvatar = false,
    VoidCallback? onTap,
  }) {
    final colors = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: colors.onSurface.withOpacity(0.1)),
          ),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: colors.primary.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: colors.primary),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              if (showAvatar)
                CircleAvatar(
                  radius: 14,
                  backgroundColor: colors.primary,
                  child: const Text(
                    'ME',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              const SizedBox(width: 8),
              Text(
                trailing,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colors.onSurface.withOpacity(0.6),
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.chevron_right,
                color: colors.onSurface.withOpacity(0.4),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Priority Chip
  Widget _priorityChip(
    BuildContext context,
    String label,
    bool active,
    VoidCallback onTap,
  ) {
    final colors = Theme.of(context).colorScheme;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: active ? colors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: active
                  ? colors.onPrimary
                  : colors.onSurface.withOpacity(0.6),
            ),
          ),
        ),
      ),
    );
  }
}
