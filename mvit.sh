#!/bin/bash

for f in *_stanford_input.json; do

    rename 's/stanford_input.json/stanford_nlp/' $f

done
