import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String activeCategory = 'Posts';

  final Map<String, List<Map<String, String>>> categoryData = {
    'Posts': [
      {'image': "assets/Pic_Example1.jpg", 'title': 'Bahay'},
      {'image': 'assets/Pic_Example2.jpg', 'title': 'Bahay'},
      {'image': 'assets/Pic_Example3.jpg', 'title': 'Eqan q'},
    ],
    'Material': [
      {'image': 'assets/Pic_Example4.jpg', 'title': 'Kuan'},
      {'image': 'assets/Pic_Example5.jpg', 'title': 'Omaghad'},
    ],
    'House': [
      {'image': 'assets/Pic_Example2.jpg', 'title': 'dOg'},
      {'image': 'assets/Pic_Example4.jpg', 'title': 'Museum Duh'},
    ],
  };

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
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    const CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage("assets/avatar.jpg"),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 4,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),

          //info nia
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: ListView(
                children: [
                  const ProfileTextField(label: 'Name:', value: 'registered name'),
                  const ProfileTextField(label: 'Email:', value: 'email cgurp?'),
                  const ProfileTextField(label: 'Contact Number:', value: 'numebr'),
                  const ProfileTextField(label: 'Gender:', value: 'Male'),
                  const ProfileTextField(label: 'Date of Birth:', value: 'December 8, 2003'),
                  
                  //sa may ano na posts nung contractee
                  const SizedBox(height: 10),
                  Text(
                    'Discover',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),

                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryTab(
                        label: 'Posts',
                        isActive: activeCategory == 'Posts',
                        onTap: () {
                          setState(() {
                            activeCategory = 'Posts';
                          });
                        },
                      ),
                      CategoryTab(
                        label: 'Material',
                        isActive: activeCategory == 'Material',
                        onTap: () {
                          setState(() {
                            activeCategory = 'Material';
                          });
                        },
                      ),
                      CategoryTab(
                        label: 'House',
                        isActive: activeCategory == 'House',
                        onTap: () {
                          setState(() {
                            activeCategory = 'House';
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 300,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: categoryData[activeCategory]!
                          .map((item) => ExperienceCard(
                                imagePath: item['image']!,
                                title: item['title']!,
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileTextField extends StatelessWidget {
  final String label;
  final String value;

  const ProfileTextField({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 3),
        TextField(
          controller: TextEditingController(text: value),
          enabled: false,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          decoration: const InputDecoration(
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class CategoryTab extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  CategoryTab({required this.label, required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.pinkAccent : Colors.grey,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final String imagePath;
  final String title;

  ExperienceCard({required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imagePath,
              height: 250,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
