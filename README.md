![example workflow](https://github.com/github/docs/actions/workflows/dart.yml/badge.svg)


### Unit tests

Execute in main project dir (where pubpsec.yaml is located).

#### Install coverage package:

```
dart pub global activate coverage
```

#### Run unit tests with coverage:

```
dart run test --coverage="coverage"  
```

#### Collect raw coverage reports:

```
dart pub global run coverage:format_coverage --lcov --in=coverage --out=coverage/lcov.info  --report-on=lib
```

#### Generate html coverage report:

```
genhtml coverage/lcov.info -o coverage/html 
```
