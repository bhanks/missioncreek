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
			$(".store-list").addClass("disabled").text(msg);

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