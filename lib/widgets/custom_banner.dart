import 'package:clean_architecture/config/envs/config.dart';
import 'package:flutter/material.dart';

class CustomDebugBanner extends StatelessWidget {
  const CustomDebugBanner({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Banner(
      message: Config.envConfig.titleMode,
      location: BannerLocation.topEnd,
      color: Config.envConfig.bannerColor,
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
        letterSpacing: 1.0,
      ),
    );
  }
}
