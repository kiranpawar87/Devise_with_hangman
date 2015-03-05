//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets

//= require_tree .

jQuery.ajaxSetup({
    'beforeSend':function(xhr) {xhr.setRequestHeader("Accept","text/javascript")}
})
$(document).ready(function(){
    $("form").submit(function() {
        $.post($(this).attr("action"),$(this).serialize(),null,"script");
        return false;
    });
});