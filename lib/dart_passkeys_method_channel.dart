import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'dart_passkeys_platform_interface.dart';

/// An implementation of [DartPasskeysPlatform] that uses method channels.
class MethodChannelDartPasskeys extends DartPasskeysPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('dart_passkeys');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String> helloWorld() async {
    final result = await methodChannel.invokeMethod<String>('helloWorld');
    return result!;
  }

  @override
  Future<String> create() async {
    final result = await methodChannel.invokeMethod<String>('create');
    return result!;
  }
}
