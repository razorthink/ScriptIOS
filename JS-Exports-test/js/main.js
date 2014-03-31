try {

    var _ = require('./underscore'),
        $ = require('./query');
            
    // load UI from definition in ui.js
    require('./ui')();

    var buttons = $('class', 'actionBtn', App);
    _.each(buttons, function (btn) {
        btn.set({cornerRadius: 15});
    });

    var circles = $('class', 'dots', App);
    _.each(circles, function (dot) {
        dot.alpha = 0.25;
        dot.background = Utils.makeColor([0,0,0,1]);
    });


} catch (err) {

    console.error(err);

}