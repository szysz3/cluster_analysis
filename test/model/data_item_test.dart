import 'package:flutter_test/flutter_test.dart';
import 'package:k_means/model/data_item.dart';

void main() {
  test('data item - copyWith method returns new object', () {
    //arrange
    final data = [1, 2, 3];
    final newData = [1, 2, 3];

    const clusterIndex = 1;
    const newClusterIndex = 2;

    final dataItem = DataItem(data: data, clusterIndex: clusterIndex);

    //act
    DataItem newDataItem =
        dataItem.copyWith(data: newData, clusterIndex: newClusterIndex);

    //assert
    expect(newDataItem == dataItem, false);
    expect(newDataItem.data, equals(newData));
    expect(newDataItem.clusterIndex, equals(newClusterIndex));
  });
}
