import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background atas
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/image/slider5.png',
              height: MediaQuery.of(context).size.height * 0.28,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Background bawah
           Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/image/slider6.png',
                height: MediaQuery.of(context).size.height * 0.25,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

          // Ikon di kanan atas
          Positioned(
            top: 40,
            right: 24,
            child: Image.asset(
              'assets/image/Icon.png', // Ganti sesuai path ikon kamu
              height: 48,
              width: 48,
            ),
          ),

          // Tombol back kiri atas
          // Positioned(
          //   top: 40,
          //   left: 16,
          //   child: Icon(Icons.arrow_back, color: Colors.white),
          // ),

          // Form login
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 80),
                const Text(
                  "Masuk",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF001E42),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                // Email
                const Text(
                  "Email *",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF001E42),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Masukan Email...",
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Kata Sandi
                const Text(
                  "Kata Sandi *",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF001E42),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Masukan Kata Sandi...",
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 12),
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                      activeColor: const Color(0xFF001E42),
                    ),
                    const Text(
                      "Remember me?",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Tombol Lanjutkan
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF001E42),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Lanjutkan",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Footer
                const Center(
                  child: Text(
                    "© 2025 PPLG XII - 3 | GEN - 21. All rights reserved.",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
