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

@JS()
external dynamic jsInvokeMethod(String method, String? params);

/// A web implementation of the DartPasskeysPlatform of the DartPasskeys plugin.
class DartPasskeysWeb extends DartPasskeysPlatform {
  /// Constructs a DartPasskeysWeb
  DartPasskeysWeb();

  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
      'dart_passkeys',
      const StandardMethodCodec(),
      registrar,
    );

    DartPasskeysPlatform.instance = DartPasskeysWeb();

    channel.setMethodCallHandler(DartPasskeysWeb().handleMethodCall);

    //Sets the call from JavaScript handler
    _jsOnEvent = allowInterop((dynamic event) {
      print('interop event');
      //Process JavaScript call here
    });
  }

  Future<dynamic> handleMethodCall(MethodCall call) async {
    print('method call');
    switch (call.method) {
      //  case 'sendMethodMessage':
      //    return sendMethodMessage(call.method, call.arguments);
      case 'helloWorld':
        await sendMethodMessage(call.method, call.arguments);
        return helloWorld();
      default:
        throw PlatformException(
          code: 'Unimplemented',
          details:
              'flutter_plugin for web doesn\'t implement \'${call.method}\'',
        );
    }
  }

  Future<dynamic> sendMethodMessage(String method, String? arguments) async {
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
    return 'Hello, World!';
  }
}
