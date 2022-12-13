import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pinball_ui/pinball_ui.dart';

void main() {
  group('PinballColors', () {
    test('white is 0xFFFFFFFF', () {
      expect(PinballColors.white, const Color(0xFFFFFFFF));
    });

    test('black is 0xFF000000', () {
      expect(PinballColors.black, const Color(0xFF000000));
    });

    test('darkBlue is 0xFF0C32A4', () {
      expect(PinballColors.darkBlue, const Color(0xFF0C32A4));
    });

    test('yellow is 0xFFFFEE02', () {
      expect(PinballColors.yellow, const Color(0xFFFFEE02));
    });

    test('orange is 0xFFE5AB05', () {
      expect(PinballColors.orange, const Color(0xFFE5AB05));
    });

    test('red is 0xFFF03939', () {
      expect(PinballColors.red, const Color(0xFFF03939));
    });

    test('blue is 0xFF4B94F6', () {
      expect(PinballColors.blue, const Color(0xFF4B94F6));
    });

    test('transparent is 0x00000000', () {
      expect(PinballColors.transparent, const Color(0x00000000));
    });

    test('loadingDarkBlue is 0xFF393939', () {
      expect(PinballColors.loadingDark, const Color(0xFF393939));
    });

    test('loadingDarkBlue is 0xFFCECECE', () {
      expect(PinballColors.loadingLight, const Color(0xFFCECECE));
    });

    test('crtBackground is 0xFF274E54', () {
      expect(PinballColors.crtBackground, const Color(0xFF274E54));
    });
  });
}
