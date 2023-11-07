import 'package:flutter_test/flutter_test.dart';
import 'package:k_means/cluster.dart';

void main() {
  test('cluster - copyWith method returns new object', () {
    //arrange
    final centroid = [1, 2, 3];
    final newCentroid = [1, 2, 3];

    const label = 'label';
    const newLabel = 'label2';

    final cluster = Cluster(label: label, centroid: centroid);

    //act
    Cluster newCluster =
        cluster.copyWith(label: newLabel, centroid: newCentroid);

    //assert
    expect(newCluster == cluster, false);
    expect(newCluster.label, equals(newLabel));
    expect(newCluster.centroid, equals(newCentroid));
  });
}
