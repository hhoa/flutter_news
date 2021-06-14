bool isNotEmpty(String? s) {
  return s != null && s
      .trim()
      .length > 0;
}

bool isEmpty(String s) {
  return !isNotEmpty(s);
}

bool isListEmpty(List? l) => l == null || l.isEmpty;