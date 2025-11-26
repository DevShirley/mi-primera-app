import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Primera App Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Primera App Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final List<Color> _colors = [
    Colors.pinkAccent,
    Colors.lightBlueAccent,
    Colors.greenAccent,
    Colors.amberAccent,
    Colors.purpleAccent,
  ];

  final List<String> _messages = [
    "¡Sigue así que vas genial! 💪",
    "Cada clic es un paso más en tu aprendizaje 🚀",
    "¡Tu primera app va quedando brutal! ✨",
    "El código también es arte 🎨",
    "Aprender es avanzar, ¡bien hecho! 🌱",
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: _colors[_counter % _colors.length],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Imagen agregada
              Image.network(
                'https://i.imgur.com/BoN9kdC.png',
                width: 150,
              ),
              const SizedBox(height: 20),

              const Text(
                'Has presionado el botón:',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),

              Text(
                '$_counter',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.black),
              ),

              const SizedBox(height: 20),

              Text(
                _messages[_counter % _messages.length],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 40),

              AnimatedRotation(
                turns: _counter / 10,
                duration: const Duration(milliseconds: 400),
                child: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 50,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Incrementar',
        child: const Icon(Icons.add),
      ),
    );
  }
}