require('./circles')();

module.exports = function () {
    
    App.MainView.set({ background: Utils.makeColor([231, 76, 60, 1]) });

    App.subView = UI.View.create();
    App.MainView.append(App.subView);
    App.subView.set({
        frame: Utils.makeFrame([0, 400, 320, 168]),
        background: Utils.makeColor([0, 0, 0, 0.75])
    });

    var buttonStyle = {
        alpha: 0.95,
        background: Utils.makeColor([255, 255, 255, 1]),
        cornerRadius: 4,
        titleColor: Utils.makeColor([0, 0, 0, 0.75]),
        font: "avenir", fontSize: 18, class: "actionBtn"
    };

    App.button = UI.Button.create();
    App.subView.append(App.button);
    App.button.set(buttonStyle);
    App.button.set({
        frame: Utils.makeFrame([30, 84 - 15, 260, 30]),
        title: "Tap for action",
    });
    App.button.on("tap", function () {
        App.subView.append(App.button2);
        App.button.set({ 
            title: "Reset",
            frame: Utils.makeFrame([30, 84 - 45, 260, 30])
        });
        App.button.on("tap", function () {
            App.button2.set({ 
                background: Utils.makeColor([255, 255, 255, 1]),
                title: "Tap me! Tap me!"
            });
        });
    });
    App.button.id = "123";
    console.log(App.button.id);

    App.button2 = UI.Button.create();
    App.button2.set(buttonStyle);
    App.button2.set({
        frame: Utils.makeFrame([30, 84 + 15, 260, 30]),
        title: "Tap me! Tap me!"
    });

    App.button2.on("tap", function () {
        App.button2.set({
            background: Utils.makeColor([241, 196, 15, 1.0]),
            title: "I turned yellow!"
        });
    });

    App.label = UI.Label.create();
    App.MainView.append(App.label);
    App.label.set({
        frame: Utils.makeFrame([30, 50, 260, 320]),
        // background: Utils.makeColor([255, 255, 255, 1]),
        textColor: Utils.makeColor([255, 255, 255, 1]),
        text: "\"I've always wondered if these kinda things were possile;"
              + "I finally have a solution now."
              + "\rAnd the best part is that i build this thing myself!\""
              + "\rLorem ipsum dolor sit amet, consectetur adipisicing elit."
              + "Optio, animi iste cumque voluptas quis earum perferendis praesentium"
              + "ex molestias distinctio quidem doloribus soluta voluptates possimus ipsa.",
        font: "avenir", textAlign: "right", lines: 0
    });

};