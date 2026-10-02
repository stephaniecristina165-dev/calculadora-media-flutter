import 'package:flutter/material.dart';
import '../models/aluno.dart';

class ResultadoCard extends StatelessWidget {
  final Aluno aluno;

  const ResultadoCard({super.key, required this.aluno});

  @override
  Widget build(BuildContext context) {
    final bool aprovado = aluno.situacao == 'Aprovado';

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Aluno: ${aluno.nome}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(height: 20),
            Text('Média: ${aluno.media.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
            Text('Maior Nota: ${aluno.maiorNota.toStringAsFixed(1)}', style: const TextStyle(fontSize: 16)),
            Text('Menor Nota: ${aluno.menorNota.toStringAsFixed(1)}', style: const TextStyle(fontSize: 16)),
            Text('Frequência: ${aluno.frequencia.toStringAsFixed(1)}%', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text(
              'Situação: ${aluno.situacao}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: aprovado ? Colors.green : Colors.red,
              ),
            ),
            if (aluno.pontosFaltantes > 0) ...[
              const SizedBox(height: 8),
              Text(
                'Pontos faltantes para aprovação: ${aluno.pontosFaltantes.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.orange,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}