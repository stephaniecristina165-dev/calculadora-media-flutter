import 'package:flutter/material.dart';
import '../models/aluno.dart';

class AlunoController {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController nota1Controller = TextEditingController();
  final TextEditingController nota2Controller = TextEditingController();
  final TextEditingController nota3Controller = TextEditingController();
  final TextEditingController nota4Controller = TextEditingController();
  final TextEditingController frequenciaController = TextEditingController();

  Aluno? alunoAtual;

  // Valida entradas e gera o objeto Aluno
  String? calcular() {
    final String nome = nomeController.text.trim();
    final double? n1 = double.tryParse(nota1Controller.text.replaceAll(',', '.'));
    final double? n2 = double.tryParse(nota2Controller.text.replaceAll(',', '.'));
    final double? n3 = double.tryParse(nota3Controller.text.replaceAll(',', '.'));
    final double? n4 = double.tryParse(nota4Controller.text.replaceAll(',', '.'));
    final double? freq = double.tryParse(frequenciaController.text.replaceAll(',', '.'));

    // Validação de preenchimento
    if (nome.isEmpty || n1 == null || n2 == null || n3 == null || n4 == null || freq == null) {
      return 'Por favor, preencha todos os campos com valores válidos.';
    }

    // Validação de intervalo das notas (0 a 10)
    final List<double> notas = [n1, n2, n3, n4];
    for (int i = 0; i < notas.length; i++) {
      if (notas[i] < 0 || notas[i] > 10) {
        return 'A ${i + 1}ª nota deve estar entre 0 e 10.';
      }
    }

    // Validação da frequência (0 a 100%)
    if (freq < 0 || freq > 100) {
      return 'A frequência deve estar entre 0% e 100%.';
    }

    // Sucesso: cria a instância do Aluno
    alunoAtual = Aluno(
      nome: nome,
      notas: notas,
      frequencia: freq,
    );

    return null; // Retorna null indicando que não há erros de validação
  }

  void limpar() {
    nomeController.clear();
    nota1Controller.clear();
    nota2Controller.clear();
    nota3Controller.clear();
    nota4Controller.clear();
    frequenciaController.clear();
    alunoAtual = null;
  }
}