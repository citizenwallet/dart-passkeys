
import 'dart_passkeys_platform_interface.dart';

class DartPasskeys {
  Future<String?> getPlatformVersion() {
    return DartPasskeysPlatform.instance.getPlatformVersion();
  }
}
