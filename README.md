![example workflow](https://github.com/szysz3/cluster_analysis/actions/workflows/dart.yml/badge.svg)
[<img src="https://szysz3.github.io/cluster_analysis/badge_linecoverage.svg">](https://szysz3.github.io/cluster_analysis/)
# cluster_analysis
Cluster analysis playground. Set of algorithms and tools implemented just for fun (and learning purposes).

## Unit tests

Execute in main project dir (where pubpsec.yaml is located).

#### Install dependencies:

##### coverage:

```
dart pub global activate coverage
```

##### lcov:

```
brew install lcov
```
or
```
apt-get install lcov
```

#### Run unit tests with coverage:

```
./scripts/run_coverage.sh 
```