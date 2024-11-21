import 'package:flutter/material.dart';
import 'package:ladderup/models/project.dart';
import 'package:ladderup/providers/project_provider.dart';
import 'package:ladderup/widgets/custom_add_button.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final projectProvider = Provider.of<ProjectProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              // My Projects + add boutton
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'My Projects',
                    style: TextStyle(fontSize: 20),
                  ),
                  CustomAddButton(
                    onTap: () {
                      _showAddProjectDialog(context, projectProvider);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // projects tiles
              Expanded(
                child: projectProvider.projects.isEmpty
                    ? const Center(
                        child: Text(
                          'No projects yet. Tap + to add your first project.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: projectProvider.projects.length,
                        itemBuilder: (context, index) {
                          final project = projectProvider.projects[index];
                          return ListTile(
                            title: Text(project.name),
                            subtitle: Text(project.description),
                          );
                        },
                      ),

                // Today's Task + add boutton
                // tasks tiles
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAddProjectDialog(
      BuildContext context, ProjectProvider projectProvider) {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Project'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Project Name',
                ),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text.trim();
                final description = descriptionController.text.trim();

                if (name.isNotEmpty && description.isNotEmpty) {
                  projectProvider.add(
                    Projects(name: name, description: description),
                  );
                  Navigator.of(context).pop();
                } else {
                  // Optionally show a snackbar or alert for empty input
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please fill in all fields'),
                    ),
                  );
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
