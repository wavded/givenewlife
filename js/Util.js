(function(){
    var doc = document;
    
    var feedEl = doc.getElementById('gnl-twitter-feed');
    
    twitterlib.timeline('givenewlife', { limit: 3 }, function (tweets) {
        feedEl.innerHTML = "";
        for (var i = 0; i < tweets.length; i++) {
            var html = [
                this.ify.clean(tweets[i].text),
                " <small><em>(",
                    this.time.datetime(tweets[i].created_at),
                ")</em></small>"
            ].join("");
            feedEl.innerHTML += '<p>' + html + '</p>';
        }
    });
})();
