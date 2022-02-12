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
finalstring = "speaks_sacred_language_trigger = {\n\tOR = {\n\t\tfaith = { has_doctrine = sacred_lang_none }"
for k,lang in pairs(languages) do
	finalstring = finalstring .. "\n\t\tAND = {\n\t\t\tfaith = { has_doctrine = sacred_lang_" .. lang .. " }\n\t\t\tknows_language = language_" .. lang .. "\n\t\t}"
end
finalstring = finalstring .. "\n\t}\n}"
print(finalstring)
