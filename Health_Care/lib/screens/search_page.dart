import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                label: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.teal,
                    ),
                    Text(
                      "Search",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                focusColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100))),
              ))
        ],
      ),
    );
  }
}
