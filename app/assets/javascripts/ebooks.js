$(document).ready(function(){
    // disable auto discover
    Dropzone.autoDiscover = false;

    // grap our upload form by its id
    $("#new_ebook").dropzone({
	// restrict image size to a maximum 32MB
	maxFilesize: 32,
	// changed the passed param to one accepted by
	// our rails app
	paramName: "ebook[book]",
	// show remove links on each image upload
	addRemoveLinks: true
    });
});
