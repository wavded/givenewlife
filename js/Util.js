(function(){
    var doc = document,
        feedEl = doc.getElementById('gnl-twitter-feed'),
        isSmallFeed = !!$('.gnl-box-small').length,
        feedLimit = isSmallFeed ? 2 : 3;
    
    
    twitterlib.timeline('givenewlife', { limit: feedLimit }, function (tweets) {
        feedEl.innerHTML = "";
        for (var i = 0; i < tweets.length; i++) {
            var html = [
                this.ify.clean(tweets[i].text),
                " <small><em>(",
                    this.time.relative(tweets[i].created_at),
                ")</em></small>"
            ].join("");
            feedEl.innerHTML += '<p>' + html + '</p>';
        }
    });
    
    var flickrKey = '4fe0514375719e6ed325d64108bcae7c',
        flickrEl = doc.getElementById('gnl-flickr-feed');
    
    $.getJSON('http://api.flickr.com/services/rest/?&method=flickr.people.getPublicPhotos&api_key=' 
        + flickrKey + '&user_id=40773079@N04&per_page=6&format=json&jsoncallback=?',
        function(data){
            flickrEl.innerHTML = "";
            $.each(data.photos.photo, function(i,item){
                var thumbURL = 'http://farm' + item.farm + '.static.flickr.com/' 
                            + item.server + '/' + item.id + '_' + item.secret + '_s.jpg',
                    photoURL = 'http://farm' + item.farm + '.static.flickr.com/' 
                            + item.server + '/' + item.id + '_' + item.secret + '.jpg';
                var html = [
                    '<a href="'+photoURL+'" class="lightbox" title="'+item.title+'">',
                    '<img src="'+thumbURL+'" alt="'+item.title+'"/>"',
                    '</a>'
                ].join("");
                flickrEl.innerHTML += html;       
            });
            $(".lightbox").lightBox();
        }
    );
    
    var tumblrEl = doc.getElementById('gnl-tumblr-feed');
    
    if(tumblrEl){
        $.getJSON('http://givenewlife.tumblr.com/api/read/json?num=1&callback=?',function(data){
            var dummy = doc.createElement("p"),
                post = data.posts[0],
                bodyHTML = post["regular-body"] || post["quote-text"];
            $(dummy).append(bodyHTML);
            var bodyText = dummy.innerText || dummy.textContent;
            tumblrEl.innerHTML = bodyText.substring(0,250) + "...";
            dummy = null;
        });
    }
})();
