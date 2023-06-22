import 'package:flutter/material.dart';
import 'animais.dart';
import 'registro.dart';

class VerAnimais extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Animais Cadastrados',
        ),
      ),
      body: Ver(),
    );
  }
}

class Ver extends StatefulWidget {
  @override
  _VerAnimalState createState() => _VerAnimalState();
}

class _VerAnimalState extends State<Ver> {
  void _removerAnimal(int index) {
    showDialog(
      context: context,
      builder: (BuildContext (context) {
        return AlertDialog(
          title: const Text('Excluir Usuario'),
          content: const Text('Tem certeza que deseja excluir este usuario?'),
          actions: <Widget>[
            TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text ('Cancelar'),), TextButton(onPressed: () {
              setState(() {
                _animalCadastrado.removeAt(index);
              });
              Navigator.of(context).pop(true)
            }, child: const Text('Confirmar'))
          ],
        );
      })
    )
  }

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: _animaisCadastrados.length,
      itemBuilder: (context, index) {
        final animal = _animaisCadastrados[index];
        return ListTile(
          title: Text('Nome: ${animal.nome}'),
          subtitle: Text('Animal: ${animal.animal}'),
        );
      }
    )
  }
}
