import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_application/models/task_model.dart';
import 'package:todo_application/models/user_model.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, options) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
  }

  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(UserModel.COLLECTION_NAME)
        .withConverter<UserModel>(
      fromFirestore: (snapshot, options) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
  }

  static Future<void> addUserToFirestore(UserModel user) {
    var collection = getUsersCollection();
    var docRef = collection.doc(user.id);
    return docRef.set(user);
  }

  static Future<UserModel?> readUser(String id) async {
    DocumentSnapshot<UserModel> userQuery =
    await getUsersCollection().doc(id).get();
    UserModel? userModel = userQuery.data();
    return userModel;
  }

  static Future<void> addTaskToFirestore(TaskModel taskModel) {
    var collection = getTasksCollection();
    var docRef = collection.doc();
    taskModel.id = docRef.id;
    return docRef.set(taskModel);
  }

  static Stream<QuerySnapshot<TaskModel>> getTasksFromFirestore(DateTime date) {
    var collection = getTasksCollection();
    return collection
        .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where("date",
        isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch)
        .snapshots();
  }

  static Future<void> delete() async {
    QuerySnapshot<TaskModel> tasksSnap = await getTasksCollection()
        .where('date',
        isLessThan:
        DateUtils.dateOnly(DateTime.now()).millisecondsSinceEpoch)
        .get();
    var tasks = tasksSnap.docs.map((e) => e.data()).toList();
    tasks.forEach((element) {
      getTasksCollection().doc(element.id).delete();
    });
  }

  static Future<void> deleteTask(String id) {
    return getTasksCollection().doc(id).delete();
  }

  static Future<void> updateTask(String id, TaskModel task) {
    return getTasksCollection().doc(id).update(task.toJson());
  }


  static void createAuthAccount(String name, String age, String email,
      String password, Function afterAddToFirestore) async {
    try {
      var credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel user = UserModel(
        id: credential.user!.uid,
        name: name,
        email: email,
        age: age,
      );
      addUserToFirestore(user).then((value) {
        afterAddToFirestore();
        // Navigator.pushReplacementNamed(context, routeName);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  static void userLogin(String emailAddress, String password,
      Function userNotFound, Function getUser) async {
    try {
      var credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

      readUser(credential.user!.uid).then((value) {
        getUser(value);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        userNotFound();
      } else if (e.code == 'wrong-password') {
        userNotFound();
      }
    }
  }
}
