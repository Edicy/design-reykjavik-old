<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{{ page.langauage_code }}" lang="{{ page.language_code }}">

<head>
{% include "SiteHeader" %}
  <title>{{site.name}} &raquo; {{page.title}}</title>
</head>

<body>
<div id="wrap">
<div id="search" class="clearfix">
{% if site.search.enabled %}<form action="" class="edys-search">
<div>
<input type="text" id="onpage_search" placeholder="{{  "search" | lc }}"/>
</div>
</form>
{% endif %}
</div>
<div class="langmenu clearfix">
       {% if editmode %}

    <ul>

        {% for language in site.languages %}

             <li><a href="{{ language.url }}" {% if language.selected? %}class="active"{% endif %}>{{ language.title }}</a></li>

        {% endfor %}

        <li>{%languageadd%}</li>

    </ul>

{% else %}

    {% if site.has_many_languages? %}

        <ul>

            {% for language in site.languages %}

                 <li><a href="{{ language.url }}" {% if language.selected? %}class="active"{% endif %}>{{ language.title }}</a></li>

            {% endfor %}

        </ul>

    {% endif %}

{% endif %}
  </div>


<div class="intro">
  <div class="menu">
<!--ul class="main">
    <li><a href="{{ site.root_item.url }}"{% if site.root_item.current? %} class="active"{% endif %}>{{site.root_item.title}}</a></li>
    {% for item in site.all_menuitems %}<li{% unless item.translated? %} class="untranslated"{% endunless %}><a href="{{ item.url }}"{% if item.selected? %} class="active"{% endif %} {% unless item.translated? %}class="fci-editor-menuadd"{% endunless %}>{{ item.title }}</a></li>{% endfor %}{% if editmode %}<li>{% menuadd %}</li>{% endif %}
   </ul-->
    {% unless site.root_item.hidden? %}<a href="{{site.root_item.url}}"{% if site.root_item.selected? %} class="active"{% endif %}>{{site.root_item.title}}</a>{% endunless %}{% for item in site.visible_menuitems %}<a href="{{item.url}}"{% if item.selected? %} class="active"{% endif %}{% unless item.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}>{{item.title}}</a>{% endfor %}{% menubtn site.hidden_menuitems %}{% menuadd %}
                        <div class="clearer"></div>
  {% for item in site.all_menuitems %}
  {% if item.selected? %}
  {% if editmode %}
   <div class="sub">{% for level2 in item.visible_children %}
    <a href="{{ level2.url }}" {% unless level2.translated? %}class="fci-editor-menuadd"{% endunless %} {% if level2.selected? %} class="active"{% endif %}>{{ level2.title }}</a>
    {% endfor %}
      {% menubtn item.hidden_children %}
    {% menuadd parent="item" %}
   </div><div class="clearer"></div>
  {% else %}
  {% if item.children? %}
   <div class="sub">{% for level2 in item.all_children %}
    <a href="{{ level2.url }}" {% unless level2.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}{% if level2.selected? %} class="active"{% endif %}>{{ level2.title }}</a>
    {% endfor %}
   </div><div class="clearer"></div>
  {% endif %}
  {% endif %}
  {% endif %}
  {% endfor %}
  </div>
         <div id="content-inner" class="clearfix" data-search-indexing-allowed="true">
{% content %}
         </div>
         <div class="clearer"></div>
</div>
    <div class="login" id="edicy">
     {% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}
    </div>

{% unless editmode %}{{ site.analytics }}{% endunless %}
</div>
      {% include "JS" %}
</body>
</html>
