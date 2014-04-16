var randomNumber = function(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
};

require('./circles')();

module.exports = function () {
    
    App.MainView.set({ background: [231, 76, 60, 1] });

    App.subView = UI.View.create();
    App.MainView.append(App.subView);
    App.subView.set({
        frame: [0, 500, 320, 68],
        background:[0, 0, 0, 0.75]
    });
    
    App.scrollText = UI.ScrollView.create();
    App.MainView.append(App.scrollText);
    App.scrollText.set({
        frame: [20, 130, 300, 320],
        contentSize: [300, 650],
        contentOffset: [0, 0]
    });
    

    App.label = UI.Label.create();
    App.scrollText.append(App.label);
    App.label.set({
        frame: [0, 0, 300, 620],
        textColor: [255, 255, 255, 1],
        text: "\"I've always wondered if these kinda things were possible; "
              + "I finally have a solution now."
              + "\rAnd the best part is that i built this thing myself with Shrisha!\""
              + "\rLorem ipsum dolor sit amet, consectetur adipisicing elit."
              + "Optio, animi iste cumque voluptas quis earum perferendis praesentium"
              + "ex molestias distinctio quidem doloribus soluta voluptates possimus ipsa."
              +"\"I've always wondered if these kinda things were possible; \n\n"
              + "I finally have a solution now."
              + "\rAnd the best part is that i built this thing myself with Shrisha!\""
              + "\rLorem ipsum dolor sit amet, consectetur adipisicing elit."
              + "Optio, animi iste cumque voluptas quis earum perferendis praesentium"
              + "ex molestias distinctio quidem doloribus soluta voluptates possimus ipsa.",
        font: "avenir", textAlign: "left", lines: 0
    });

    App.title = UI.Label.create();
    App.MainView.append(App.title);
    App.title.set({
        frame: [0, 45, 320, 80],
        textColor: [255, 255, 255, 1],
        text: "Random Color",
        fontSize: 30, font: "avenir", textAlign: "center",
        background: [0, 0, 0, 0.1]
    });
    
    App.logo = UI.ImageView.create();
    App.MainView.append(App.logo);
    App.logo.set({
        frame: [10, 60, 45, 45],
        image: "palette.png"
    });
    
    var buttonStyle = {
    background: [255, 255, 255, 1],
    cornerRadius: 4,
    titleColor: [0, 0, 0, 0.75],
    font: "avenir",
    fontSize: 18,
        class: "actionBtn"
    };
    
    App.button = UI.Button.create();
    App.subView.append(App.button);
    App.button.set(buttonStyle);
    App.button.set({
                   frame: [30, 20, 260, 30],
                   title: "Shuffle Color",
                   });
    
    App.button.on("tap", function () {
                  App.MainView.set({background: [randomNumber(0, 255),randomNumber(0, 255),randomNumber(0, 255),1]});
                  });

};
