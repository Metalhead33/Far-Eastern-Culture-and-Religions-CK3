#!/bin/bash
languages='latin,greek,sanskrit,hebrew,arabic,avestan,aramaic,coptic,tibetan,slavonic'
./generate_religious_langauges.lua triggers "$languages" > '../common/scripted_triggers/20_sacred_language_triggers.txt'
./generate_religious_langauges.lua effects "$languages" > '../common/scripted_effects/20_sacred_language_learn_effects.txt'
./generate_religious_langauges.lua doctrlocs "$languages" > '../localization/english/religion/sacred_language_doctrines_l_english.yml'
./addbom.sh ../common/scripted_triggers/*.txt
./addbom.sh ../common/scripted_effects/*.txt
./addbom.sh ../localization/english/religion/*yml
rm ../common/scripted_triggers/*'.txt~'
rm ../common/scripted_effects/*'.txt~'
rm ../localization/english/religion/*'yml~'
