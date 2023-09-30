@JS()
library callable_function;

// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'dart_passkeys_platform_interface.dart';

import 'package:js/js.dart';
import 'package:js/js_util.dart';

@JS('jsOnEvent')
external set _jsOnEvent(void Function(dynamic event) f);

@JS('jsInvokeMethod')
external dynamic jsInvokeMethod(String method, String? params);

/// A web implementation of the DartPasskeysPlatform of the DartPasskeys plugin.
class DartPasskeysWeb extends DartPasskeysPlatform {
  /// Constructs a DartPasskeysWeb
  DartPasskeysWeb();

  static void registerWith(Registrar registrar) {
    DartPasskeysPlatform.instance = DartPasskeysWeb();
  }

  Future<dynamic> sendMethodMessage(String method, String? arguments) async {
    print('invoking method $method! with arguments $arguments');
    final dynamic response =
        await promiseToFuture(jsInvokeMethod(method, arguments));
    //...
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    final version = html.window.navigator.userAgent;
    return version;
  }

  /// Returns a [String] containing the hello world text.
  @override
  Future<String> helloWorld() async {
    await sendMethodMessage('helloWorld', null);
    return 'Hello, World!';
  }

  /// Returns a [credential] containing the hello world text.
  @override
  Future<String> create() async {
    await sendMethodMessage('create', '123');
    return 'created!';
  }
}
