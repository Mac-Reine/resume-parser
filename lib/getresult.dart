import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GetResult extends StatefulWidget {
  const GetResult({Key? key}) : super(key: key);

  @override
  State<GetResult> createState() => _GetResultState();
}

class _GetResultState extends State<GetResult> {
  final List<bool> _selected = List<bool>.filled(20, false); // List to track selected items
  bool _isDownloading = false; // State variable to track download progress

  // Method to select all items
  void _selectAll() {
    setState(() {
      for (int i = 0; i < _selected.length; i++) {
        _selected[i] = true;
      }
    });
  }

  // Method to download selected items
  void _downloadSelected() async {
    final selectedResumes = _selected
        .asMap()
        .entries
        .where((entry) => entry.value)
        .map((entry) => 'resume ${entry.key + 1}')
        .toList();

    if (selectedResumes.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Select at least one file')),
      );
      return;
    }

    setState(() {
      _isDownloading = true;
    });

    print('Downloading: $selectedResumes');

    // Simulate a download delay
    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      _isDownloading = false;
    });

    // Show a snackbar when download completes
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Download completed')),
    );

    // Add code here to handle the actual download functionality
  }

  // Method to toggle selection of an item
  void _toggleSelect(int index) {
    setState(() {
      _selected[index] = !_selected[index];
    });
  }

  // Placeholder method to view a resume
  void _viewResume(int index) {
    print('Viewing resume ${index + 1}');
    // Implement your view functionality here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SHORTLISTED"),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: _selectAll,
            child: Row(
              children: const [
                Text(
                  'Select All',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Icon(Icons.select_all, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: _selected.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(2),
                child: Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: GestureDetector(
                      onTap: () => _toggleSelect(index),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: _selected[index] ? Colors.green : Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.download, color: Colors.white),
                      ),
                    ),
                    title: Text(
                      'resume ${index + 1}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text('ID: ${index + 1}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_red_eye),
                      onPressed: () => _viewResume(index),
                    ),
                    onTap: () => _toggleSelect(index),
                  ),
                ),
              );
            },
          ),
          // Display Lottie animation while downloading
          if (_isDownloading)
            Center(
              child: Lottie.asset('assets/images/downloadanimation.json'), // Replace with your animation file path
            ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _downloadSelected,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            child: const Text(
              'Download',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}