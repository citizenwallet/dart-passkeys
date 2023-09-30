import 'dart_passkeys_platform_interface.dart';

class DartPasskeys {
  Future<String?> getPlatformVersion() {
    return DartPasskeysPlatform.instance.getPlatformVersion();
  }

  Future<String> helloWorld() {
    return DartPasskeysPlatform.instance.helloWorld();
  }

  Future<dynamic> create() {
    return DartPasskeysPlatform.instance.create();
  }
}
