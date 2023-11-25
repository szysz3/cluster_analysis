import 'package:cluster_analysis/data_processing/tools.dart';
import 'package:test/test.dart';

void main() {
  test('calcualte covariance matrix for given values', () {
    //arrange
    final data1 = [64.0, 580.0, 29.0];
    final data2 = [66.0, 570.0, 33.0];
    final data3 = [68.0, 590.0, 37.0];
    final data4 = [69.0, 660.0, 46.0];
    final data5 = [73.0, 600.0, 55.0];
    final dataItems = List.of([
      data1,
      data2,
      data3,
      data4,
      data5,
    ]);

    final expectedData1 = [11.50, 50.00, 34.75];
    final expectedData2 = [50.00, 1250.00, 205.00];
    final expectedData3 = [34.75, 205.00, 110.00];
    //act
    var result = covarianceMatrix(dataItems);

    //assert
    expect(result.length == 3, isTrue);
    expect(result[0], equals(expectedData1));
    expect(result[1], equals(expectedData2));
    expect(result[2], equals(expectedData3));
  });
}
