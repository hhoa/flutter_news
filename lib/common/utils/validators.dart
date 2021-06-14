import 'dart:async';

import 'package:flutter_news/common/utils/validation_utils.dart';
import 'package:flutter_news/language/string_manager.dart';

class Validators {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (String email, EventSink<String> sink) {
      if (ValidationUtils.isValidEmail(email) || email.isEmpty) {
        sink.add(email);
      } else {
        sink.addError('Please enter valid email');
      }
    },
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (String value, EventSink<String> sink) {
      if (value.isNotEmpty) {
        sink.add(value);
      } else {
        sink.addError('Password cannot be empty');
      }
    },
  );

  final validateUsername = StreamTransformer<String, String>.fromHandlers(
    handleData: (String value, EventSink<String> sink) {
      if (value.isNotEmpty) {
        if (value.contains(" "))
          sink.addError(StringManager.usernameHintText);
        else
          sink.add(value);
      } else {
        sink.addError('Username cannot be empty');
      }
    },
  );
}
