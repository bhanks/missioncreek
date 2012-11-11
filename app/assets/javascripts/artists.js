function getFrontPageArtists()
{
	data = new Object;
	artists = new Object;
	$('#selections').children(':not(.instructions)').each(function(index, el){
		artists[index+1]= $($(el).children('span')[0]).attr("id").match(/\d+/);
	});
	data["artists"] = artists;
//	console.log(data)
	$.ajax({
		url: 'artists/front_page_selections',
		type: "POST",
		data: data,
	});
}