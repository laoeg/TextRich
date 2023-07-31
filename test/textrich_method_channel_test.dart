import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:textrich/textrich_method_channel.dart';

void main() {
  MethodChannelTextrich platform = MethodChannelTextrich();
  const MethodChannel channel = MethodChannel('textrich');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
