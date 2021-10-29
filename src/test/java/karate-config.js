function fn(){
    karate.configure('logPrettyRequest', true);
    karate.configure('logPrettyResponse', true);

return{
baseUrl: "https://ecg-api.gumtree.com.au/",
isoDate: function() { return new Date().toISOString().substring(0, 10) }

}

}
