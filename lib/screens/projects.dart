import 'package:flutter/material.dart';
import 'package:taskline/data/dummy_data.dart';
import 'package:taskline/screens/details_screens/project_details.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 90,
        titleSpacing: 16,
        title: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.primary.withOpacity(0.2),
                border: Border.all(color: colors.primary.withOpacity(0.4)),
              ),
              child: Icon(Icons.account_circle, color: colors.primary),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'All Projects',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${DummyData.projects.length} Active Projects',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colors.onSurface.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          const SizedBox(width: 8),
        ],
      ),

      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: colors.surface.withOpacity(0.8),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: colors.onSurface.withOpacity(0.1)),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  Icon(Icons.search, color: colors.onSurface.withOpacity(0.6)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search projects...',
                        hintStyle: TextStyle(
                          color: colors.onSurface.withOpacity(0.6),
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(color: colors.onSurface),
                    ),
                  ),
                  Icon(Icons.tune, color: colors.onSurface.withOpacity(0.6)),
                  const SizedBox(width: 12),
                ],
              ),
            ),
          ),

          // Tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                for (final tab in ['All', 'Active', 'Completed'])
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Column(
                      children: [
                        Text(
                          tab,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: tab == 'All'
                                ? colors.onSurface
                                : colors.onSurface.withOpacity(0.6),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          height: 2,
                          width: 32,
                          color: tab == 'All'
                              ? colors.primary
                              : Colors.transparent,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Grid
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 120),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.78,
              children: [
                for (final project in DummyData.projects)
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) =>
                              ProjectDetailsScreen(project: project),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: colors.surface.withOpacity(0.6),
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
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: colors.primary,
                                ),
                                child: const Icon(
                                  Icons.work_outline,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.more_horiz,
                                color: colors.onSurface.withOpacity(0.6),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            project['title'] as String,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            project['team'] as String,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colors.onSurface.withOpacity(0.6),
                              letterSpacing: 1,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Progress',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: colors.onSurface.withOpacity(0.6),
                                ),
                              ),
                              Text(
                                '${((project['progress'] as double) * 100).toInt()}%',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: LinearProgressIndicator(
                              value: project['progress'] as double,
                              minHeight: 5,
                              backgroundColor: colors.onSurface.withOpacity(
                                0.1,
                              ),
                              valueColor: AlwaysStoppedAnimation(
                                colors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}
