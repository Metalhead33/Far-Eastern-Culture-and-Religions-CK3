#!/bin/env lua
-- Origins: https://stackoverflow.com/a/5032014
function string:split(delimiter)
  local result = { }
  local from  = 1
  local delim_from, delim_to = string.find( self, delimiter, from  )
  while delim_from do
    table.insert( result, string.sub( self, from , delim_from-1 ) )
    from  = delim_to + 1
    delim_from, delim_to = string.find( self, delimiter, from  )
  end
  table.insert( result, string.sub( self, from  ) )
  return result
end

function triggers(languages)
	local finalstring = "speaks_sacred_language_trigger = {\n\tOR = {\n\t\tfaith = { has_doctrine = sacred_lang_none }"
	for k,lang in pairs(languages) do
		finalstring = finalstring .. "\n\t\tAND = {\n\t\t\tfaith = { has_doctrine = sacred_lang_" .. lang .. " }\n\t\t\tknows_language = language_" .. lang .. "\n\t\t}"
	end
	finalstring = finalstring .. "\n\t}\n}"
	return finalstring
end

function effects(languages)
	local finalstring = "learn_sacred_language_effect = {"
	for k,lang in pairs(languages) do
		if k == 1 then
		finalstring = finalstring .. "\n\tif = {\n\t\tlimit = {\n\t\t\tfaith = { has_doctrine = sacred_lang_" .. lang .. " }\n\t\t}\n\t\tlearn_language = language_" .. lang .. "\n\t}"
		else
		finalstring = finalstring .. "\n\telse_if = {\n\t\tlimit = {\n\t\t\tfaith = { has_doctrine = sacred_lang_" .. lang .. " }\n\t\t}\n\t\tlearn_language = language_" .. lang .. "\n\t}"
		end
	end
	finalstring = finalstring .. "\n}"
	return finalstring
end
function doctrlocs(langauges)
	local finalstring = "l_english:"
	for k,lang in pairs(langauges) do
		finalstring = finalstring .. "\n sacred_lang_" .. lang .. "_name:0 \"$language_" .. lang .. "_name$\""
		finalstring = finalstring .. "\n sacred_lang_" .. lang .. "_desc:0 \"Our faith's sacred [language|e] is $language_".. lang .. "_name$ - it is the tongue in which all that is holy is to be written down and preached to the masses.\""
	end
	return finalstring
end


langargs = arg[2]:split(",")

if arg[1] == "triggers" then
	print(triggers(langargs))
elseif arg[1] == "effects" then
	print(effects(langargs))
elseif arg[1] == "doctrlocs" then
	print(doctrlocs(langargs))
end
