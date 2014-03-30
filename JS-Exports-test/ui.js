try {
    
    MainView.set({
        alpha: 0.75,
        background: Utils.makeColor([255, 255, 255, 0.25]),
        frame: [0, 300, 320, 150],
        number: 10
    });

} catch (err) {
    console.error(err);
}