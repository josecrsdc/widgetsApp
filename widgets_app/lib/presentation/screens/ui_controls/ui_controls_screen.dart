import 'package:flutter/material.dart';

class UIControlsScreen extends StatelessWidget {

  static const String name = 'ui_controls_screen';

  const UIControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),

      body: _UiControlsView(),

    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation {car, plane, boat, submarine}

class _UiControlsViewState extends State<_UiControlsView> {

  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDeveloper, 
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          })
        ),

        

        RadioListTile(
          title: const Text('By car'),
          subtitle: const Text('Viajar por carro'),
          value: Transportation.car,
          groupValue: selectedTransportation,
          onChanged: (value) => setState(() {
            selectedTransportation = Transportation.car;
          }),
        ),
        RadioListTile(
          title: const Text('By boat'),
          subtitle: const Text('Viajar por barco'),
          value: Transportation.boat,
          groupValue: selectedTransportation,
          onChanged: (value) => setState(() {
            selectedTransportation = Transportation.boat;
          }),
        ),
        RadioListTile(
          title: const Text('By plane'),
          subtitle: const Text('Viajar por avión'),
          value: Transportation.plane,
          groupValue: selectedTransportation,
          onChanged: (value) => setState(() {
            selectedTransportation = Transportation.plane;
          }),
        ),
        RadioListTile(
          title: const Text('By submarine'),
          subtitle: const Text('Viajar por submarino'),
          value: Transportation.submarine,
          groupValue: selectedTransportation,
          onChanged: (value) => setState(() {
            selectedTransportation = Transportation.submarine;
          }),
        ),


      ],
    );
  }
}