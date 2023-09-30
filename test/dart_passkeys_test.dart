import 'package:flutter_test/flutter_test.dart';
import 'package:dart_passkeys/dart_passkeys.dart';
import 'package:dart_passkeys/dart_passkeys_platform_interface.dart';
import 'package:dart_passkeys/dart_passkeys_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDartPasskeysPlatform
    with MockPlatformInterfaceMixin
    implements DartPasskeysPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String> helloWorld() => Future.value('Hello, World!');

  @override
  Future<String> create() => Future.value('pk');
}

void main() {
  final DartPasskeysPlatform initialPlatform = DartPasskeysPlatform.instance;

  test('$MethodChannelDartPasskeys is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDartPasskeys>());
  });

  test('getPlatformVersion', () async {
    DartPasskeys dartPasskeysPlugin = DartPasskeys();
    MockDartPasskeysPlatform fakePlatform = MockDartPasskeysPlatform();
    DartPasskeysPlatform.instance = fakePlatform;

    expect(await dartPasskeysPlugin.getPlatformVersion(), '42');
    expect(await dartPasskeysPlugin.helloWorld(), 'Hello, World!');
  });
}
