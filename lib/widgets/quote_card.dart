import 'package:flutter/material.dart';
import '../models/quote.dart';

class QuoteCard extends StatelessWidget{

  final Quote quote;

  const QuoteCard({super.key, required this.quote});


  @override
  Widget build(BuildContext context) {

  return Column(
    children: [
      Text(
        '"${quote.content}"',
        style: const TextStyle(
          fontSize: 22,
          fontStyle: FontStyle.italic,
        ),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 24),
      Text(
        '— ${quote.author}',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    ],
  );
  }
}