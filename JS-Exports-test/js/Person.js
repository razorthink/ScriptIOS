view = UI.View.create({
    frame: makeFrame(0, 0, 320, 568),
    background: makeColor(255, 255, 255, 1)
});

button = UI.Button.create({
    frame: makeFrame(20, 20, 130, 100),
    background: makeColor(204, 100, 0, 1),
    cornerRadius: 5,
    label: "Test button"
});

view.addSubview(button);
MainView.addSubview(view);