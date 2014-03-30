try {
    MainView.set({ background: Utils.makeColor([231, 76, 60, 1]) });

    var subView = UI.View.create();
    MainView.addSubNode(subView);
    subView.set({
        frame: Utils.makeFrame([0, 400, 320, 168]),
        background: Utils.makeColor([0, 0, 0, 0.75])
    });

    var buttonStyle = {
        background: Utils.makeColor([255, 255, 255, 1]),
        cornerRadius: 4,
        titleColor: Utils.makeColor([0, 0, 0, 0.75]),
        font: "avenir", fontSize: 18
    };

    var button = UI.Button.create();
    subView.addSubNode(button);
    button.set(buttonStyle);
    button.set({
        frame: Utils.makeFrame([30, 84 - 15, 260, 30]),
        title: "Tap for action",
    });
    button.on("tap", function () {
        subView.addSubNode(button2);
        button.set({ 
            title: "Reset",
            frame: Utils.makeFrame([30, 84 - 45, 260, 30])
        });
        button.on("tap", function () {
            button2.set({ 
                background: Utils.makeColor([255, 255, 255, 1]),
                title: "Tap me! Tap me!"
            });
        });
    });

    var button2 = UI.Button.create();
    button2.set(buttonStyle);
    button2.set({
        frame: Utils.makeFrame([30, 84 + 15, 260, 30]),
        title: "Tap me! Tap me!"
    });

    button2.on("tap", function () {
        button2.set({
            background: Utils.makeColor([241, 196, 15, 1.0]),
            title: "I turned yellow!"
        });
    });

    var label = UI.Label.create();
    MainView.addSubNode(label);
    label.set({
        frame: Utils.makeFrame([30, 0, 260, 370]),
        textColor: Utils.makeColor([255, 255, 255, 1]),
        text: "\"I've always wondered if these kinda things were possile; I finally have a solution now. \rAnd the best part is that i build this thing myself!\"",
        font: "avenir", textAlign: "left", lines: 0
    });

} catch (err) {
    console.error(err);
}