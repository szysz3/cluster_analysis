import 'package:cluster_analysis/k_means/cluster_init/cluster_initialization_method.dart';
import 'package:cluster_analysis/k_means/distance/distance_calculator.dart';
import 'package:mocktail/mocktail.dart';

class MockDistanceCalculator extends Mock implements DistanceCalculator {}

class MockClusterInitializationMethod extends Mock
    implements ClusterInitializationMethod {}
