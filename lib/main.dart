import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edit Profile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const MyEditProfilePage(title: 'Edit Profile'),
    );
  }
}

class MyEditProfilePage extends StatefulWidget {
  const MyEditProfilePage({super.key, required this.title});

  final String title;

  @override
  State<MyEditProfilePage> createState() => _MyEditProfilePageState();
}

class _MyEditProfilePageState extends State<MyEditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Edit Profile",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue),
              ),
              const SizedBox(height: 15),
              Stack(
                children: [
                  const CircleAvatar(
                    radius:
                        75, // Change this radius for the width of the circular border
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                      radius:
                          70, // This radius is the radius of the picture in the circle avatar itself.
                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80',
                      ),
                    ),
                  ),
                  Positioned(
                    top: 1,
                    right: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.white,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              50,
                            ),
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(2, 4),
                              color: Colors.black.withOpacity(
                                0.3,
                              ),
                              blurRadius: 3,
                            ),
                          ]),
                      child: const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Icon(Icons.edit, color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
