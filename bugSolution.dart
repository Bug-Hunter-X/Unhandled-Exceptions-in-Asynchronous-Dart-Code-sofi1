```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      //Process jsonData, handle potential exceptions within jsonDecode
      //Example: Check for specific keys before accessing them to prevent errors
      if (jsonData is Map && jsonData.containsKey('key')){
        print(jsonData['key']);
      } else{
          print('JSON data missing expected key or malformed.');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } on http.ClientException catch (e) {
    print('Network error: $e');
  } on FormatException catch (e) {
    print('JSON decoding error: $e');
  } catch (e) {
    print('An unexpected error occurred: $e');
  }
}
```