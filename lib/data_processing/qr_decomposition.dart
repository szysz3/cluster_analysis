class QrDecomposition {
  final List<List<double>> covarianceMatrix;

  QrDecomposition({required this.covarianceMatrix});
}

class EigenValues {
  final List<double> values;

  EigenValues({required this.values});
}

class EigenVectors {
  final List<List<double>> vectors;

  EigenVectors({required this.vectors});
}
