import 'package:flutter/material.dart';


class ThreadAdd extends StatefulWidget {
  const ThreadAdd({super.key});

  @override
  State<ThreadAdd> createState() => _ThreadAddState();
}

class _ThreadAddState extends State<ThreadAdd> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title: const Text('thread Add'),
      ),
      body: const Center(
        child: Text('thread Add'),
      ),
    );
  }
}