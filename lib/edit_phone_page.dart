import 'package:flutter/material.dart';

class EditPhonePage extends StatefulWidget {
  final String sectionName;
  final String initialValue;

  const EditPhonePage(
      {super.key, required this.sectionName, required this.initialValue});

  @override
  _EditPhonePageState createState() => _EditPhonePageState();
}

class _EditPhonePageState extends State<EditPhonePage> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "What's your phone number?",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            Form(
              child: TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Your phone number'),
                controller: _textEditingController,
              ),
            ),
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
                  Navigator.pop(context, _textEditingController.text);
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
