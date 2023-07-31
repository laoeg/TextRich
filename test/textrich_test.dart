
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:textrich/textrich.dart';
import 'package:textrich/textrich_method_channel.dart';
import 'package:textrich/textrich_platform_interface.dart';

class MockTextrichPlatform
    with MockPlatformInterfaceMixin
    implements TextrichPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final TextrichPlatform initialPlatform = TextrichPlatform.instance;

  test('$MethodChannelTextrich is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTextrich>());
  });

  test('getPlatformVersion', () async {
    TextRich textrichPlugin = TextRich("");
    MockTextrichPlatform fakePlatform = MockTextrichPlatform();
    TextrichPlatform.instance = fakePlatform;

    // expect(await textrichPlugin.getPlatformVersion(), '42');
  });
}
