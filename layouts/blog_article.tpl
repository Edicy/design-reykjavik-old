<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{{ page.langauage_code }}" lang="{{ page.language_code }}">

<head>
{% include "SiteHeader" %}
{{ blog.rss_link }}
  <title>{{article.title}} &laquo; {{page.title}} | {{site.name}}</title>
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
  <div id="content-inner" class="clearfix">
  <h1>
   {% editable article.title plain="true" %}
   <span class="date">{{ article.created_at | format_date:"short" }}</span>
  </h1>
  <h3>
   {{ article.author.name }} (<a href="{{ article.url }}#comments">{{"comments_for_count"|lc}}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span></a>)
  </h3>
  
  <!-- <img src="{{ images_path }}/author-{{ article.author.username }}.jpg" alt="{{ article.author.name }}" title="{{ article.author.name }}" align="left" /> -->

    <div class="clearfix" data-search-indexing-allowed="true">{% editable article.excerpt %}</div>
<div id="articlebody" class="clearfix" data-search-indexing-allowed="true">
                
  {% editable article.body %}
    </div>
</div>
                <div class="clearer"></div>
  {% commentform %}

  <a name="comment-form"></a>
  <a name="comments"></a>
  
  <table class="comment">
  <tr>
   <td colspan="2"><h2>{{"comments_for_count"|lc}}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span></h2></td>
  </tr>
  {% for comment in article.comments %}
  <tr class="edy-site-blog-comment">
   <td class="date" valign="top">{{ comment.created_at | format_date:"long" }}</td>
   <td valign="top">
    <span class="author">{{ comment.author }}:</span> {{ comment.body }} {% removebutton %}
   </td>
  
  </tr>
  {% endfor %}
  </table>{% unless comment.valid? %}<ul>
{% for error in comment.errors %}
<li>{{ error | lc }}</li>
{% endfor %}
</ul>{% endunless %}
    
  <table class="commentform">
  <tr>
   <td colspan="2"><h2>{{"add_a_comment"|lc}}</h2></td>
  </tr>
  <tr>
   <td>{{"name"|lc}}</td>
   <td><input type="text" name="comment[author]" class="text" value="{{comment.author}}" /></td>
  </tr>
  <tr>
   <td>{{"email"|lc}}</td>
  
   <td><input type="text" name="comment[author_email]" class="text" value="{{comment.author_email}}" /></td>
  </tr>
  <tr>
   <td valign="top">{{"comment"|lc}}</td>
   <td><textarea name="comment[body]" cols="15" rows="5">{{comment.body}}</textarea></td>
  </tr>
  <tr>
   <td></td>
  
   <td><input type="submit" value="{{"submit"|lc}}" /></td>
  </tr>
  
  </table>
  {% endcommentform %}
              
	</div>
    <div class="login" id="edicy">
     {% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}
    </div>

{% unless editmode %}{{ site.analytics }}{% endunless %}
</div>
      {% include "JS" %}
</body>
</html>