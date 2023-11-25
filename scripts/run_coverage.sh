#!/bin/bash
dart run test --coverage="coverage"  
dart pub global run coverage:format_coverage --lcov --in=coverage --out=coverage/lcov.info  --report-on=lib
genhtml coverage/lcov.info -o coverage/html 
