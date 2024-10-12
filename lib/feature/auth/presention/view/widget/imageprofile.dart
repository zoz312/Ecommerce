import 'package:flutter/material.dart';

class customprofileimage extends StatelessWidget {
  const customprofileimage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          // Profile image
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey[200],
            backgroundImage: imageUrl.isNotEmpty ? AssetImage
            (imageUrl) : null,
            child: imageUrl.isEmpty
                ? Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.grey,
                  )
                : null,
          ),
          // Add icon in the bottom-right corner
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.blue, // Background color of the "Add" icon
              child: Icon(
                Icons.add,
                color: Colors.white, // Color of the "Add" icon
              ),
            ),
          ),
        ],
      ),
    );
  }
}
