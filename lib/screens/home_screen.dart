import 'package:flutter/material.dart';
import '../models/quote.dart';
import '../services/quote_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Quote? _quote;
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _loadQuote();
  }

  Future<void> _loadQuote() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    try {
      final quote = await QuoteService.fetchRandomQuote();
      setState(() {
        _quote = quote;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String displayText;

    if (_isLoading) {
      displayText = 'Cargando frase...';
    } else if (_hasError || _quote == null) {
      displayText = 'Error al cargar la frase 😢';
    } else {
      displayText = '${_quote!.content}\n\n— ${_quote!.author}';
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Frases Aleatorias')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: _isLoading
              ? const CircularProgressIndicator()
              : _hasError || _quote == null
              ? const Text(
            'Error al cargar la frase 😢',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          )
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '\"${_quote!.content}\"',
                style: const TextStyle(
                  fontSize: 22,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24), // espacio entre frase y autor
              Text(
                '— ${_quote!.author}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _loadQuote,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
