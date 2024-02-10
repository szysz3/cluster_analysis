import 'package:cluster_analysis/algorithms/dbscan/tools.dart';
import 'package:cluster_analysis/common/model/abstract_data_item.dart';
import 'package:test/test.dart';

void main() {
  test('toDataItem method returns valid DataItem object', () async {
    //arrange
    var data = [
      AbstractDataItem(values: [0, 0]),
      AbstractDataItem(values: [1, 1]),
      AbstractDataItem(values: [100, 100]),
      AbstractDataItem(values: [101, 101]),
    ];
    //act
    var dataItems = data.map((e) => e.toDataItem()).toList();

    //assert
    expect(dataItems.length, equals(4));
    expect(dataItems[0].values, [0, 0]);
    expect(dataItems[1].values, [1, 1]);
    expect(dataItems[2].values, [100, 100]);
    expect(dataItems[3].values, [101, 101]);
  });
}
