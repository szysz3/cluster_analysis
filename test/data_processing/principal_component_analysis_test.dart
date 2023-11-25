import 'package:cluster_analysis/common/model/abstract_data_item.dart';
import 'package:cluster_analysis/data_processing/principal_component_analysis.dart';
import 'package:test/test.dart';

void main() {
  test('test - in progress', () async {
    //arrange
    var data = List<AbstractDataItem>.of([
      AbstractDataItem(values: List.of([1, 1])),
      AbstractDataItem(values: List.of([3, 3])),
      AbstractDataItem(values: List.of([10, 55])),
    ]);

    // act
    var pca = PrincipalComponentAnalysis();
    pca.calculate(data);

    // assert
  });
}
