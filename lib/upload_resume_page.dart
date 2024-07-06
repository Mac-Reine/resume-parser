import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'getresult.dart'; // Import GetResult screen

class UploadResumePage extends StatefulWidget {
  const UploadResumePage({Key? key}) : super(key: key);

  @override
  _UploadResumePageState createState() => _UploadResumePageState();
}

class _UploadResumePageState extends State<UploadResumePage> {
  List<String> _uploadedResumes = [];

  Future<void> _selectFiles() async {
    // Open file picker to select PDF files
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: true, // Allow multiple file selection
    );

    if (result != null) {
      // Process selected files
      setState(() {
        _uploadedResumes.addAll(result.files.map((file) => file.name!));
      });

      // Show upload successful message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Upload successful')),
      );
    } else {
      // User canceled the picker
      print('User canceled file picker');
    }
  }

  void _deleteResume(int index) {
    setState(() {
      _uploadedResumes.removeAt(index);
    });
  }

  void _navigateToGetResults() {
    // Navigate to GetResult screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const GetResult(), // Modify with your actual implementation
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Resume"),
        backgroundColor: const Color(0xff1b81f1),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 50,left: 50),
       child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/applogo.png"),
              colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.5), BlendMode.dstATop),
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: _selectFiles,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff1b81f1)),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(vertical: 15)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                child: const Text(
                  "Select Files",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (_uploadedResumes.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: _uploadedResumes.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_uploadedResumes[index]),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _deleteResume(index),
                        ),
                      );
                    },
                  ),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _navigateToGetResults,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff1b81f1)),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(vertical: 15)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                child: const Text(
                  "Get Results",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
