import 'package:flutter/material.dart';
import 'quotes.dart';

void main() {
  runApp(MaterialApp(
    home: QuoteList(),
  ));
}

class QuoteList extends StatefulWidget {
  const QuoteList({Key? key}) : super(key: key);

  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  // List<Quote> quotes = [
  //   Quote(
  //       author: 'Oscar Wilde',
  //       text: 'Be yourself; everyone else is already taken'),
  //   Quote(
  //       author: 'Oscar Wilde',
  //       text: 'I have nothing to declare except my genius'),
  //   Quote(
  //       author: 'Oscar Wilde',
  //       text: 'The truth is rarely pure and never simple')
  // ];

  List<String> quotes = [
    'this is another quote',
    'this a quote',
    'this is also another quote',
    'this is another quote',
    'this a quote',
    'this is also another quote',
  ];

  Widget quoteTemplate(quote) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quote,
              style: TextStyle(fontSize: 15.0, color: Colors.grey[800]),
            ),
            SizedBox(height: 20.0),
            FlatButton.icon(
                onPressed: () {
                  setState(() {
                    quotes.remove(quote);
                  });
                },
                icon: Icon(Icons.delete),
                label: Text("Delete")
                // SizedBox(
                //   height: 10.0,
                // ),
                // Text(
                //   quote.author,
                //   style: TextStyle(fontSize: 12.0, color: Colors.grey[700]),
                )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Awesome Quotes"),
        centerTitle: true,
        backgroundColor: Colors.amber[600],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: quotes.map((quote) {
          return quoteTemplate(quote);
        }).toList(),
      ),
    );
  }
}
