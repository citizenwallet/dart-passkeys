import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dart_passkeys/dart_passkeys_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelDartPasskeys platform = MethodChannelDartPasskeys();
  const MethodChannel channel = MethodChannel('dart_passkeys');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      return switch (methodCall.method) {
        'getPlatformVersion' => '42',
        'helloWorld' => 'Hello, World!',
        _ => null,
      };
    });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
    expect(await platform.helloWorld(), 'Hello, World!');
  });
}
