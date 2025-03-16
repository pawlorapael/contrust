import 'package:flutter/material.dart';

class BuildingmaterialPage extends StatelessWidget {
  const BuildingmaterialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: const Text(
          "CONTRUST",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        children: [
          _buildMaterialButton(context, "Wood", [
            "Acacia",
            "Cedar",
            "Pine",
            "Manga",
            "Avocado",
            "Papaya",
            "Balete",
          ]),
          _buildMaterialButton(context, "Steel", [
            "Stainless Steel",
            "Carbon Steel",
            "Alloy Steel",
          ]),
        ],
      ),
    );
  }

  Widget _buildMaterialButton(
      BuildContext context, String material, List<String> items) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: () {
        _showMaterialDialog(context, material, items);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.category,
            size: 50.0,
            color: Colors.yellow[700],
          ),
          const SizedBox(height: 10),
          Text(
            material,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }

  void _showMaterialDialog(
      BuildContext context, String material, List<String> items) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(material),
          content: SizedBox(
            height: 200.0,
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(items[index]),
                  leading: const Icon(Icons.circle),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }
}