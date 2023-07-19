import 'package:flutter/material.dart';

class EditNamePage extends StatefulWidget {
  final String sectionName;
  final String initialValue;

  const EditNamePage({
    super.key,
    required this.sectionName,
    required this.initialValue,
  });

  @override
  _EditNamePageState createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {
  late TextEditingController _textEditingControllerFirst;
  late TextEditingController _textEditingControllerLast;
  late String firstName;
  late String lastName;

  @override
  void initState() {
    super.initState();

    List<String> parts = widget.initialValue.split(' ');
    if (parts.length > 1) {
      firstName = parts[0];
      lastName = parts.sublist(1).join(' ');
    } else {
      firstName = widget.initialValue;
      lastName = '';
    }

    _textEditingControllerFirst = TextEditingController(text: firstName);
    _textEditingControllerLast = TextEditingController(text: lastName);
  }

  @override
  void dispose() {
    _textEditingControllerFirst.dispose();
    _textEditingControllerLast.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "What's your name?",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _textEditingControllerFirst,
                    maxLines: null,
                    decoration: const InputDecoration(
                      labelText: "First Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: _textEditingControllerLast,
                    maxLines: null,
                    decoration: const InputDecoration(
                      labelText: "Last Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Expanded(child: SizedBox()),
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero),
                ),
                onPressed: () {
                  // When the save button is pressed, update the profileData and return to the previous page.
                  String name =
                      '${_textEditingControllerFirst.text} ${_textEditingControllerLast.text}';
                  Navigator.pop(context, name);
                },
                child: const Text(
                  'Update',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
