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
          _buildMaterialButton(context, "Cement", [
            "Portland Cement",
            "Masonry Cement",
            "White Cement",
          ]),
          _buildMaterialButton(context, "Steel", [
            "Stainless Steel",
            "Carbon Steel",
            "Alloy Steel",
          ]),
          _buildMaterialButton(context, "Concrete", [
            "High Strength",
            "Lightweight",
            "Reinforced",
          ]),
          _buildMaterialButton(context, "Bricks", [
            "Red Bricks",
            "Fly Ash Bricks",
            "Concrete Bricks",
          ]),
          _buildMaterialButton(context, "Clay", [
            "Kaolin",
            "Bentonite",
            "Fire Clay",
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
        _showMaterialBottomSheet(context, material, items);
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

  void _showMaterialBottomSheet(
      BuildContext context, String material, List<String> items) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                material,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(items[index]),
                      leading: const Icon(Icons.check_circle_outline,
                          color: Colors.green),
                      onTap: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${items[index]} selected'),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
