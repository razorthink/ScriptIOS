try {

    var _ = require('./underscore'),
        $ = require('./query');
            
    // load UI from definition in ui.js
    require('./ui')();

    var butt = $('class', 'actionBtn', App);
    _.each(butt, function (butt) {
        butt.set({cornerRadius: 10});
    });

} catch (err) {

    console.error(err);

}