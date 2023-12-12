import './task.dart';

// Praktikum 1
// class Plan {
//   final String name;
//   final List<Task> tasks;
//
//   const Plan({this.name = '', this.tasks = const []});
// }

// Praktikum 2
class Plan {
  final String name;
  final List<Task> tasks;

  const Plan({this.name = '', this.tasks = const []});

  int get completedCount => tasks.where((task) => task.complete).length;

  String get completenessMessage =>
      '$completedCount out of ${tasks.length} tasks';
}