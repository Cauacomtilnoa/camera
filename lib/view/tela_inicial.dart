import 'dart:io';
import 'package:camera/controller/camera_controller.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  final CameraController cameraController = CameraController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Câmera e Salvamento de Foto'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: cameraController.camera.image == null
                  ? Text('Nenhuma imagem selecionada')
                  : Image.file(File(cameraController.camera.image!.path)),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                await cameraController.obterImagem(); // Aguarda a captura
                setState(() {}); // Atualiza a UI
              },
              label: Text('Ativar Câmera'),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                String? savedPath = null; // Limpa o caminho salvo
                savedPath = await cameraController.salvarImagem(); // Aguarda o salvamento
                setState(() {
                  if (savedPath != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Imagem salva em $savedPath'),
                      ),
                    );
                  }
                });
              },
              label: Text('Salvar Foto'),
            ),
          ],
        ),
      ),
    );
  }
}
