import 'package:flutter/material.dart';
import 'package:test_suitmedia/pages/second_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _palindrome = TextEditingController();

  bool _isPalindrome = false;

  void _checkPalindrome() {
    String name = _palindrome.text.toLowerCase().replaceAll('', '');
    String reverse = String.fromCharCodes(name.runes.toList().reversed);

    setState(() {
      _isPalindrome = name == reverse;
    });
    String message = _palindrome.text.isEmpty
        ? "Empty"
        : _isPalindrome
            ? 'isPalindrome'
            : 'not Palindrome';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Palindrome Check'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background.png"), fit: BoxFit.cover),
        ),
        child: ListView(children: [
          SizedBox(
            height: 200,
          ),
          Center(child: Image.asset('assets/ic_photo.png')),
          SizedBox(
            height: 40,
          ),
          TextField(
            controller: _name,
            decoration: InputDecoration(
              filled: true, //<-- SEE HERE
              fillColor: Colors.white,
              hintText: 'Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          TextField(
            controller: _palindrome,
            decoration: InputDecoration(
              filled: true, //<-- SEE HERE
              fillColor: Colors.white,
              hintText: 'Palindrome',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: _checkPalindrome,
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 41),
                backgroundColor: Color(0xFF2B637B), // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                )),
            child: const Text(
              'CHECK',
              style: TextStyle(fontSize: 14),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondPage(_name.text)),
              );
            },
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 41),
                backgroundColor: Color(0xFF2B637B), // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                )),
            child: const Text(
              'NEXT',
              style: TextStyle(fontSize: 14),
            ),
          )
        ]),
      ),
    );
  }
}
