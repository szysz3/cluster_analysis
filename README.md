### Unit tests

Execute in main project dir (where pubpsec.yaml is located).

#### Run unit tests with coverage:

```
flutter test --coverage . 
```

#### Generate coverage report:

```
genhtml coverage/lcov.info -o coverage/html 
```