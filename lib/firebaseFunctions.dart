
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_list22/models/task_models.dart';

import 'models/user_model.dart';

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
    return collection.where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid )
        // filter data based on the date  , mill --> data is integer now
         .where('date',  isEqualTo:  DateUtils.dateOnly(taskDate).millisecondsSinceEpoch)
        .snapshots();

  }

 static deleteTask(String id){
    var collection=getTasksCollection();
    collection.doc(id).delete();

  }

  static updateTask(TaskModel task){
    getTasksCollection().doc(task.id).update(task.toJson());
  }

  static createAccount(
      {required String email,
        required String password,
        required Function onSucess,
        required Function onError,
        required String firstName,
        required String lastName,
        required String phone,
      })async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user!.sendEmailVerification();

      UserModel user=UserModel(
        userId: credential.user!.uid,
        email: email ,
        firstName: firstName,
        lastName: lastName,
        phone: phone,

      );
      await addUser(user);
        onSucess();

    } on FirebaseAuthException catch (e) {
      onError(e.message);
    } catch (e) {
      onError(e.toString());
    }
  }

  // static signIn ({required String email,
  //   required String password,
  //   required Function onSucess,
  //   required Function onError,
  //
  // })async{
  //   try {
  //     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: email,
  //         password: password
  //     );
  //     if(credential.user!.emailVerified==true){
  //       onSucess();
  //     }
  //     else{
  //       onError("Please check your email and verify ");
  //     }
  //
  //   } on FirebaseAuthException catch (e) {
  //     onError(e.message);
  //   }
  // }

  static Future<void> logOut() async{
    await FirebaseAuth.instance.signOut();
  }


  static CollectionReference<UserModel> getUsersCollection(){
    return FirebaseFirestore.instance.collection("Users")
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (user, _) {
        return user.toJson();
      },);
  }


  static Future<void> addUser(UserModel user){
    // create collection
    var collection=getUsersCollection();

    // create  empty document
    var docRef=collection.doc(user.userId);

    // the id from authentication
    // user.userId = ;

    //   give values to the document
    return docRef.set(user);
  }

  static Future<UserModel?> getUserData() async{
    var collection=getUsersCollection();
    DocumentSnapshot<UserModel> userDoc = await collection.doc(FirebaseAuth.instance.currentUser!.uid).get();
    return userDoc.data();
  }
}