import 'package:flutter/material.dart';
import 'package:ladderup/models/project.dart';

class ProjectProvider extends ChangeNotifier {
  final List<Projects> _projects = [];

  // get all projects
  List<Projects> get projects => _projects;

  // add a project
  void add(Projects project) {
    _projects.add(project);
    notifyListeners();
  }

  // remove a project
  void remove(Projects project) {
    _projects.remove(project);
    notifyListeners();
  }

  // remove all projects
  void removeAll() {
    _projects.clear();
    notifyListeners();
  }
}
