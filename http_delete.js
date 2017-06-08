var request=require("request")
request({
    url: 'http://192.168.18.60:31981/volumes/'+"adfasfd",
    method: 'DELETE',
    timeout: 1000,
	followRedirect: true,
	maxRedirects: 10
}, function(err, response, body) {
	console.error(err);
	// console.info(response);
	console.info(body);
});

for(i=0;i<arr.length;i++) {
	request({
	    url: 'http://192.168.18.60:31981/volumes/'+arr[i],
	    method: 'DELETE',
	    timeout: 1000,
		followRedirect: true,
		maxRedirects: 10
	}, function(err, response, body) {
		console.error(err);
		// console.info(response);
		console.info(body);
	});
	setTimeout(function() {}, 1000); 
}