import 'package:flutter/material.dart';
import 'package:taskline/data/dummy_data.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final today = DummyData.notificationsToday;
    final earlier = DummyData.notificationsEarlier;

    Widget sectionHeader(String label) => Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        label,
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    Widget item(Map n) {
      final bool unread = (n['unread'] as bool?) ?? false;
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colors.onSurface.withOpacity(0.08)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: colors.primary.withOpacity(0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                IconData(
                  (n['icon'] as int?) ?? Icons.notifications.codePoint,
                  fontFamily: 'MaterialIcons',
                ),
                color: colors.primary,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          n['title'] as String? ?? 'Notification',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      if (unread)
                        Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            color: colors.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    n['message'] as String? ?? '',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colors.onSurface.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    n['time'] as String? ?? '',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colors.onSurface.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 4),
            Icon(Icons.more_vert, color: colors.onSurface.withOpacity(0.6)),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Mark all read',
            icon: const Icon(Icons.done_all),
            onPressed: () {
              // This is a placeholder for future state handling
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('All notifications marked read')),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          sectionHeader('Today'),
          for (final n in today) item(n),
          sectionHeader('Earlier'),
          for (final n in earlier) item(n),
        ],
      ),
    );
  }
}
