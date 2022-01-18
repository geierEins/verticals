VerticalController vc;
Button resetButton, saveButton;
ScreenshotHelper screenshotHelper;

void setup() {
  size(1000, 1000);
  smooth(4);
  vc = new VerticalController((int)random(4, 10), (int)random(10, 100));
  // Buttons
  resetButton = new Button((int)(width*0.33), height-25, 100, 25, "RESET");
  saveButton = new Button((int)(width*0.667), height-25, 100, 25, "SAVE");
  // Screenshothelper
  screenshotHelper = new ScreenshotHelper();
}

void draw() {
  background(15);
  vc.drawLines();
  saveButton.drawButton();
  resetButton.drawButton();
}

void mouseClicked() {
  // RESET
  if (resetButton.mouseIsOverButton()) {
    setup();
  }
  // SAVE
  if (saveButton.mouseIsOverButton()) {
    saveButton.hide();
    resetButton.hide();  
    draw();
    screenshotHelper.shot();
    saveButton.retrieve();
    resetButton.retrieve();

  }
}
