import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  bool _isRegisterPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _isRegisterPage
            ? _buildRegisterPage()
            : Stack(
                children: [
                  PageView(
                    controller: _pageController,
                    children: [
                      _buildOnboardingPage(
                        image: 'assets/images/onboarding1.png',
                        title: 'Selamat datang di Gojek!',
                        description:
                            'Aplikasi yang bikin hidupmu lebih nyaman. Siap bantu semua kebutuhanmu, kapanpun, dan di manapun.',
                      ),
                      _buildOnboardingPage(
                        image: 'assets/images/onboarding2.png',
                        title: 'Transportasi & Logistik',
                        description:
                            'Antarin kamu jalan atau ambilin barang lebih gampang tinggal ngeklik doang~',
                      ),
                      _buildOnboardingPage(
                        image: 'assets/images/onboarding3.png',
                        title: 'Pesan Makan & Belanja',
                        description:
                            'Lagi ngidam sesuatu? Gojek beliin gak pakai lama.',
                        isLastPage: true,
                        onButtonPressed: () {
                          Get.toNamed(AppRoutes.LOGIN);
                        },
                      ),
                    ],
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Image.asset(
                      'assets/images/gojek.png', // Logo Gojek di kiri atas
                      width: 100,
                      height: 50,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 0,
                    child: Image.asset(
                      'assets/images/language.png', // Logo Gojek di kanan atas
                      width: 100,
                      height: 50,
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            minimumSize: Size(double.infinity, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            Get.toNamed(AppRoutes.LOGIN);
                          },
                          child: Text('Masuk', style: TextStyle(fontSize: 16)),
                        ),
                        SizedBox(height: 8),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            minimumSize: Size(double.infinity, 48),
                            side: BorderSide(color: Colors.green),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              _isRegisterPage = true;
                            });
                          },
                          child: Text(
                            'Belum ada akun? Daftar dulu',
                            style: TextStyle(fontSize: 16, color: Colors.green),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Dengan masuk atau mendaftar, kamu menyetujui\nKetentuan Layanan dan Kebijakan Privasi.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildOnboardingPage({
    required String image,
    required String title,
    required String description,
    bool isLastPage = false,
    VoidCallback? onButtonPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 250, fit: BoxFit.contain),
          SizedBox(height: 24),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            description,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterPage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Daftar Akun',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          TextField(
            decoration: InputDecoration(
              labelText: 'Nama Lengkap',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Kata Sandi',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              minimumSize: Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              // Simulasi pendaftaran selesai
              setState(() {
                _isRegisterPage = false;
              });
            },
            child: Text('Daftar', style: TextStyle(fontSize: 16)),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _isRegisterPage = false;
              });
            },
            child: Text('Kembali', style: TextStyle(color: Colors.green)),
          ),
        ],
      ),
    );
  }
}
