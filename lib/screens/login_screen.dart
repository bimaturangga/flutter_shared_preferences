import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_shared_preferences/theme/app_colors.dart';
import 'package:flutter_shared_preferences/theme/app_typography.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

  Future<void> _performLogin(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('is_logged_in', true);

    if (!context.mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    "devevo",
                    style: AppTypography.headlineExtraBold.copyWith(
                      color: AppColors.bluePrimary,
                      fontSize: 42,
                      letterSpacing: -1.0,
                    ),
                  ),
                ),
                const SizedBox(height: 40),

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
                            border: Border.all(
                              color: AppColors.gray,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "Bersiaplah, Devolver!",
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
                              decoration: const BoxDecoration(
                                color: AppColors.background,
                                border: Border(
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
                      'assets/svgs/login.svg',
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
                  ],
                ),
                const SizedBox(height: 40),

                TextField(
                  style: AppTypography.textRegular.copyWith(
                    color: AppColors.textPrimary,
                  ),
                  decoration: InputDecoration(
                    hintText: "Nama atau Email",
                    hintStyle: AppTypography.textSemiBold.copyWith(
                      color: AppColors.gray,
                    ),
                    filled: false,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: AppColors.gray,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: AppColors.bluePrimary,
                        width: 1.5,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),
                    suffixIcon: const Icon(
                      Icons.cancel_outlined,
                      color: AppColors.bluePrimary,
                      size: 22,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                TextField(
                  obscureText: _obscurePassword,
                  style: AppTypography.textRegular.copyWith(
                    color: AppColors.textPrimary,
                  ),
                  decoration: InputDecoration(
                    hintText: "Kata Sandi",
                    hintStyle: AppTypography.textSemiBold.copyWith(
                      color: AppColors.gray,
                    ),
                    filled: false,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: AppColors.gray,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: AppColors.bluePrimary,
                        width: 1.5,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),
                    suffixIcon: IconButton(
                      onPressed: _togglePasswordVisibility,
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.bluePrimary,
                        size: 22,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.bluePrimary,
                    foregroundColor: AppColors.textPrimary,
                    elevation: 0,
                    minimumSize: const Size(double.infinity, 55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () => _performLogin(context),
                  child: Text(
                    "Masuk",
                    style: AppTypography.subHeadlineBold.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
