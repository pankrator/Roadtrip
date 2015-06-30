var subscribeForTrip = function (button) {
	var tripId = $(button).attr("data-trip-id");
	
	$.ajax({
		url: baseServiceUrl + "trip/subscribeForTrip",
		method: "POST",
		data: {
			tripId: tripId
		},
		contentType: "json",
		success: function(response) {
			$(button).attr('value', 'Joined!');
			$(button).attr('disabled', 'disabled');
		}
	});
	
	$(button).attr('value', 'Sending...');
	$(button).attr('disabled', 'disabled');
}


var gotoViewProfile = function(button) {
	var driverId = $(button).attr("data-driver-id");
	
	window.location = baseServiceUrl + "profile/user/" + driverId;
}