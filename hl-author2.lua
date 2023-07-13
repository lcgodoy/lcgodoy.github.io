function citation(cite)
  -- Replace "Doe" with the surname of the author you want to highlight
  local highlight_author = "Godoy"
  
  for i, cite_item in ipairs(cite.citations) do
    for j, author in ipairs(cite_item.author) do
      local surname = author.family
      if surname == highlight_author then
	 cite_item.author[j].family = Pandoc.str(surname)
      end
    end
  end
  return cite
end

