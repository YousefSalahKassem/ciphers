import 'package:flutter/cupertino.dart';
import 'package:password_cipher/password_cipher.dart';

class CipherController with ChangeNotifier {
  final cipher = Logic();
  int selectIndex = 0;
  final TextEditingController message = TextEditingController();
  final TextEditingController key = TextEditingController();
  TextEditingController result = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final mobilekey = GlobalKey<FormState>();

  void changeIndex(int index) {
    selectIndex = index;
    notifyListeners();
  }

  String encrypt() {
    if (selectIndex == 0) {
      result.text = caesarCipherEncryption(message.text, int.parse(key.text));
    } else if (selectIndex == 1) {
      result.text = cipher.railFenceEncryption(message.text, int.parse(key.text));
    }
    notifyListeners();
    return result.text;
  }


  String decrypt() {
    if (selectIndex == 0) {
      result.text = caesarCipherDecryption(message.text, int.parse(key.text));
    } else if (selectIndex == 1) {
      result.text = cipher.railFenceDecryption(message.text, int.parse(key.text));
    }
    notifyListeners();
    return result.text;
  }

  caesarCipherEncryption(String text, int key) {
    String result = '';
    for (int i = 0; i < text.length; i++) {
      int char = text.codeUnitAt(i);
      if (char >= 33 && char <= 47) {
        result += String.fromCharCode(((char - 33 + key) % 15) + 33);
      } else if (char >= 48 && char <= 57) {
        result += String.fromCharCode(((char - 48 + key) % 10) + 48);
      } else if (char >= 58 && char <= 64) {
        result += String.fromCharCode(((char - 58 + key) % 7) + 58);
      } else if (char >= 65 && char <= 90) {
        result += String.fromCharCode(((char - 65 + key) % 26) + 65);
      } else if (char >= 97 && char <= 122) {
        result += String.fromCharCode(((char - 97 + key) % 26) + 97);
      } else if (char >= 91 && char <= 96) {
        result += String.fromCharCode(((char - 91 + key) % 6) + 91);
      } else if (char >= 123 && char <= 126) {
        result += String.fromCharCode(((char - 123 + key) % 4) + 123);
      } else {
        result += String.fromCharCode(char);
      }
    }
    return result;
  }

  String caesarCipherDecryption(String text, int key ) {
    String result = '';
    for (int i = 0; i < text.length; i++) {
      int char = text.codeUnitAt(i);
      if (char >= 33 && char <= 47) {
        result += String.fromCharCode(((char - 33 - key) % 15) + 33);
      } else if (char >= 48 && char <= 57) {
        result += String.fromCharCode(((char - 48 - key) % 10) + 48);
      } else if (char >= 58 && char <= 64) {
        result += String.fromCharCode(((char - 58 - key) % 7) + 58);
      } else if (char >= 65 && char <= 90) {
        result += String.fromCharCode(((char - 65 - key) % 26) + 65);
      } else if (char >= 97 && char <= 122) {
        result += String.fromCharCode(((char - 97 - key) % 26) + 97);
      } else if (char >= 91 && char <= 96) {
        result += String.fromCharCode(((char - 91 - key) % 6) + 91);
      } else if (char >= 123 && char <= 126) {
        result += String.fromCharCode(((char - 123 - key) % 4) + 123);
      } else {
        result += String.fromCharCode(char);
      }
    }
    return result;
  }

  String railFenceEncryption(String text, int key){
    return cipher.railFenceEncryption(text, key);
  }

  String railFenceDecryption(String text, int key){
    return cipher.railFenceDecryption(text, key);
  }

  @override
  void dispose() {
    message.dispose();
    key.dispose();
    super.dispose();
  }
}