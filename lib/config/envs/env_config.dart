import 'package:flutter/material.dart';

class EnvConfig {
  final String baseUrl;
  final String apiKey;
  final bool showBanner;
  final Color bannerColor;
  final String titleMode;

  EnvConfig({
    required this.baseUrl,
    required this.apiKey,
    required this.showBanner,
    required this.bannerColor,
    required this.titleMode,
  });
}

class DevConfig extends EnvConfig {
  DevConfig()
      : super(
            baseUrl: 'https://dev-newsapi.org/v2/',
            apiKey: 'DEV_API_KEY',
            showBanner: true,
            bannerColor: Colors.red, // Set banner color for development
            titleMode: 'Dev');
}

class StagingConfig extends EnvConfig {
  StagingConfig()
      : super(
            baseUrl: 'https://staging-newsapi.org/v2/',
            apiKey: 'STAGING_API_KEY',
            showBanner: true,
            bannerColor: Colors.orange, // Set banner color for staging
            titleMode: 'Staging');
}

class ProdConfig extends EnvConfig {
  ProdConfig()
      : super(
            baseUrl: 'https://prod-newsapi.org/v2/',
            apiKey: 'PROD_API_KEY',
            showBanner: false,
            bannerColor: Colors.green, // Set banner color for production
            titleMode: 'Prod');
}
