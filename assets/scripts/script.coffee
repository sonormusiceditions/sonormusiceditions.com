---
---
$("header ul li a").each ->
  if $(@).text().toLocaleLowerCase("en-US") is $("body").attr "data-collection"
    $(@).addClass "active"
  return