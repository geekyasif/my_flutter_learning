import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/screens/create_post.dart';
import 'package:flutter_blog/screens/update_post.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('posts').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text("Flutter Blog"),
            centerTitle: true,
            actions: [
              TextButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('AlertDialog Title'),
                    content: const Text('AlertDialog description'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
                child: const Text(
                  'Show Dialog',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          body: ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              data['id'] = document.id;
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdatePost(id: data['id'])));
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  margin: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Image.network(data['imageUrl']),
                      Text(data['title']),
                      Text(data['desc']),
                      Text(data['author']),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CreatePost()));
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
