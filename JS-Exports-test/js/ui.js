var randomNumber = function(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
};

require('./circles')();

module.exports = function () {
    
    App.MainView.set({ background: Utils.makeColor([231, 76, 60, 1]) });

    App.subView = UI.View.create();
    App.MainView.append(App.subView);
    App.subView.set({
        frame: Utils.makeFrame([0, 500, 320, 68]),
        background: Utils.makeColor([0, 0, 0, 0.75])
    });

    var buttonStyle = {
        background: Utils.makeColor([255, 255, 255, 1]),
        cornerRadius: 4,
        titleColor: Utils.makeColor([0, 0, 0, 0.75]),
        font: "avenir", fontSize: 18, class: "actionBtn"
    };

    App.button = UI.Button.create();
    App.subView.append(App.button);
    App.button.set(buttonStyle);
    App.button.set({
        frame: Utils.makeFrame([30, 20, 260, 30]),
        title: "Shuffle Color",
    });

    App.button.on("tap", function () {
        App.MainView.background = Utils.makeColor([randomNumber(0, 255),randomNumber(0, 255),randomNumber(0, 255),1]);
    });

    App.label = UI.Label.create();
    App.MainView.append(App.label);
    App.label.set({
        frame: Utils.makeFrame([30, 120, 260, 320]),
        textColor: Utils.makeColor([255, 255, 255, 1]),
        text: "\"I've always wondered if these kinda things were possile;"
              + "I finally have a solution now."
              + "\rAnd the best part is that i build this thing myself!\""
              + "\rLorem ipsum dolor sit amet, consectetur adipisicing elit."
              + "Optio, animi iste cumque voluptas quis earum perferendis praesentium"
              + "ex molestias distinctio quidem doloribus soluta voluptates possimus ipsa.",
        font: "avenir", textAlign: "right", lines: 0
    });

    App.title = UI.Label.create();
    App.MainView.append(App.title);
    App.title.set({
        frame: Utils.makeFrame([0, 45, 320, 80]),
        textColor: Utils.makeColor([255, 255, 255, 1]),
        text: "Random Color",
        fontSize: 30, font: "avenir", textAlign: "center",
        background: Utils.makeColor([0, 0, 0, 0.1])
    });

};
