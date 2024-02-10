List<List<double>> calculateCovarianceMatrix(List<List<double>> data) {
  final rowCount = data.length;
  final colCount = data[0].length;

  List<List<double>> covarianceMatrix =
      List.generate(colCount, (i) => List<double>.filled(colCount, 0));

  List<double> means = List<double>.generate(colCount, (index) {
    return data.map((row) => row[index]).reduce((a, b) => a + b) / rowCount;
  });

  for (int i = 0; i < colCount; i++) {
    for (int j = i; j < colCount; j++) {
      double covariance = 0;
      for (int k = 0; k < rowCount; k++) {
        covariance += (data[k][i] - means[i]) * (data[k][j] - means[j]);
      }
      covariance /= rowCount - 1; // // Unbiased estimator for sample covariance
      covarianceMatrix[i][j] = covariance;
      covarianceMatrix[j][i] = covariance;
    }
  }

  return covarianceMatrix;
}

List<List<double>> multiplyMatricies(
    List<List<double>> matrixA, List<List<double>> matrixB) {
  final matrixARowCount = matrixA.length;
  final matrixAColCount = matrixA[0].length;
  final matrixBColCount = matrixB[0].length;

  final result = List.generate(matrixARowCount, (_) {
    return List.filled(matrixBColCount, 0.0);
  });

  for (int i = 0; i < matrixARowCount; ++i) {
    for (int j = 0; j < matrixBColCount; ++j) {
      for (int k = 0; k < matrixAColCount; ++k) {
        result[i][j] += matrixA[i][k] * matrixB[k][j];
      }
    }
  }

  return result;
}

List<List<double>> extractColumnsFromMatrix(
    List<List<double>> matrix, List<int> columnIndexes) {
  final matrixRowCount = matrix.length;
  final targetColCount = columnIndexes.length;

  final result = List.generate(matrixRowCount, (_) {
    return List.filled(targetColCount, 0.0);
  });

  for (int i = 0; i < matrixRowCount; ++i) {
    for (int j = 0; j < targetColCount; ++j) {
      final c = columnIndexes[j];
      result[i][j] = matrix[i][c];
    }
  }
  return result;
}

List<List<double>> transposeMatrix(List<List<double>> matrix) {
  final matrixRowCount = matrix.length;
  final matrixColCount = matrix[0].length;

  final result = List.generate(matrixColCount, (_) {
    return List.filled(matrixRowCount, 0.0);
  });

  for (int i = 0; i < matrixRowCount; ++i) {
    for (int j = 0; j < matrixColCount; ++j) {
      result[j][i] = matrix[i][j];
    }
  }
  return result;
}
