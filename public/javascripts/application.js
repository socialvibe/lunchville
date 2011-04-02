// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


function pageHeight()
{
	return  window.innerHeight != null? window.innerHeight : document.documentElement &&
	document.documentElement.clientHeight ?  document.documentElement.clientHeight :
	document.body != null? document.body.clientHeight : null;
}