import 'package:flutter/material.dart';
import 'animais.dart';

class Registrar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Registrar Animal',
        ),
      ),
      body: CadastroAnimal(),
    );
  }
}

class CadastroAnimal extends StatefulWidget {
  @override
  _CadastroAnimalState createState() => _CadastroAnimalState();
}

class _CadastroAnimalState extends State<CadastroAnimal> {
  final List<Animais> _animaisCadastrados = [];
  final _formKey = GlobalKey<FormState>();

  String _Animal = '';
  String _Raca = '';
  String _Idade = '';
  String _Nome = '';
  String _Tamanho = '';

  void adicionarAnimal(
      String animal, String raca, String idade, String nome, String tamanho) {
    setState(() {
      Animais animais = Animais(
          animal: animal,
          raca: raca,
          idade: idade,
          nome: nome,
          tamanho: tamanho);

      _animaisCadastrados.add(animais);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Animal',
                        labelStyle: TextStyle(color: Colors.white)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Qual o seu animal? (Ex: Cachorro, Gato)';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _Animal = value!.toString();
                    },
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Raca',
                        labelStyle: TextStyle(color: Colors.white)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Qual a raca do seu animal?';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _Raca = value!.toString();
                    },
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Idade',
                        labelStyle: TextStyle(color: Colors.white)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Qual a idade do seu animal?';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _Idade = value!.toString();
                    },
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Nome',
                        labelStyle: TextStyle(color: Colors.white)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Qual o nome do seu animal?';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _Nome = value!.toString();
                    },
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Tamanho',
                        labelStyle: TextStyle(color: Colors.white)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Qual o tamanho do seu animal';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _Animal = value!.toString();
                    },
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        adicionarAnimal(
                            _Animal, _Raca, _Nome, _Tamanho, _Idade);
                        _formKey.currentState!.reset();
                      }
                    },
                    child: const Text('Cadastrar'),
                  )
                ]),
          )
        ]),
      ),
    );
  }
}
