import 'package:collection/collection.dart';

double calculateMeanValue(List<num> values) {
  return values.sum / values.length;
}

List<List<double>> calculateCovarianceMatrix(List<List<double>> data) {
  int rowCount = data.length;
  int colCount = data[0].length;

  // Initialize covariance matrix with zeros
  List<List<double>> covarianceMatrix =
      List.generate(colCount, (i) => List<double>.filled(colCount, 0));

  // Calculate means for each column
  List<double> means = List<double>.generate(colCount, (index) {
    return data.map((row) => row[index]).reduce((a, b) => a + b) / rowCount;
  });

  // Calculate covariance values
  for (int i = 0; i < colCount; i++) {
    for (int j = i; j < colCount; j++) {
      double covariance = 0;
      for (int k = 0; k < rowCount; k++) {
        covariance += (data[k][i] - means[i]) * (data[k][j] - means[j]);
      }
      covariance /= rowCount - 1; // // Unbiased estimator for sample covariance
      covarianceMatrix[i][j] = covariance;
      covarianceMatrix[j][i] = covariance; // Covariance matrix is symmetric
    }
  }

  return covarianceMatrix;
}
