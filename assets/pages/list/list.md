---
permalink: /list
---

# List
{% assign karrello = site.data.karrello %}

{%- for kc in karrello.collections -%}
  {%- assign sorted = site[kc] | where_exp: "item", "item.author != nil" | sort: date | reverse -%}
{{sorted|size}} Items
<table id="list">
  <thead>
    <tr>
      <th>Image</th>
      <th>Title<br>Author<br>Volume - Support</th>
      <th>Price</th>
      <th>Comandi</th>
    </tr>
  </thead>
  <tbody>
{% for item in sorted %}
{% comment %} -------------------- cover -------------------- {% endcomment %}
{%- assign folder = item.path | split: "/" | shift | pop -%}
{%- assign release_path = "" | split: "" | push: item.baseurl | push: item.collection | push: folder | join: "/" -%}
{% assign cover_path = release_path | append: "/0.jpg" %}
{% assign cover = item.image | default: cover_path %}
{% comment %} -------------------- supprt -------------------- {% endcomment %}
{%- assign support = item.support | downcase | default: "lp" -%}
{% comment %} -------------------- price -------------------- {% endcomment %}
{%- assign price = item.price | default: karrello.price[support].few | prepend: " " | prepend: karrello.currency.symbol -%}
{%- if item.soldout -%}{%- assign price = "soldout" -%}{%- endif -%}
{% comment %} -------------------- link -------------------- {% endcomment %}
{%- assign link = site.baseurl | append: item.url -%}
{%- assign github_link = "https://github.com/" | append: site.repository | append: "/edit/master/" | append: item.path -%}
{% comment %} -------------------- row -------------------- {% endcomment %}
    <tr>
      <td>{%- if page.collection == "merchandise" -%}<div class="merch-item" style="background-image:url({{ cover }})"></div>{%- else -%}<img src="{{ cover }}" alt="{{ release.title }}">{%- endif -%}
      </td>
      <td>{{item.title}}<br>
        <span class=arancio>{{item.author}}</span>
        <span class="giallo">{{item.volume}} - {{support|upcase}}</span></td>
      <td>{{price}}</td>
      <td>
        <a href="{{link}}">Pagina del sito</a><br><br>
        <a href="{{github_link}}">Edit on GitHub</a>
      </td>
    </tr>
{% endfor %}
  </tbody>
  <tfoot>
    <tr>
      <td colspan="4">End</td>
    </tr>
  </tfoot>
</table>
{%- assign future = site[kc] |where_exp: "item", "item.title != 'Catalog'"| sort: "date" -%}
{%- assign orphan = future | where_exp: "item", "item.date == nil" -%}

# orp
{% for o in orphan %}- {{ o.relative_path }}
{% endfor %}

{%- endfor -%}