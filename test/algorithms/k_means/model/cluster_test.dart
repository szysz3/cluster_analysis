import 'package:cluster_analysis/cluster_analysis.dart';
import 'package:test/test.dart';

void main() {
  test('toString returns expected format', () async {
    //arrange
    var centroid = [0, 1, 2, 3, 4];
    var cluster = Cluster(centroid: centroid, label: "label");

    //act
    var textRepresentation = cluster.toString();

    //assert
    expect(textRepresentation, equals("[0,1,2,3,4]"));
  });
}
