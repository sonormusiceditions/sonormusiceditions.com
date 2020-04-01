---
---

# Navigation active class
$("header ul li a").each ->
  if $(@).text().toLocaleLowerCase("en-US") is $("body").attr "data-collection"
    $(@).addClass "active"
  return

# Iframe width
iw = $("iframe").css("width")
at = $("iframe").attr("width")
h1 = $("h1").css("width")
console.log at, iw, h1
if at is "100%" or iw is h1
  $(".gallery").css "padding-left", "1px"

# Gallery images
errors = 0
$(".gallery img").each () ->
  $(@).on "error", () ->
    errors += 1
    if errors == 10 then $(".gallery").remove()
    true
  true