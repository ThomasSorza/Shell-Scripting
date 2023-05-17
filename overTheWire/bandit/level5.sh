#!/bin/bash

find -readable -size 1033c ! -executable | xargs cat | xargs
