import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text(
          'Nulla in laborum cillum id commodo non consequat enim laboris velit duis irure voluptate irure. Velit consectetur incididunt dolor eiusmod eu laboris ex mollit sunt nisi. Ex ex pariatur sunt exercitation deserunt dolor et pariatur eu nisi commodo. In nisi id aliqua sint esse velit enim. Exercitation consectetur ad labore ad. Cillum culpa laboris aliqua nulla enim reprehenderit minim ut est sit ullamco excepteur. Excepteur est consequat veniam ad duis duis commodo in ex in deserunt deserunt incididunt consectetur.',
        ),
        actions: [
          TextButton(onPressed: () => context.pop(), child: Text('Cancelar')),

          FilledButton(onPressed: () => context.pop(), child: Text('Aceptar'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbars y dialogs')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text(
                      'Incididunt mollit id dolore aliqua. Cillum magna est est pariatur do fugiat aliquip et ad. Irure nostrud eiusmod ex reprehenderit ullamco. Labore ea commodo enim sint.',
                    ),
                  ],
                );
              },
              child: const Text('Licencias usadas'),
            ),

            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar dialogo'),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
