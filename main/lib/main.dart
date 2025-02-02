import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LaunchPage(),
    );
  }
}

class LaunchPage extends StatefulWidget {
  const LaunchPage({super.key});

  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[700],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 120,
              height: 120,
            ),
            const SizedBox(height: 20),
            const Text(
              'CONTRUST',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              color: Colors.black,
              strokeWidth: 2,
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          buildPage(
            color: Colors.yellow[700]!,
            title: "Welcome",
            description: "Contrust is a platform for creating contracts between contractors and contractees.",
          ),
          buildPage(
            color: Colors.yellow[700]!,
            title: "Connect",
            description: "Easily find and connect with reliable contractors.",
          ),
          buildPage(
            color: Colors.yellow[700]!,
            title: "Design",
            description: "Use AI to pick a color of your choice.",
            context: context,
          ),
        ],
      ),
    );
  }

  Widget buildPage({
    required Color color,
    required String title,
    required String description,
    BuildContext? context,
  }) {
    return Container(
      color: color,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40), 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(radius: 5, backgroundColor: Colors.black54),
                const SizedBox(width: 10),
                CircleAvatar(radius: 5, backgroundColor: Colors.black38),
                const SizedBox(width: 10),
                CircleAvatar(radius: 5, backgroundColor: Colors.black38),
              ],
            ),
            const SizedBox(height: 40),
            if (context != null && title == "Design")
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text(
                  "Go to Login",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.yellow,
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWideScreen = constraints.maxWidth > 600;

              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 1000),
                        child: isWideScreen
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.9),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            blurRadius: 10,
                                            offset: const Offset(0, 5),
                                          ),
                                        ],
                                      ),
                                      child: _buildLoginForm(context),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      height: 450,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            blurRadius: 10,
                                            offset: const Offset(0, 5),
                                          ),
                                        ],
                                      ),
                                      child: ClipRRect(
                                        child: Image.asset(
                                          'assets/side_image.jpeg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.9),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 10,
                                          offset: const Offset(0, 5),
                                        ),
                                      ],
                                    ),
                                    child: _buildLoginForm(context),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Login',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 25),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(Icons.email),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Password',
            prefixIcon: Icon(Icons.lock),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 25),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const homepage()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            padding: const EdgeInsets.symmetric(vertical: 18),
          ),
          child: const Text('Login'),
        ),
        const SizedBox(height: 15),
        const Text(
          'Or Continue With',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        const SizedBox(height: 15),
        GestureDetector(
          onTap: () {
            //Googlesign-in
          },
          child: Center(
            child: Image.asset(
              'assets/googleicon.png',
              height: 50,
            ),
          ),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegistrationScreen(),
              ),
            );
          },
          child: const Text(
            "Doesn't have an account? Sign up",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.teal,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/pinoy_dishes.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Positioned(
            top: 50,
            left: 30,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                width: 350,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Sign Up',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ..._buildRegistrationFields(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildRegistrationFields(BuildContext context) {
    return [
      _buildInputField(label: 'First Name'),
      const SizedBox(height: 10),
      _buildInputField(label: 'Last Name'),
      const SizedBox(height: 10),
      _buildInputField(label: 'Birth Date'),
      const SizedBox(height: 10),
      _buildInputField(label: 'Email'),
      const SizedBox(height: 10),
      _buildInputField(label: 'Password', obscureText: true),
      const SizedBox(height: 20),
      ElevatedButton(
        onPressed: () {
          // Sign up eme
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          'Sign Up',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    ];
  }

  Widget _buildInputField({required String label, bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.teal),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: const Text(
          "CONTRUST",
          style: TextStyle(color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: const Icon(Icons.menu, color: Colors.black),
      ),
      body: Column(
        children: [
          //Search
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Suggested Contractor Firms",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildContractorCard(),
                      _buildContractorCard(),
                      _buildContractorCard(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
         
        ],
      ),
    );
  }

  Widget _buildContractorCard() {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
        image: const DecorationImage(
          image: NetworkImage(
              'https://via.placeholder.com/150'), 
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
          ),
          child: const Text("View", style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}