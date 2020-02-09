---
---
$("header ul li a").each ->
  if window.location.pathname == $(@).attr("href") then $(@).addClass "active"
  return