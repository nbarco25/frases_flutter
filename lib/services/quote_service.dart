import 'dart:convert';
import 'package:http/http.dart' as http;

class QuoteService {
  static Future<String> fetchRandomQuote() async {
    try {
      final url = Uri.parse('https://zenquotes.io/api/random');
      final response = await http.get(url);
      print('Estado: ${response.statusCode}');
      print('Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data[0]['q']; // Texto de la frase
      } else {
        throw Exception('Error desde la API');
      }
    } catch (e) {
      print('ERROR al cargar frase: $e');
      rethrow;
    }
  }
}
