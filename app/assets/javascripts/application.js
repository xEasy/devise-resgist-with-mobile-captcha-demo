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

$(function(){
  $('#get-captcha-btn').on('click',function(e){
    e.preventDefault();
    var userMobile = $('#user_mobile').val();
    if (userMobile == undefined || userMobile == '') {
      alert('请输入手机号');
    }else{
      $.post('/send_captcha', { 
        mobile: userMobile
      }).success(function(){
        alert('发送成功');
      }).error(function(){
        alert('发送失败');
      });
    };
  });
});
