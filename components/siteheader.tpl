   <meta name="keywords" content="{{ page.keywords }}" />
   <meta name="description" content="{{ page.description }}" />
          <meta name="copyright" content="{{ site.copyright }}" />
   <meta name="author" content="{{ site.author }}" />
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	{% stylesheet_link "style.css?reykjavik" %}
	{% if editmode %}<link href="{{ site.static_asset_host }}/assets/admin/editmode.css" media="screen" rel="stylesheet" type="text/css">{% endif %}

    <link rel="icon" href="/favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" href="/favicon.ico" type="image/ico" />
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
{% if site.search.enabled %}
	{% stylesheet_link "assets/site_search/2.0/site_search.css" static_host="true" %}
        {% endif %}
<!--[if IE 7]>
<style>
.menu li {
float: none;
display: inline;
}
</style>
<![endif]-->
<!--[if lt IE 7]>{% stylesheet_link "ie.css" %}<![endif]-->

<!--[if IE]><link rel="stylesheet" type="text/css" href="http://static.edicy.com/assets/ie.css" /><![endif]-->
<meta name="viewport" content="initial-scale=1" />