import 'package:flutter/material.dart';

class DosAndDontsScreen extends StatelessWidget {
  const DosAndDontsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Do's and Don'ts"),
        backgroundColor: Color.fromARGB(255, 52, 31, 91), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildSectionTitle("Do’s"),
            const SizedBox(height: 10),
            _buildListItem("Take breaks and alternate hands between tasks, at least once an hour."),
            _buildListItem("Keep the height of your elbows at the same height as your keyboard."),
            _buildListItem("If you work for extended periods of time, squeeze a rubber stress ball in-between tasks."),
            _buildListItem("Perform regular wrist stretches, including rotating the wrist in clockwise and counter-clockwise motions, and rhythmic clenching and unclenching of the fists."),
            
            const SizedBox(height: 20), 
            _buildSectionTitle("Don’ts"),
            const SizedBox(height: 10),
            _buildListItem("Do not set your wrists on the wrist pad until you are taking a break. Keep them floating above the keyboard at a parallel position while typing."),
            _buildListItem("Do not repeat the same hand and wrist motions over a prolonged period of time to prevent the aggravation of tendons or swelling."),
            _buildListItem("Do not perform activities that involve extreme flexion or extension of the hand and wrist for a prolonged period of time as it can increase the pressure on the median nerve."),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.grey, 
      ),
    );
  }

  Widget _buildListItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.grey, 
        ),
      ),
    );
  }
}
