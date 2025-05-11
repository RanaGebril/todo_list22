
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_list22/models/task_models.dart';

class Firebasefunctions {

  // create collection
  // convert from map to task model or opposite
  static CollectionReference<TaskModel> getTasksCollection(){
    return FirebaseFirestore.instance.collection("Tasks")
        .withConverter<TaskModel>(
        fromFirestore: (snapshot, _) {
          return TaskModel.fromJson(snapshot.data()!);
        },
        toFirestore: (task, _) {
          return task.toJson();
        },);
  }

 static Future<void> addTask(TaskModel task){
    // create collection
    var collection=getTasksCollection();

    // create  empty document
    var docRef=collection.doc();

    // give the task auto id
    task.id = docRef.id;

  //   give values to the document
    return docRef.set(task);
  }

  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime taskDate){
    var collection=getTasksCollection();
    // one time read --> return type future / future builder in ui
    // return collection.get();

    // real_time change --> return type stream / streamBuilder in ui
    return collection
        // filter data based on the date  , mill --> data is integer now
         .where('date',  isEqualTo:  DateUtils.dateOnly(taskDate).millisecondsSinceEpoch)
        .snapshots();

  }

 static deleteTask(String id){
    var collection=getTasksCollection();
    collection.doc(id).delete();

  }

}