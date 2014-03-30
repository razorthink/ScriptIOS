try {
    MainView.set({ background: Utils.makeColor([231, 76, 60, 1]) });

    var subView = View.create();
    MainView.addSubNode(subView);
    subView.set({
        frame: Utils.makeFrame([0, 400, 320, 168]),
        background: Utils.makeColor([0, 0, 0, 0.75])
    });

    var button = Button.create();
    subView.addSubNode(button);
    button.set({
        frame: Utils.makeFrame([30, 168 - 50, 260, 30]),
        // frame: {x: 30, y: 98, width: 260, height: 50} /* this works too*/
        background: Utils.makeColor([255, 255, 255, 1]),
        cornerRadius: 4,
        title: "Press Me",
        titleColor: Utils.makeColor([0, 0, 0, 0.75]),
        font: "avenir", fontSize: 18
    });
    button.on("tap", function () {
        console.log("tap handler in JS");
    });

    var label = Label.create();
    MainView.addSubNode(label);
    label.set({
        frame: Utils.makeFrame([30, 0, 260, 370]),
        textColor: Utils.makeColor([255, 255, 255, 1]),
        text: "\"I've always wondered if things kinda thing was possile; I finally have a solution now. \rAnd the best part is that i build this thing myself!\"",
        font: "avenir", textAlign: "left", lines: 0
    });

} catch (err) {
    console.error(err);
}