<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
{% include "SiteHeader" %}
{{ blog.rss_link }}
  <title>{{site.name}} &raquo; {{page.title}}</title>
</head>

<body>
<div id="wrap">
<div id="search" class="clearfix">
{% if site.search.enabled %}<form action="">
<div>
<input type="text" id="onpage_search"/>
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
    {% unless site.root_item.hidden? %}<a href="{{site.root_item.url}}"{% if site.root_item.selected? %} class="active"{% endif %}>{{site.root_item.title}}</a>{% endunless %}{% for item in site.visible_menuitems %}<a href="{{item.url}}"{% if item.selected? %} class="active"{% endif %}{% unless item.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}>{{item.title}}</a>{% endfor %} {% menubtn site.hidden_menuitems %}{% menuadd %}
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
  <div id="content-inner">
    {% addbutton class="add-article" %}
  {% for article in articles %}
  <h1>
   <a href="{{ article.url }}">{{ article.title }}</a>
   <span class="date">{{ article.created_at | format_date:"short" }}</span>
  </h1>
  <h3>
   {{ article.author.name }} (<a href="{{ article.url }}#comments">{{"comments_for_count"|lc}}: {{ article.comments_count }}</a>)
  </h3>
  
  <!-- <img src="{{ images_path }}/author-{{ article.author.username }}.jpg" alt="{{ article.author.name }}" title="{{ article.author.name }}" align="left" /> -->
    <div class="clearfix">{{ article.excerpt }} <a href="{{ article.url }}">{{ "read_more" |lc }}</a></div>
  <hr class="blogseparator"/>
{% endfor %}
</div>

</div>
    <div class="login" id="edicy">
     {% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}
    </div>

{% unless editmode %}{{ site.analytics }}{% endunless %}
</div>
      {% include "JS" %}
</body>
</html>