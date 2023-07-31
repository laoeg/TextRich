import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'textrich_platform_interface.dart';

/// An implementation of [TextrichPlatform] that uses method channels.
class MethodChannelTextrich extends TextrichPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('textrich');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
