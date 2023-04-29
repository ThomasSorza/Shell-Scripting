#!/bin/bash

cat $(find -name .hidden)
find -name .hidden | xargs cat
