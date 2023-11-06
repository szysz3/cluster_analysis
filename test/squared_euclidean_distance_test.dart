import 'package:flutter_test/flutter_test.dart';

import 'package:k_means/squared_euclidean_distance.dart';

void main() {
  late final SquaredEuclideanDistance squaredEuclideanDistance;

  setUpAll(() {
    squaredEuclideanDistance = SquaredEuclideanDistance();
  });

  test('calculate distance - not equal length of parameters', () {
    //arrange
    final data1 = [1, 2, 3];
    final data2 = [1, 2];

    //act & assert
    expect(() => squaredEuclideanDistance.calculate(data1, data2),
        throwsArgumentError);
  });

  test('calculate distance - correct distance between 2d points', () {
    //arrange
    final data1 = [1, 1];
    final data2 = [2, 2];

    // act
    final actual = squaredEuclideanDistance.calculate(data1, data2);

    //assert
    expect(actual, 2);
  });

  test('calculate distance - correct distance between 4d points', () {
    //arrange
    final data1 = [1, 2, 3, 4];
    final data2 = [0, 0, 0, 0];

    // act
    final actual = squaredEuclideanDistance.calculate(data1, data2);

    //assert
    expect(actual, 30);
  });

  test('calculate distance - correct distance between 2 the same points', () {
    //arrange
    final data1 = [0, 0];
    final data2 = [0, 0];

    // act
    final actual = squaredEuclideanDistance.calculate(data1, data2);

    //assert
    expect(actual, 0);
  });
}
