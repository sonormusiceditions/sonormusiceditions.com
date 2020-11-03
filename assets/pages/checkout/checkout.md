---
permalink: /checkout
---

# Checkout

{% include karrello/cart.html %}

<div id="shipping-box">
  <h2>Shipping</h2>
  Select Shipping Zone:
  <select name="zone" id="zone">
    <option value="" disabled selected>Select shipping zone</option>
    {%- for zone in site.data.karrello.shipping -%}
    <option
      value="{{ zone[0] }}"
      data-few="{{ zone[1].few }}"
      data-many="{{ zone[1].many }}">{{ zone[1].name }} ({{ site.data.karrello.currency.symbol }}{{ zone[1].few }})</option>
    {%- endfor -%}
  </select>
  <h3>Shipping: € <span id="shipping"></span></h3>
  <h3>Total: € <span id="total"></span></h3>
  <div id="paypal-button"></div>
</div>