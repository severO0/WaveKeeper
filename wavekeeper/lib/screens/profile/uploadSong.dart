import 'package:flutter/material.dart';

class UploadSongPage extends StatefulWidget {
  const UploadSongPage({Key? key}) : super(key: key);

  @override
  _UploadSongPageState createState() => _UploadSongPageState();
}

class _UploadSongPageState extends State<UploadSongPage> {
  String? imageUrl; // URL da imagem da música
  String? audioUrl; // URL do áudio ou caminho do arquivo
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  // Método fictício para upload de imagem
  Future<void> uploadImage() async {
    // Aqui você deve implementar o código para abrir o seletor de arquivos
    // e carregar a imagem, substituindo o valor abaixo por uma lógica real
    setState(() {
      imageUrl = 'https://via.placeholder.com/150';
    });
  }

  // Método fictício para upload de áudio
  Future<void> uploadAudio() async {
    // Aqui você deve implementar o código para abrir o seletor de arquivos
    // e carregar o áudio, substituindo o valor abaixo por uma lógica real
    setState(() {
      audioUrl = 'URL ou caminho do arquivo de áudio';
    });
  }

  // Método fictício para salvar a música
  void saveSong() {
    String name = nameController.text;
    String price = priceController.text;

    // Aqui você pode adicionar a lógica para salvar os detalhes da música
    // No momento, apenas exibimos os valores no console
    print('Nome: $name');
    print('Preço: $price');
    print('URL da Imagem: $imageUrl');
    print('URL/Arquivo de Áudio: $audioUrl');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Upload de Música'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.black],
              stops: [0.2, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Seção para upload da imagem
              const Text(
                'Imagem da Música',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: uploadImage,
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: imageUrl != null
                      ? Image.network(imageUrl!, fit: BoxFit.cover)
                      : const Center(
                          child: Text(
                            'Clique para adicionar uma imagem',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 20),
              // Seção para upload do áudio ou URL
              const Text(
                'Áudio da Música',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: uploadAudio,
                child: const Text('Upload de Áudio ou URL'),
              ),
              const SizedBox(height: 20),
              // Campo de texto para nome da música
              const Text(
                'Nome da Música',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Digite o nome da música',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Campo de texto para preço da música
              const Text(
                'Preço da Música',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Digite o preço da música',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Botão para salvar a música
              Center(
                child: ElevatedButton(
                  onPressed: saveSong,
                  child: const Text('Salvar Música'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
