---
---
{%- assign karrello = site.data.karrello -%}

# Return page
if $("body").data("title") is "thank-you"
  localStorage.clear("karrello")

# Get cart
cart = JSON.parse(localStorage.getItem("karrello") || "[]")

# Show items number
$("#cart-link span").html cart.length

# Buy box
if $("#buy_box").length
  # Get elements
  price = +$("#price").text()
  wholesale = +$("#wholesale").text()
  qt_wholesale = +{{ karrello.wholesale.price | default: 1000 }}
  # Get quantity event
  $("#quantity").on "change", ->
    qt = +$(@).val()
    prezzo = if qt < qt_wholesale then price * qt else wholesale * qt
    $("#subtotal").html prezzo.toFixed 2
    return
  # Populate
  found = cart.find (order) -> order.item is $("#item").text()
  if found
    $("#quantity").val(found.quantity)
    $("#quantity").trigger("change")
  # Add cart event
  $("#addcart").on "click", ->
    # Get order
    quantity = +$("#quantity").val()
    if quantity > 0
      # Remove old order
      if found
        cart = cart.filter(
          (item) => item.timestamp isnt found.timestamp
        )
      # New order
      ordine =
        item: $("#item").text()
        timestamp: Date.now().toString()
        price: if quantity < qt_wholesale then price else wholesale
        quantity: quantity
        link: $("#link").text()
        volume: $("#volume").text()
      # Save order
      cart.push ordine
      localStorage.setItem "karrello", JSON.stringify cart
      # Go to cart
      $("button, select").attr "disabled", "true"
      setInterval ->
        window.location = "{{ site.baseurl }}/cart"
        return
      , 1000
    return

# Cart table
if $("#cart").length
  # Remove shipping if empty cart
  if !cart.length then $("#shipping-box").remove()
  # Get elements
  table = $("#cart tbody")
  subtotal = 0
  el_subtotal = $("#subtotal")
  # Loop orders
  for ordine in cart
    # Update subtotal
    order_price = +(ordine.price * ordine.quantity).toFixed 2
    subtotal += order_price
    # Create table row
    row = $("<tr/>").append([
      $("<td/>").append([
        $("<a/>", {
          href: ordine.link
          text: ordine.item
        }),
        $("<span/>", { text: "Volume: #{ordine.volume}" }),
        $("<span/>", { text: "Prezzo: {{ karrello.currency.symbol }} #{ordine.price.toFixed 2}" }),
        $("<span/>", { text: "Quantity: #{ordine.quantity}" }),
      ]),
      $("<td/>", {
        text: "{{ karrello.currency.symbol }} #{order_price.toFixed 2}"
      }),
      $("<td/>").append(
        $("<a/>", {
          timestamp: ordine.timestamp
          order_price: order_price.toFixed 2
          text: "Remove item"
          href: "remove-item"
        })
      )
    ]).appendTo table
  # Display new subtotal
  el_subtotal.text subtotal.toFixed 2
  # Remove item event
  $("[href=remove-item]").on "click", (e) ->
    e.preventDefault()
    # Remove from storage
    cart = cart.filter(
      (item) => item.timestamp isnt $(e.target).attr("timestamp")
    )
    localStorage.setItem "karrello", JSON.stringify cart
    # Remove row
    $(e.target).closest("tr").remove()
    # Update items number
    $("#cart-link span").html +$("#cart-link span").text()-1
    # Update subtotal
    new_subtotal = +el_subtotal.text() - +$(e.target).attr("order_price")
    el_subtotal.html new_subtotal.toFixed 2
    # Update shipping
    $("#zone").trigger("change")
    return

if $("body").data("title") is "checkout"
  # Select zone event
  $("#zone").on "change", ->
    # Check if quantity is wholesale
    qt_total = cart.reduce ((acc, item) => +acc + +item.quantity), 0
    option = $(@).find("option:selected")
    shipping = if qt_total < {{ karrello.wholesale.shipping | default: 1000 }}
      option.data "few"
    else
      option.data "many"
    # Updated total
    $("#shipping").html shipping.toFixed 2
    total = +shipping + +$("#subtotal").text()
    $("#total").html total.toFixed 2
    # Create Paypal button
    script = "<script
      async
      src='{{ site.baseurl }}/assets/js/paypal-button.min.js?merchant={{ karrello.merchant }}'
      data-button='paynow'
      data-upload='1'
      data-host='www.paypal.com'
      data-return='{{site.baseurl}}/thankyou'
      data-rm='1'
      data-type='form'
      data-currency='{{ karrello.currency.code | default: EUR }}'
      data-handling_cart='#{shipping}' "
    for order, i in cart by -1
      k=i+1
      script += "data-item_name_#{k}='#{order.item}'
      data-amount_#{k}='#{order.price}'
      data-quantity_#{k}='#{order.quantity}'
      data-item_number_#{k}='#{order.volume}' "
    script += "></script>"
    $("#paypal-button")[0].innerHTML = script
    paypal.button.process $('#paypal-button')[0]
    return