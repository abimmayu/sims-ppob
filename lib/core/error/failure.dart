abstract class Failure implements Exception {
  final String message;
  final String title;

  Failure({
    required this.title,
    this.message = 'An error occurred',
  });

  @override
  String toString() {
    return message;
  }
}
