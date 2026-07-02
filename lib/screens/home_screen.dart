import 'package:flutter/material.dart';
import 'package:flutter_shared_preferences/theme/app_colors.dart';
import 'package:flutter_shared_preferences/theme/app_typography.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('is_logged_in', false);

    if (!context.mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svgs/home.svg',
                      height: 220,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 220,
                          width: 220,
                          decoration: BoxDecoration(
                            color: AppColors.card,
                            border: Border.all(color: AppColors.gray, width: 2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 32),

                    Text(
                      "Aplikasi masih dalam Tahap\nPengembangan",
                      textAlign: TextAlign.center,
                      style: AppTypography.headlineBold.copyWith(
                        color: AppColors.bluePrimary,
                        fontSize: 22,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 16),

                    Text(
                      "Mohon maaf untuk saat ini aplikasi\nbelum bisa berjalan",
                      textAlign: TextAlign.center,
                      style: AppTypography.textSemiBold.copyWith(
                        color: AppColors.textPrimary,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.redPrimary,
                  foregroundColor: AppColors.textPrimary,
                  elevation: 0,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () => _logout(context),
                child: Text(
                  "Keluar",
                  style: AppTypography.subHeadlineBold.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
