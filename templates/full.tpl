<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Full Hierarchy - {{ sitename }}</title>
    <meta name="description" content="Schema.org is a set of extensible schemas that enables webmasters to embed
    structured data on their web pages for use by search engines and other applications." />
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="/docs/themes/default/style.min.css" />
	<script src="/docs/jstree.min.js"></script>    
    <link rel="stylesheet" type="text/css" href="/docs/schemaorg.css" />

<script type="text/javascript">
$(document).ready(function(){
		$('#thing_tree').jstree({"state" : { "key" : "thing_tree" }, plugins : [ "html_data", "state" ]});
		$('#thing_tree').on('ready.jstree', function (e, data) {
	    	$('#thing_tree').jstree("open_all");
	    	$('#thing_tree').jstree("deselect_all");			
		});			

		$('#datatype_tree').jstree({"state" : { "key" : "datatype_tree" }, plugins : [ "html_data", "state"]});
		$('#datatype_tree').on('ready.jstree', function (e, data) {
	    	$('#datatype_tree').jstree("open_all");
	    	$('#datatype_tree').jstree("deselect_all");			
		});			

		//$("#thing_tree .jstree-last .jstree-icon").first().hide();
		//$("#datatype_tree .jstree-last .jstree-icon").first().hide();
		
		$('.typetree').on("activate_node.jstree", function (e, data) {
			var href = data.node.a_attr.href;
			document.location.href = href;
			return false;
		});

		$("#thing_tree").on("after_open.jstree", checkState);
 	    $("#viewsel").on('change', checkState);
		
 
 });	
 
 function checkState(){
   var core = $("#coreCheck").is(':checked');
   var ext = $("#extCheck").is(':checked');
   var extsel = "";
   $( "#extentions option:selected" ).each(function() {
         extsel += $( this ).val() + " ";
       });
	   		
	$("#thing_tree .sdorow").show();

	var sel = "";
	if(core && !ext){
		sel = '.sdo-ext:not(.sdo-core)';			
	}else if(!core && ext){
		sel = '.sdo-core:not(.' + extsel + ')';
	}else if(core && ext){
		sel = ':not(.sdo-core):not(.' + extsel + ')';
	}else if(!core && !sel){
		sel = ':not(.sdorootrow)';
	}

	$("#thing_tree .sdorow" + sel).hide();
	$('#thing_tree').jstree("redraw");	
 }
	
</script>
</head>
<body style="text-align: left;">

{% include 'basicPageHeader.tpl' with context %}

<div style="margin-left: 8%; margin-right: 8%">

<h3>Full Hierarchy</h3>

<p>
Schema.org is defined as two hierarchies: one for textual property values, and one for the things that they describe. 
</p> 

<h4>Thing</h4>

<p>This is the main schema.org hierarchy: a collection of types (or "classes"), each of which has one or more parent types. Although a type may have more than one super-type, here we show each type in one branch of the tree only. There is also a parallel hierarchy for <a href="#datatype_tree">data types</a>.</p>

<br/>
<div>Select vocabulary view:<br/>
    <div>
		<form id="viewsel">
	        <label><input type="checkbox" id="coreCheck" checked="checked"> Core </label>
	        <label><input type="checkbox" id="extCheck" checked="checked"> Extension </label>
			<label><select id="extentions">
				<option value="sdo-ext">All</option>
{% for opt in selectopts %}
				<option value="sdo-{{ opt }}">{{ opt }}.schema.org</option>
{% endfor %}
			</select>
		</foem>
	</div>
</div>
<br/>
	

<div class="typetree" id="thing_tree">
{{ thing_tree | safe }}
</div>
<h4>Data Types</h4>
<div class="typetree" id="datatype_tree">
{{ datatype_tree | safe }}
</div>



<p>An <em>experimental</em> <a href="http://d3js.org">D3</a>-compatible <a href="/docs/tree.jsonld">JSON</a> version is also available.</p>
<br/><br/>

</div>

