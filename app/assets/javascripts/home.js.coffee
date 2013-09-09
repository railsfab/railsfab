# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#$("#blog_post_content").keyup(function(){
  #var t=$("#blog_post_content");
  #console.log(t);
#});

$(document).ready ->
  #new.html
  $("#blog_post_content").keyup ->
    text = $("#blog_post_content").val();
    c = new Markdown.Converter();
    $(".preview").html(c.makeHtml(text));

  # show.html
  if $("#post-content-markdown").length is 1
    text = $("#post-content-markdown").text();
    c = new Markdown.Converter();
    $("#post-content").html(c.makeHtml(text));

  

