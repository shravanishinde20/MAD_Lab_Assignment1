import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

void main() => runApp(FilePickerApp());

class FilePickerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Picker Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FilePickerHomePage(),
    );
  }
}

class FilePickerHomePage extends StatefulWidget {
  @override
  _FilePickerHomePageState createState() => _FilePickerHomePageState();
}

class _FilePickerHomePageState extends State<FilePickerHomePage> {
  String _filePath = 'No file selected';

  void _openFilePicker() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        setState(() {
          _filePath = result.files.single.path!;
        });
      } else {
        setState(() {
          _filePath = 'No file selected';
        });
      }
    } catch (e) {
      print('Error while picking the file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Picker Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selected File:',
            ),
            SizedBox(height: 10),
            Text(
              _filePath,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _openFilePicker,
              child: Text('Open File Picker'),
            ),
          ],
        ),
      ),
    );
  }
}
