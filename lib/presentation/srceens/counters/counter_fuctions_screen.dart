import 'package:flutter/material.dart';

class CounterFuctionScreen extends StatefulWidget {
  const CounterFuctionScreen({super.key});

  @override
  State<CounterFuctionScreen> createState() => _CounterFuctionScreenState();
}

class _CounterFuctionScreenState extends State<CounterFuctionScreen> {
  int clickCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Prueba')),
        actions: [
          IconButton(
              icon: const Icon(Icons.refresh_rounded),
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$clickCounter',
              style:
                  const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
            ),
            Text(
              'click${clickCounter == 1 ? '' : 's'}',
              style: const TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          costumButton(
            icon: Icons.refresh_rounded,
            onpress: () {
              setState(() {
                clickCounter = 0;
              });
            },
          ),
          const SizedBox(height: 15),
          costumButton(
            icon: Icons.exposure_minus_1_outlined,
            onpress: () {
              if (clickCounter == 0) return;
              setState(() {
                clickCounter--;
              });
            },
          ),
          const SizedBox(height: 15),
          costumButton(
            icon: Icons.plus_one,
            onpress: () {
              setState(() {
                clickCounter++;
              });
            },
          ),
        ],
      ),
    );
  }
}

class costumButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onpress;

  const costumButton({
    super.key,
    required this.icon,
    this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      //   // esto es para que no se vaya hacia los numeros negativos, estando en 0 retorna al valor inicial que es 0
      onPressed: onpress,
      child: Icon(icon),
    );
  }
}
