#!/bin/bash
languages='latin,greek,sanskrit,hebrew,arabic,avestan,aramaic,coptic,tibetan,slavonic'
./generate_religious_langauges.lua "$languages" > '../common/scripted_triggers/20_sacred_language_triggers.txt'
./generate_religious_langauges2.lua "$languages" > '../common/scripted_effects/20_sacred_language_learn_effects.txt'
