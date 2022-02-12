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

languages = arg[1]:split(",")
finalstring = "learn_sacred_language_effect = {"
for k,lang in pairs(languages) do
	if k == 1 then
	finalstring = finalstring .. "\n\tif = {\n\t\tlimit = {\n\t\t\tfaith = { has_doctrine = sacred_lang_" .. lang .. " }\n\t\t}\n\t\tlearn_language = language_" .. lang .. "\n\t}"
	else
	finalstring = finalstring .. "\n\telse_if = {\n\t\tlimit = {\n\t\t\tfaith = { has_doctrine = sacred_lang_" .. lang .. " }\n\t\t}\n\t\tlearn_language = language_" .. lang .. "\n\t}"
	end
end
finalstring = finalstring .. "\n}"
print(finalstring)
