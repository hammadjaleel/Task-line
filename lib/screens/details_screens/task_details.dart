import 'package:flutter/material.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key, this.task});

  final Map<String, dynamic>? task;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Task Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {}),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 180),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Priority
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: colors.error.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'High Priority',
                style: TextStyle(
                  color: colors.error,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Title
            Text(
              (task != null && (task!['title'] as String?) != null)
                  ? task!['title'] as String
                  : 'Task Details',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // Description
            Text(
              'Update the color palette, typography, and logo usage guidelines for the 2024 rebrand. Ensure all stakeholders are aligned before final sign-off.',
              style: theme.textTheme.bodyMedium,
            ),

            const SizedBox(height: 24),

            // Info grid
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'DUE DATE',
                          style: theme.textTheme.bodySmall?.copyWith(
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 16,
                              color: colors.primary,
                            ),
                            const SizedBox(width: 6),
                            const Text('Oct 24, 2023'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ASSIGNED TO',
                          style: theme.textTheme.bodySmall?.copyWith(
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: colors.primary,
                              child: const Text(
                                'AR',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text('Alex Rivera'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Subtasks header
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text(
            //             'SUBTASKS',
            //             style: theme.textTheme.bodySmall
            //                 ?.copyWith(letterSpacing: 1),
            //           ),
            //           Text(
            //             '2/4',
            //             style: TextStyle(color: colors.primary),
            //           ),
            //         ],
            //       ),

            //       const SizedBox(height: 12),

            //       // Subtask items
            //       ...[
            //         {'title': 'Define primary palette', 'done': true},
            //         {'title': 'Select display fonts', 'done': true},
            //         {'title': 'Logo spacing rules', 'done': false},
            //         {'title': 'Export assets for dev team', 'done': false},
            //       ].map(
            //         (task) => Container(
            //           margin: const EdgeInsets.only(bottom: 10),
            //           padding: const EdgeInsets.all(16),
            //           decoration: BoxDecoration(
            //             color: theme.cardColor,
            //             borderRadius: BorderRadius.circular(12),
            //           ),
            //           child: Row(
            //             children: [
            //               Container(
            //                 height: 22,
            //                 width: 22,
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(6),
            //                   color:
            //                       task['done'] as bool ? colors.primary : null,
            //                   border: Border.all(
            //                     color: colors.onSurface.withOpacity(0.3),
            //                   ),
            //                 ),
            //                 child: task['done'] as bool
            //                     ? const Icon(Icons.check,
            //                         size: 16, color: Colors.white)
            //                     : null,
            //               ),
            //               const SizedBox(width: 12),
            //               Expanded(
            //                 child: Text(
            //                   task['title'] as String,
            //                   style: TextStyle(
            //                     decoration: task['done'] as bool
            //                         ? TextDecoration.lineThrough
            //                         : null,
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),

            //       const SizedBox(height: 32),

            //       // Comments
            //       Text(
            //         'COMMENTS',
            //         style: theme.textTheme.bodySmall
            //             ?.copyWith(letterSpacing: 1),
            //       ),

            //       const SizedBox(height: 16),

            //       // Comment 1
            //       Row(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           const CircleAvatar(
            //             radius: 16,
            //             child: Text('JD', style: TextStyle(fontSize: 10)),
            //           ),
            //           const SizedBox(width: 8),
            //           Expanded(
            //             child: Container(
            //               padding: const EdgeInsets.all(12),
            //               decoration: BoxDecoration(
            //                 color: theme.cardColor,
            //                 borderRadius: BorderRadius.circular(12),
            //               ),
            //               child: const Text(
            //                 'The current typography feels a bit too condensed. Can we try Inter?',
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),

            //       const SizedBox(height: 12),

            //       // Comment 2 (own)
            //       Row(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         children: [
            //           Expanded(
            //             child: Container(
            //               padding: const EdgeInsets.all(12),
            //               decoration: BoxDecoration(
            //                 color: colors.primary.withOpacity(0.15),
            //                 borderRadius: BorderRadius.circular(12),
            //               ),
            //               child: const Text(
            //                 'Agreed. I\'ve switched the display fonts to Inter Tight.',
            //               ),
            //             ),
            //           ),
            //           const SizedBox(width: 8),
            //           CircleAvatar(
            //             radius: 16,
            //             backgroundColor: colors.primary,
            //             child: const Text('AR', style: TextStyle(fontSize: 10)),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),

            // Bottom actions
            // bottomSheet: Container(
            //   padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            //   decoration: BoxDecoration(
            //     color: theme.scaffoldBackgroundColor,
            //   ),
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       TextField(
            //         decoration: InputDecoration(
            //           hintText: 'Write a comment...',
            //           filled: true,
            //           fillColor: theme.cardColor,
            //           suffixIcon: IconButton(
            //             icon: const Icon(Icons.send),
            //             onPressed: () {},
            //           ),
            //           border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(12),
            //             borderSide: BorderSide.none,
            //           ),
            //         ),
            //       ),
            //       const SizedBox(height: 12),
            //       Row(
            //         children: [
            //           Expanded(
            //             child: ElevatedButton(
            //               onPressed: () {},
            //               child: const Text('Mark Complete'),
            //             ),
            //           ),
            //           const SizedBox(width: 8),
            //           IconButton(
            //             onPressed: () {},
            //             icon: const Icon(Icons.edit),
            //           ),
            //           IconButton(
            //             onPressed: () {},
            //             icon: Icon(Icons.delete, color: colors.error),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
