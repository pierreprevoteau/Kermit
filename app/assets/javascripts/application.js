// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require videojs
//= require treeview
//= require_tree .

//init tooltips
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
});

//init tree
$(document).ready(function() {

  function getJSON(url) {
         var resp ;
         var xmlHttp ;

         resp  = '' ;
         xmlHttp = new XMLHttpRequest();

         if(xmlHttp != null)
         {
             xmlHttp.open( "GET", url, false );
             xmlHttp.send( null );
             resp = xmlHttp.responseText;
         }

         return resp ;
     };

     var datatree ;
     datatree = getJSON('/folders.json') ;

$('#tree').treeview({
  data: datatree,
  collapseIcon: "glyphicon glyphicon-folder-open",
  expandIcon: "glyphicon glyphicon-folder-close",
  emptyIcon: "glyphicon glyphicon-folder-open",
  levels: 5,
  enableLinks: true
});
});
