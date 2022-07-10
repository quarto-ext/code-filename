

-- for code blocks w/ filename create an enclosing div:
-- <div class="code-with-filename">
--   <div class="code-with-filename-file">
--    filename.py
--   </div>
--   <div class="sourceCode" id="cb1" data-filename="filename.py">
--     <pre></pre>
--   </div>
-- </div>

function Blocks(blocks)

  -- transform ast for 'filename'
  local foundFilename = false
  local newBlocks = pandoc.List()
  for _,block in ipairs(blocks) do
    if block.t == "CodeBlock" and block.attributes["filename"] then
      local filenameDiv = pandoc.Div(
        { pandoc.Plain{ pandoc.Strong{pandoc.Str(block.attributes["filename"])}} } ,
        pandoc.Attr("", { "code-with-filename-file" })
      )
      newBlocks:insert(
        pandoc.Div(
          { filenameDiv, block },
          pandoc.Attr("", {"code-with-filename"})
        )
      )
      foundFilename = true
    else
      newBlocks:insert(block)
    end
  end

  -- if we found a file name then return the modified list
  -- of blocks and ensure our dependency w/ css is injected
  if foundFilename then
    quarto.doc.addHtmlDependency({
      name = "code-filename",
      version = "0.0.1",
      stylesheets = {"code-filename.css"}
    })
    return newBlocks
  else
    return blocks
  end
end
