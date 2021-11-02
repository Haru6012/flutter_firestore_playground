import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyFirestorePage(),
    );
  }
}

class MyFirestorePage extends StatefulWidget {
  const MyFirestorePage({Key? key}) : super(key: key);

  @override
  _MyFirestorePageState createState() => _MyFirestorePageState();
}

class _MyFirestorePageState extends State<MyFirestorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: const Text("コレクション＋ドキュメント追加！"),
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection("users")
                    .doc("id_abc")
                    .set({"name": "松坂", "age": 40});
              },
            ),
            ElevatedButton(
              child: const Text("サブコレクション+ドキュメント作成"),
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection("users")
                    .doc("id_abc")
                    .collection("others")
                    .doc("id_123")
                    .set({"price": 600, "date": "9/13"});
              },
            ),
          ],
        ),
      ),
    );
  }
}
