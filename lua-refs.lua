function Pandoc (doc)
  local references = pandoc.utils.references(doc)
  doc.blocks = pandoc.Blocks{
    pandoc.Header(1, "Publications"),
    pandoc.Div({}, "OrderedList")
  }
  return pandoc.utils.citeproc(doc)
end
