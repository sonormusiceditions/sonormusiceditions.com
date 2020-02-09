---
---
$("header ul li a").each ->
  pathname = window.location.pathname
  if $(@).attr("href") in [pathname, pathname.slice(0,-1)]
    $(@).addClass "active"
  return