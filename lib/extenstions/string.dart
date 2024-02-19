extension StringUtils on String {
  bool hasMatch(String pattern) {
    return RegExp(pattern).hasMatch(this);
  }

  /// Checks if string is URL.
  bool get isURL => hasMatch(
      r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,6}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$");

  /// Checks if string is email.
  bool get isEmail => hasMatch(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  /// Checks if string is phone number.
  bool get isPhoneNumber {
    // if (length > 16 || length < 9) return false;
    // return hasMatch(
    //     r'\b(?:\+\d{1,3}\s?)?(?:(?:\(\d{1,4}\))|(?:\d{1,4}))[-.\s]?\d{1,14}\b');
    return hasMatch(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  }
}
