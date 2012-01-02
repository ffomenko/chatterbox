$(document).ready(function() {
    var pusher = new Pusher('1d22c5da4cc342fbf2ac');
    var postChannel = pusher.subscribe('post-channel');
    postChannel.bind('post_create', function(post_html) {
        $('#posts').prepend(post_html);
    });
});
