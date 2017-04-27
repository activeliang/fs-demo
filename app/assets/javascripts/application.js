// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require html5_shiv
//= require_tree .




//以下是微信二维码
function on() {
    document.getElementById("overlay").style.height = "100%";
}

function off() {
    document.getElementById("overlay").style.height = "0";
}

// 以下是contact-top
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  var x = document.getElementById("contacttop")
    if (document.body.scrollTop > 600 || document.documentElement.scrollTop > 600) {
      x.className = "show";
        // document.getElementById("contacttop").style.display = "block";
        // document.getElementById("contacttop").style.transition = ".5s ease";
    } else {
    x.className = x.className.replace("show", "");
    }
}
