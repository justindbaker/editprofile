import 'package:flutter/material.dart';

class ProfileDetailPage extends StatefulWidget {
  final String sectionName;
  final String initialValue;

  const ProfileDetailPage(
      {super.key, required this.sectionName, required this.initialValue});

  @override
  _ProfileDetailPageState createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
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
      appBar: AppBar(title: Text('Edit ${widget.sectionName}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _textEditingController,
              maxLines: null,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // When the save button is pressed, update the profileData and return to the previous page.
                Navigator.pop(context, _textEditingController.text);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
