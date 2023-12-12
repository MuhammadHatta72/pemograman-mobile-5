import 'package:flutter/material.dart';
import './views/plan_screen.dart';
import './views/plan_creator_screen.dart';
import './provider/plan_provider.dart';
import './models/plan.dart';

void main() => runApp(const MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Praktikum 1
    // return MaterialApp(
    //   title: 'Master Plan',
    //   theme: ThemeData(
    //     primarySwatch: Colors.lightBlue,
    //   ),
    //   home: const PlanScreen(),
    // );

    // Praktikum 2
    // return MaterialApp(
    //   theme: ThemeData(primarySwatch: Colors.lightBlue),
    //   home: PlanProvider(
    //     notifier: ValueNotifier<Plan>(const Plan()),
    //     child: const PlanScreen(),
    //   ),
    // );

    // Praktikum 3
    return PlanProvider(
      notifier: ValueNotifier<List<Plan>>(const []),
      child: MaterialApp(
        title: 'State management app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PlanCreatorScreen(),
      ),
    );
  }
}