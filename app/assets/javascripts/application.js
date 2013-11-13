// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).ready(function(){
    update_active_nav();
})

function update_active_nav(){
    var path = window.location.pathname.replace(/^\//, "").replace(/\/$/, "");
    $(".nav li").removeClass("active");
    console.log(path);

    if(path === ""){
        $("#nav-link-home").addClass("active");
    }else if(path === "blog"){
        $("#nav-link-blog").addClass("active");
    }else if(path === "contact"){
        $("#nav-link-contact").addClass("active");
    }else if(path === "ourwork"){
        $("#nav-link-ourwork").addClass("active");
    }else if(path === "posts/new"){
        $("#nav-link-new-post").addClass("active");
    }
}


