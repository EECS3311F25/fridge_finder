import 'package:flutter/material.dart';
import '../controllers/debug_controller.dart';

class DebugView extends StatelessWidget {
  const DebugView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = DebugDatabaseController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Database Debug'),
        backgroundColor: const Color.fromRGBO(34, 171, 82, 1),
      ),
      body: FutureBuilder<Map<String, int>>(
        future: controller.getTableRowCounts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final counts = snapshot.data!;
          return ListView(
            children: counts.entries.map((e) {
              return ListTile(
                title: Text(e.key),
                trailing: Text(e.value.toString()),
                onTap: () async {
                  // Show raw rows for this table
                  final rows = await controller.getAllRows(e.key);
                  if (context.mounted) {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('Rows in ${e.key}'),
                        content: SingleChildScrollView(
                          child: Text(rows.toString()),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    );
                  }
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
