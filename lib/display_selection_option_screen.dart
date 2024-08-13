import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DisplaySelectionScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  DisplaySelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selected Option'),
      ),
      body: Center(
        child: StreamBuilder<DocumentSnapshot>(
          stream: _firestore.collection('choices').doc('selected').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }
            var data = snapshot.data!.data() as Map<String, dynamic>;
            String choice = data['choice'];
            return Text(
              'Selected Option: $choice',
              style: const TextStyle(fontSize: 24),
            );
          },
        ),
      ),
    );
  }
}
