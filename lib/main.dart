import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        title: Text('Book List', style: TextStyle(fontSize: 22)),
        centerTitle: true,
        backgroundColor: Colors.amber[900],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          CardWidget('Ar-Raheeq Al-Makhtum', 'Safiur Rahman Mubarakpuri', '4.7','download.jpg',
              'Ar-Raheeq Al-Makhtum is a seerah book, or biography of the Prophet(PBUH).This book was awarded first prize by the Saudi Government',10),
          CardWidget('Git & Github', 'Zakir Hossain', '4.5',
              'git.jpg','It is the first book on Git & Github that is written in Bangla.',5),
          CardWidget('Bangladesh: A Legacy of Blood', 'Anthony Mascarenhas', '4.2',
              'img.png','The book chronicles the bloody coups and uprisings in post-independence Bangladesh.',12),
          CardWidget('Double Standard 2.0', 'Dr. Shamsul Arefin Shakti', '4.9',
              'double.jpg','It is a compilation of stories in which modern fitna like feminism is criticized',9),

        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String bookName;
  final String authorName;
  final String bookRating;
  final String imageName;
  final String description;
  final double price;

  CardWidget(this.bookName, this.authorName, this.bookRating, this.imageName, this.description, this.price);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber[50],
      child: Column(
        children: [
          ListTile(
            leading: Image.asset('assets/images/$imageName'),
            title: Text(bookName, style: TextStyle(fontSize: 25)),
            subtitle: Text(authorName),
          ),
          ListTile(
            title: Text('Rating: $bookRating', style: TextStyle(fontSize: 20)),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondPage(bookName, authorName, imageName, description, price)),
              );
            },
            icon: Icon(Icons.shopping_cart),
            label: Text('Buy Now'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.amber[900]),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  final String bookName;
  final String authorName;
  final String imageName;
  final String description;
  final double price;

  SecondPage(this.bookName, this.authorName, this.imageName, this.description, this.price);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        title: Text('Buy Now'),
        backgroundColor: Colors.amber[900],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Book Name: ${widget.bookName}\n', style: TextStyle(fontSize: 20)),
            Image.asset('assets/images/${widget.imageName}'),
            Text('\nAuthor Name: ${widget.authorName}'),
            Text('\nShort Description: ${widget.description}'),
            Text('\nPrice: \$${widget.price}', style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              items: ['Real copy', 'Paper print', 'Black & white'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedOption = newValue;
                });
              },
              value: selectedOption,
              hint: Text('Select an option'),
            ),
            ElevatedButton(
              onPressed: () {
                // You can use the selectedOption here or perform any other action
                Navigator.pop(context);
              },
              child: Text('Go Back'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.amber[900]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
