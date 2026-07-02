import 'package:flutter/material.dart';
import 'package:flutter_shared_preferences/theme/app_colors.dart';
import 'package:flutter_shared_preferences/theme/app_typography.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key, required bool isFirstLaunch});

  Future<void> _finishOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_first_launch', false);

    final bool isLoggedIn = prefs.getBool('is_logged_in') ?? false;

    if (!context.mounted) return;

    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "devevo",
                style: AppTypography.headlineExtraBold.copyWith(
                  color: AppColors.bluePrimary,
                  fontSize: 42,
                  letterSpacing: -1.0,
                ),
              ),

              Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          border: Border.all(color: AppColors.gray, width: 1.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Hello, Namaku Devo!",
                          style: AppTypography.textSemiBold.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: -7,
                        right: 32,
                        child: Transform.rotate(
                          angle: math.pi / 4,
                          child: Container(
                            width: 14,
                            height: 14,
                            decoration: BoxDecoration(
                              color: AppColors.background,
                              border: const Border(
                                bottom: BorderSide(
                                  color: AppColors.gray,
                                  width: 1.5,
                                ),
                                right: BorderSide(
                                  color: AppColors.gray,
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  SvgPicture.asset(
                    'assets/svgs/onboarding.svg',
                    height: 220,

                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 220,
                        width: 220,
                        decoration: BoxDecoration(
                          color: AppColors.card,
                          border: Border.all(
                            color: AppColors.gray,
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            "SVG Placeholder\nTaruh file di:\nassets/devo_character.svg",
                            textAlign: TextAlign.center,
                            style: AppTypography.textRegular.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),

              Column(
                children: [
                  Text(
                    "Selamat Datang, Devolver!",
                    style: AppTypography.headlineBold.copyWith(
                      color: AppColors.bluePrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Di dunia yang dipenuhi dengan petualangan\ncode tanpa henti!",
                    style: AppTypography.textRegular.copyWith(
                      color: AppColors.textPrimary,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.bluePrimary,
                      foregroundColor: AppColors.textPrimary,
                      elevation: 0,
                      minimumSize: const Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () => _finishOnboarding(context),
                    child: Text(
                      "Mulai Sekarang",
                      style: AppTypography.subHeadlineBold.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
