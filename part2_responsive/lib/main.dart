import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ResponsiveHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ResponsiveHomePage extends StatelessWidget {
  const ResponsiveHomePage({super.key});
static const bodyColor = Color(0xFFF8E287);
static const navigationColor = Color(0xFFC5ECCE);
static const paneColor = Color(0xFFEEE2BC);
  );

  static const _style = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  static const bodyWidget = Center(
    child: Text('Body', style: _style),
  );

  static const navigationWidget = Center(
    child: Text('Navigation', style: _style),
  );

  static const paneWidget = Center(
    child: Text('Pane', style: _style),
  );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: () {
          if (screenWidth < 600) {
            return const Text('Responsive UI - Phone');
          } else if (screenWidth < 840) {
            return const Text('Responsive UI - Tablet');
          } else if (screenWidth < 1200) {
            return const Text('Responsive UI - Landscape');
          } else {
            return const Text('Responsive UI - Large Desktop');
          }
        }(),
      ),
      body: () {
        if (screenWidth < 600) {
          return buildCompactScreen();
        } else if (screenWidth < 840) {
          return buildMediumScreen();
        } else if (screenWidth < 1200) {
          return buildExpandedScreen();
        } else {
          return buildLargeScreen();
        }
      }(),
    );
  }

  Widget buildCompactScreen() {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: colorCodes.body,
            child: bodyWidget,
          ),
        ),
        Container(
          height: 80,
          color: colorCodes.navigation,
          child: navigationWidget,
        ),
      ],
    );
  }

  Widget buildMediumScreen() {
    return Row(
      children: [
        Container(
          width: 80,
          color: colorCodes.navigation,
          child: navigationWidget,
        ),
        Expanded(
          child: Container(
            color: colorCodes.body,
            child: bodyWidget,
          ),
        ),
      ],
    );
  }

  Widget buildExpandedScreen() {
    return Row(
      children: [
        Container(
          width: 80,
          color: colorCodes.navigation,
          child: navigationWidget,
        ),
        Container(
          width: 360,
          color: colorCodes.body,
          child: bodyWidget,
        ),
        Expanded(
          child: Container(
            color: colorCodes.pane,
            child: paneWidget,
          ),
        ),
      ],
    );
  }

  Widget buildLargeScreen() {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: colorCodes.navigation,
            child: navigationWidget,
          ),
        ),
        Expanded(
          child: Container(
            color: colorCodes.body,
            child: bodyWidget,
          ),
        ),
        Expanded(
          child: Container(
            color: colorCodes.pane,
            child: paneWidget,
          ),
        ),
      ],
    );
  }
}