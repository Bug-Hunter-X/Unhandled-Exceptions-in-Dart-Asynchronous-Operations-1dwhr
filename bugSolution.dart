```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body);
        return jsonData;
      } catch (e) {
        print('Error decoding JSON: $e');
        return null; //or throw a more specific exception
      }
    } else {
      print('Request failed with status: ${response.statusCode}. Response body: ${response.body}');
      return null; // or throw a custom exception with status code and body
    }
  } catch (e) {
    print('An unexpected error occurred: $e');
    rethrow; // Re-throw the exception to be handled higher up
  }
}

void main() async {
  final data = await fetchData();
  if (data != null) {
    print('Data fetched successfully: $data');
  } else {
    print('Failed to fetch or parse data.');
  }
}
```