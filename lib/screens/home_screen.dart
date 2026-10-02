import 'package:flutter/material.dart';
import '../controllers/aluno_controller.dart';
import '../widgets/campo_nota.dart';
import '../widgets/resultado_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AlunoController _controller = AlunoController();

  void _exibirSnackBar(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _executarCalculo() {
    FocusScope.of(context).unfocus(); // Oculta o teclado
    final String? erro = _controller.calcular();

    if (erro != null) {
      _exibirSnackBar(erro);
    }

    setState(() {}); // Atualiza a UI para refletir as mudanças
  }

  void _executarLimpeza() {
    _controller.limpar();
    setState(() {});
    _exibirSnackBar('Campos limpos com sucesso!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo de Média Escolar'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller.nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome do Aluno',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: CampoNota(controller: _controller.nota1Controller, rotulo: 'Nota 1')),
                const SizedBox(width: 8),
                Expanded(child: CampoNota(controller: _controller.nota2Controller, rotulo: 'Nota 2')),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: CampoNota(controller: _controller.nota3Controller, rotulo: 'Nota 3')),
                const SizedBox(width: 8),
                Expanded(child: CampoNota(controller: _controller.nota4Controller, rotulo: 'Nota 4')),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _controller.frequenciaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Frequência (%)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.percent),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _executarCalculo,
                    child: const Text('Calcular'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: _executarLimpeza,
                    child: const Text('Limpar'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (_controller.alunoAtual != null)
              ResultadoCard(aluno: _controller.alunoAtual!),
          ],
        ),
      ),
    );
  }
}