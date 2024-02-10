import 'package:cluster_analysis/common/model/abstract_data_item.dart';
import 'package:test/test.dart';

void main() {
  test('toString returns expected format', () async {
    //arrange
    var values = [0.0, 1.0, 2.0, 3.0, 4.0];
    var abstractDataItem = AbstractDataItem(values: values);

    //act
    var textRepresentation = abstractDataItem.toString();

    //assert
    expect(textRepresentation, equals("[0.0,1.0,2.0,3.0,4.0]"));
  });
}
