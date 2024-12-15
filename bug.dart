```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Handle the successful response here
      final jsonData = jsonDecode(response.body);
      // Access data from jsonData
      print(jsonData['key']);
    } else {
      // Handle the error response here
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions here
    print('An error occurred: $e');
    rethrow; // Re-throw the exception to be handled higher up in the call stack
  }
}
```