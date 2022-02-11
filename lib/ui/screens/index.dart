import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morphosis_flutter_demo/non_ui/model/task.dart';
import 'package:morphosis_flutter_demo/non_ui/repo/firebase_manager.dart';
import 'package:morphosis_flutter_demo/ui/cubit/home_cubit.dart';
import 'package:morphosis_flutter_demo/ui/screens/home.dart';
import 'package:morphosis_flutter_demo/ui/screens/tasks.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _currentIndex = 0;

  late List<Task> tasks = [];

  @override
  void initState() {
    super.initState();

    /// TODO: Call task from firebase

    // Future.microtask(() async {
    //   final myTasks = await FirebaseManager.shared!.getTasks();
    //   setState(() {
    //     tasks = myTasks;
    //   });
    // });
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      BlocProvider(
        create: (_) => HomeCubit()..getListSong(),
        child: const HomePage(),
      ),
      TasksPage(
        title: 'All Tasks',
        tasks: FirebaseManager.shared!.tasks,
      ),
      TasksPage(
        title: 'Completed Tasks',
        tasks: FirebaseManager.shared!.tasks.where((t) => t.isCompleted).toList(),
      )
    ];

    return Scaffold(
      body: children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'All Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: 'Completed Tasks',
          ),
        ],
      ),
    );
  }
}
