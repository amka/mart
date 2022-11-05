import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

import '../components/gallery_view.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key, required this.deparmentId});

  final int deparmentId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1f1f1),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('M.Art'),
        automaticallyImplyLeading: true,
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
      body: GalleryView(
        deparmentId: deparmentId,
      ),
    );
  }
}
