import 'package:flutter/material.dart';
import 'package:taskline/data/dummy_data.dart';

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({super.key});

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _teamController = TextEditingController();
  double _progress = 0.0;

  @override
  void dispose() {
    _titleController.dispose();
    _teamController.dispose();
    super.dispose();
  }

  void _saveProject() {
    if (_formKey.currentState?.validate() != true) return;

    final project = {
      'title': _titleController.text.trim(),
      'team': _teamController.text.trim().isEmpty
          ? 'General'
          : _teamController.text.trim(),
      'progress': _progress,
    };

    DummyData.projects.add(project);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Project added')));

    Navigator.pop(context);
  }

  void _discardInputs() {
    final hadData =
        _titleController.text.isNotEmpty ||
        _teamController.text.isNotEmpty ||
        _progress != 0.0;
    setState(() {
      _titleController.clear();
      _teamController.clear();
      _progress = 0.0;
    });
    if (hadData) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Cleared form data')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leadingWidth: 90,

        title: Text(
          'New Project',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton(
            onPressed: _discardInputs,
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
                // Project Title
                Text(
                  'Project Title',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colors.onSurface.withOpacity(0.6),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _titleController,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    hintText: 'e.g., Mobile App Redesign',
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
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) {
                      return 'Please enter a project title';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 24),

                // Team
                Text(
                  'Team',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colors.onSurface.withOpacity(0.6),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _teamController,
                  decoration: InputDecoration(
                    hintText: 'e.g., Design Team',
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

                // Progress
                Text(
                  'Initial Progress',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colors.onSurface.withOpacity(0.6),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: colors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: colors.onSurface.withOpacity(0.1),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Progress',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text('${(_progress * 100).round()}%'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Slider(
                        value: _progress,
                        min: 0,
                        max: 1,
                        divisions: 20,
                        label: '${(_progress * 100).round()}%',
                        onChanged: (v) => setState(() => _progress = v),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // Save button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: _saveProject,
            icon: const Icon(Icons.check_circle),
            label: const Text('Save Project'),
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
    );
  }
}
