class Aluno {
  String nome;
  List<double> notas;
  double frequencia;

  Aluno({
    required this.nome,
    required this.notas,
    required this.frequencia,
  });

  // Média simples das 4 notas
  double get media {
    if (notas.isEmpty) return 0.0;
    double soma = notas.reduce((a, b) => a + b);
    return soma / notas.length;
  }

  // Maior nota informada
  double get maiorNota {
    if (notas.isEmpty) return 0.0;
    return notas.reduce((a, b) => a > b ? a : b);
  }

  // Menor nota informada
  double get menorNota {
    if (notas.isEmpty) return 0.0;
    return notas.reduce((a, b) => a < b ? a : b);
  }

  // Regra de aprovação por frequência (mínimo 75%) e média (mínimo 7.0)
  bool get aprovadoPorFrequencia => frequencia >= 75.0;
  bool get aprovadoPorNota => media >= 7.0;

  String get situacao {
    if (!aprovadoPorFrequencia) {
      return 'Reprovado por Frequência (${frequencia.toStringAsFixed(1)}%)';
    } else if (aprovadoPorNota) {
      return 'Aprovado';
    } else {
      return 'Reprovado por Nota';
    }
  }

  // Pontos que faltam para atingir a média 7.0
  double get pontosFaltantes {
    if (media < 7.0) {
      return 7.0 - media;
    }
    return 0.0;
  }
}