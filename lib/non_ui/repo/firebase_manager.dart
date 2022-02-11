import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:morphosis_flutter_demo/core/error/exceptions.dart';
import 'package:morphosis_flutter_demo/non_ui/model/task.dart';

class FirebaseManager {
  static FirebaseManager? _one;

  static FirebaseManager? get shared =>
      (_one == null ? (_one = FirebaseManager._()) : _one);
  FirebaseManager._();

  Future<void> initialise() => Firebase.initializeApp();

  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  /// Not have permission for read write for firebase!!!

  //TODO: change collection name to something unique or your name
  CollectionReference get tasksRef =>
      FirebaseFirestore.instance.collection('myTask');

  //TODO: replace mock data. Remember to set the task id to the firebase object id
  List<Task> get tasks => mockData.map((e) => Task.fromJson(e)).toList();
  Future<List<Task>> getTasks() async {
    try {

      QuerySnapshot querySnapshot = await tasksRef.get();

      final result = querySnapshot.docs.map((doc) => Task(id: doc["id"], title: doc["title"], description: doc["description"], completedAt: doc["completedAt"])).toList();

      return result;
    }
    on CacheException catch (e) {
      throw CacheException(e.msg);
    }
    on ServerException catch (e) {
      throw ServerException(e.msg);
    }
  } 

  //TODO: implement firestore CRUD functions here
  void addTask(Task task) async {
    try {
      await tasksRef.add(task.toJson());
    }
    on CacheException catch (e) {
      throw CacheException(e.msg);
    }
    on ServerException catch (e) {
      throw ServerException(e.msg);
    }
  }

  void updateTask(Task task) async {
     try {
      tasksRef.doc(task.id).update(task.toJson());
    }
    on CacheException catch (e) {
      throw CacheException(e.msg);
    }
    on ServerException catch (e) {
      throw ServerException(e.msg);
    }
  }

  void deleteTask(Task task) {
    try {
      tasksRef.doc(task.id).delete();
    }
    on CacheException catch (e) {
      throw CacheException(e.msg);
    }
    on ServerException catch (e) {
      throw ServerException(e.msg);
    }
  }
}

List<Map<String, dynamic>> mockData = [
  {"id": "1", "title": "Task 1", "description": "Task 1 description"},
  {
    "id": "2",
    "title": "Task 2",
    "description": "Task 2 description",
    "completed_at": DateTime.now().toIso8601String()
  }
];
