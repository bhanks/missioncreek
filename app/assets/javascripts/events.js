$(document).ready(function(){

  if($('#calender_page')!=[])
  {
    $('span.glyphicon-plus-sign').each(function(){
      var event = $(this).closest(".event");
      $(this).on("click", function(){
        if($(this).hasClass("glyphicon-plus-sign"))
        {
          $(this).removeClass("glyphicon-plus-sign");
          $(this).addClass("glyphicon-minus-sign");
          $(".details."+$(event).attr("id")).slideDown(200);
        }
        else
        {
          $(this).addClass("glyphicon-plus-sign");
          $(this).removeClass("glyphicon-minus-sign");
          $(".details."+$(event).attr("id")).slideUp(200);
        }
      });
    }); 
  }

});


function filterByCategory(category)
{
  var categories=["music", "literature","film","food","misc"]
  var selectors = []
  $(categories).each(function(){
    if( this != category)
      selectors.push(".event."+this);
  });
  $('.event').show();
  $(selectors.join(",")).hide();
}
