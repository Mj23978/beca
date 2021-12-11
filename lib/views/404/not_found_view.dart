import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

class NotFoundView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.black),
          onPressed: () {
            context.beamBack();
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '404',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 35),
            ElevatedButton(
              child: Text('Back to Home', style: TextStyle(fontSize: 20)),
              onPressed: () => context.beamToNamed('/'),
            )
          ],
        ),
      ),
    );
  }
}
