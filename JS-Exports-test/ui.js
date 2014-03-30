try {
    MainView.set({ background: Utils.makeColor([231, 76, 60, 1]) });

    var subView = View.create();
    MainView.addSubNode(subView);
    subView.set({
        frame: [0, 400, 320, 168],
        background: Utils.makeColor([0, 0, 0, 0.75])
    });

    var button = Button.create();
    subView.addSubNode(button);
    button.set({
        frame: [40, 168 - 50, 260, 30],
        background: Utils.makeColor([255, 255, 255, 1]),
        cornerRadius: 4,
        title: "Button",
        titleColor: Utils.makeColor([0, 0, 0, 0.75]),
        font: "avenir", fontSize: 20
    });

    var label = Label.create();
    subView.addSubNode(label);
    label.set({
        frame: [0, 0, 320, 168 - 50],
        textColor: Utils.makeColor([255, 255, 255, 1]),
        text: "This is some random text",
        font: "avenir", textAlign: "center", lines: 0,
        fontSize: 20
    });

} catch (err) {
    console.error(err);
}