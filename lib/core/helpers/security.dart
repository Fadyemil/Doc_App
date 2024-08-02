import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Security {
  static String get filename {
    if (kReleaseMode) {
      return '.env.profuction';
    }

    return '.env.development';
  }

  static String get Cli_token {
    return dotenv.env['FIREBASE_CLI_TOKEN'] ?? '';
  }
}
