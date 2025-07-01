import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:frases_flutter/models/quote.dart';

class QuoteService {
  static Future<Quote> fetchRandomQuote() async {
    try {
      final url = Uri.parse('https://zenquotes.io/api/random');
      final response = await http.get(url);
      print('Estado: ${response.statusCode}');
      print('Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final phrase = data[0]['q'];
        final author = data[0]['a'];
        return Quote(content: phrase, author: author);
      } else {
        throw Exception('Error desde la API');
      }
    } catch (e) {
      print('ERROR al cargar frase: $e');
      rethrow;
    }
  }
}
