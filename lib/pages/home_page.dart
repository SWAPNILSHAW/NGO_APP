import 'package:flutter/material.dart';
import 'package:ngo_volunteer_app/pages/volunteer_form_page.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void shareApp() {
    Share.share(
      'Join Helping Hands NGO and be part of the change! 🌱\n\nDownload the app and volunteer today.\n\nhttps://github.com/SWAPNILSHAW/', // Replace with your real link
      subject: 'Help Make a Difference – Volunteer with Helping Hands!',
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = const Color(0xFF1B5E20); // Deep green
    final lightBackground = const Color(0xFFF5F5F5); // Soft gray background

    return Scaffold(
      backgroundColor: lightBackground,
      appBar: AppBar(
        title: const Text(
          "About Us",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: themeColor,
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: themeColor.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                    image: const DecorationImage(
                      image: AssetImage('assets/logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "Helping Hands",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: themeColor,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 2,
                width: 80,
                color: themeColor.withOpacity(0.4),
              ),
              const SizedBox(height: 20),
              Text(
                "We are a non-profit organization dedicated to creating a sustainable and inclusive society through education, healthcare, and social empowerment.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Join our mission and make a real difference in the lives of people who need it the most.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(
                  //     content: const Text('Thank you for showing interest!'),
                  //     backgroundColor: themeColor,
                  //   ),
                  // );
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => VolunteerFormPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeColor,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                ),
                icon: const Icon(Icons.volunteer_activism),
                label: const Text(
                  "Become a Volunteer",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),

      // ✅ Floating Share Button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: shareApp,
        icon: const Icon(Icons.share,color: Colors.white,),
        label: const Text("Share", style: TextStyle(fontSize: 16, color: Colors.white),),
        backgroundColor: themeColor,
      ),
    );
  }
}
