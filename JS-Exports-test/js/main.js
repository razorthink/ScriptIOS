try {

    var _ = require('./underscore'),
        $ = require('./query');
            
    // load UI from definition in ui.js
    require('./ui')();

    var buttons = $('class', 'actionBtn', App);
    _.each(buttons, function (btn) {
        btn.cornerRadius = 15;
    });

    console.log('test');

    var circles = $('class', 'dots', App);
    _.each(circles, function (dot) {
        dot.on('tap', function () {
            console.log("tapped function");
            dot.set({background: App.button.get('background')});
        });
    });


} catch (err) {

    console.error(err);

}