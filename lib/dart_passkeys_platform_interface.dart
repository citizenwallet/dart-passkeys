import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'dart_passkeys_method_channel.dart';

abstract class DartPasskeysPlatform extends PlatformInterface {
  /// Constructs a DartPasskeysPlatform.
  DartPasskeysPlatform() : super(token: _token);

  static final Object _token = Object();

  static DartPasskeysPlatform _instance = MethodChannelDartPasskeys();

  /// The default instance of [DartPasskeysPlatform] to use.
  ///
  /// Defaults to [MethodChannelDartPasskeys].
  static DartPasskeysPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DartPasskeysPlatform] when
  /// they register themselves.
  static set instance(DartPasskeysPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String> helloWorld() {
    throw UnimplementedError('helloWorld() has not been implemented.');
  }
}
