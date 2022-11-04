import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1f1f1),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text('M.Art'),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Searching for an art…'),
                ),
              );
            },
            icon: LineIcon.search(),
          )
        ],
      ),
      body: Center(child: Text('Art will be here soon.')),
    );
  }
}
