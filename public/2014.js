$(document).ready(function(){
  
  $('#more_info').on('click',function(){
    $('.primary, .general, .info_nav, #credit_union, #credit_info').toggle();
    $('#credit_info').css('display', 'inline-block');
    $('.navigation').attr('src', '2014_img/info.png');
  });
  $('.back_nav').on('click', function(){
    var current = '.';
    if($('.general').is(':visible'))
      current += 'general';
    else
      current += 'passes';
    $('.primary, '+current+', .info_nav, #credit_union, #credit_info').toggle();
    $('.navigation').attr('src', '2014_img/second.png');

  });
  $('.general_nav').on('click', function(){
    console.log('clicked general')
    if($('.passes').is(':visible'))
    {
      $('.passes, .general').toggle();  
    }
  });
  $('.pass_nav').on('click', function(){
    console.log('clicked pass info')
    if($('.general').is(':visible'))
    {
      $('.passes, .general').toggle();  
    }
  });

});
