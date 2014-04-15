
module.exports = function () {

    App.circles = UI.View.create();
    App.MainView.append(App.circles);
    App.circles.set({
        frame: [0, 460, 320, 40],
        background: [255, 255, 255, 1]
    });

    for (var i = 0; i < 8; i++) {
        App["circle_" + (i+1)] = UI.Button.create();
        App.circles.append(App["circle_" + (i+1)]);
        App["circle_" + (i+1)].set({
            frame: [33*(i+1), 10, 20, 20],
            background: [0, 0, 0, 0.25],
            cornerRadius: 10,
            class: "dots"
        });
    }

};
