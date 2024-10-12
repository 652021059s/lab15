import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lab_15_652021059/pages/another_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Declare your variable for data
  String? myName;

  // Declare your function to load data
  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myName = prefs.getString("myname");
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: Colors.teal, // Set app bar color
        elevation: 4, // Add shadow to the app bar
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.all(16.0), // Add padding around the content
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Show Your name
                Text(
                  myName ?? "รอสักครู่",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold, // Make text bold
                    color: Colors.teal, // Set text color
                  ),
                ),
                const SizedBox(
                    height: 30), // Increase space between text and button

                // Button to go to another page
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AnotherPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12), // Round button corners
                    ),
                    // Background color of the button
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12), // Padding inside the button
                    elevation: 5, // Add shadow to the button
                  ),
                  child: const Text(
                    'ต่อไป',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 200, 211, 241),
                      fontWeight: FontWeight.w600, // Make button text semi-bold
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
