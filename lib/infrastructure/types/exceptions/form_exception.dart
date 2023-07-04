import 'package:article_app/infrastructure/types/exceptions/base_exception.dart';

class FormException extends BaseException {
  final Map<String, List<String>> errors;
  FormException(super.message, {this.errors = const {}});

  String? get getFirstError {
    if (errors.isEmpty) return null;
    final firstEntry = errors.entries.first.value;
    if (firstEntry.isEmpty) return null;
    return firstEntry.first;
  }

  Map<String, String> get allFirstError {
    return errors.map((key, value) => MapEntry(key, value[0]));
  }

  Map<String, String> get joinnedError {
    Map<String, String> mapWithStringValues = {};
    for (var key in errors.keys) {
      mapWithStringValues[key] = errors[key]!.join(', ');
    }
    return mapWithStringValues;
  }
}
