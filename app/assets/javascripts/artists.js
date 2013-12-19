function getFrontPageArtists()
{
	data = new Object;
	artists = new Object;
	$('#selections').children(':not(.instructions)').each(function(index, el){
		artists[index+1]= $(el).attr("id").match(/\d+/);
	});
	data["artists"] = artists;
//	console.log(data)
	$.ajax({
		url: 'artists/front_page_selections',
		type: "POST",
		data: data,
		dataType: "text",
		success: function(msg){
			$("#artists.store-list").addClass("disabled").text(msg);

		}
	});
}

function storeDisplayOrder(tier)
{
	data = new Object;
	artists = new Object;
	$('.tier_'+tier+'_order').children(':not(.instructions)').each(function(index, el){
		artists[index+1]= $(el).attr("id").match(/\d+/);
	});
	data["artists"] = artists;
//	console.log(data)
	$.ajax({
		url: 'artists/store_display_order',
		type: "POST",
		data: data,
		dataType: "text",
		success: function(msg){
			$("#tier_"+tier+".store-list").addClass("disabled").text(msg);

		}
	});
}


function clearList(list, undisplayed)
{

	currentSelections = $(list).children(':not(.instructions)').detach()
	//console.log($(currentSelections));
	$(undisplayed).append(currentSelections);
	$('li.tier1').sort(sortAlpha).detach().appendTo('.undisplayed');
	$('li.tier2').sort(sortAlpha).detach().appendTo('.undisplayed');
	$('li.tier3').sort(sortAlpha).detach().appendTo('.undisplayed');

}

function sortAlpha(a,b){  
    return a.innerHTML.toLowerCase() > b.innerHTML.toLowerCase() ? 1 : -1;  
};

function sortClass(a,b){

}

function artistPopover(){
	console.log('attached');
}

$(document).ready(function(){

	// console.log($('.lineup').find('li'))
  if($('#artist_crop').length > 0)
  {
    $("#artist_crop img").Jcrop({
      onSelect: markCrop,
      aspectRatio: 3 / 2
    })


    $("#artist_crop button").bind('click',function(){
      minWidth = 450;//Replace with real value
      minHeight = 300;//Replace with real value
      width = $("#crop_w").attr('value');
      height = $("#crop_h").attr('value');
      if(width < minWidth || height < minHeight)
      {
        alert("Please select an area of at least "+minWidth+" by "+minHeight+" (w X h)");
        return false;
      }
    });  

  } 
});

function markCrop(img)
{
  $("#crop_x1").attr('value',img.x);
  $("#crop_y1").attr('value',img.y);
  $("#crop_x2").attr('value',img.x2);
  $("#crop_y2").attr('value',img.y2);
  $("#crop_w").attr('value',img.w);
  $("#crop_h").attr('value',img.h);
  $("#selection").text("Current Selection (w X h): "+img.w+" X "+img.h);
}

