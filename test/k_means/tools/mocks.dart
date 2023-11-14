import 'package:cluster_analysis/k_means/cluster_init/cluster_initialization_method.dart';
import 'package:cluster_analysis/common/similarity_measure/similarity_measure.dart';
import 'package:mocktail/mocktail.dart';

class MockSimilarityCalculator extends Mock implements SimilarityMeasure {}

class MockClusterInitializationMethod extends Mock
    implements ClusterInitializationMethod {}
