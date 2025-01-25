class Environment {
  static const String dev = 'development';
  static const String prod = 'production';

  static const String currentEnvironment = dev;

  static String get apiUrl {
    switch (currentEnvironment) {
      case dev:
        return 'https://stg-zero.propertyproplus.com.au/api/';
      case prod:
        return 'https://stg-zero.propertyproplus.com.au/api/';
      default:
        return 'https://stg-zero.propertyproplus.com.au/api/';
    }
  }
}
