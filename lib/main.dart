import 'package:editprofile/profile_detail_page.dart';
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
  // Default profile data
  final List<Map<String, dynamic>> profileData = [
    {
      'label': 'Name',
      'value': 'Micah Smith',
    },
    {
      'label': 'Phone',
      'value': '(123) 456-7890',
    },
    {
      'label': 'Email',
      'value': 'micah@gmail.com',
    },
    {
      'label': 'Tell us about yourself',
      'value':
          'Hi my name is Micah Smith. I am from Mesa but go to school in Salt Lake City. '
              'I make this drive all the time and have plenty of experience.',
    },
  ];

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
              const SizedBox(height: 15),
              for (var section in profileData) ...[
                InkWell(
                  onTap: () => _navToProfileDetailEditPage(
                      section['label'], section['value']),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(section['label']),
                          const Row(
                            children: [
                              Text(""),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              section['value'],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Row(
                            children: [
                              Icon(Icons.keyboard_arrow_right,
                                  color: Colors.blue),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _navToProfileDetailEditPage(
      String sectionName, String initialValue) async {
    final updatedValue = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileDetailPage(
          sectionName: sectionName,
          initialValue: initialValue,
        ),
      ),
    );

    if (updatedValue != null) {
      // Update the profileData with the edited value.
      setState(() {
        for (var section in profileData) {
          if (section['label'] == sectionName) {
            section['value'] = updatedValue;
            break;
          }
        }
      });
    }
  }
}
