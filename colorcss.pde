// Need G4P library
import g4p_controls.*;
color addcolor;
ArrayList<Integer> colors;
ArrayList<String> names;

public void setup() {
  size(800, 400, JAVA2D);
  colorMode(HSB, 100);
  createGUI();
  customGUI();
  // Place your setup code here
  colors = new ArrayList<Integer>();
  names = new ArrayList<String>();
  textAlign(CENTER, CENTER);
}

public void draw() {
  background(0, 0, 80);
  addcolor=color(hueslider.getValueF(), satslider.getValueF(), bright.getValueF());
  fill(addcolor);
  strokeWeight(5);
  stroke(addcolor-10);
  ellipse(200, 250, 200, 200);
  for (int i = 0; i < colors.size(); i++) {

    fill(colors.get(i));
    stroke(colors.get(i));
    //println(colors.get(i));
    rect(0, 150+i*(200/colors.size()-1), 60, 200/colors.size());
    if (brightness(colors.get(i)) > 50) {
      fill(0, 0, 0);
      stroke(0, 0, 0);
    } else {
      fill(0, 0, 100);
      stroke(0, 0, 100);
    }
    text(names.get(i),0, 150+i*(200/colors.size()-1), 60, 200/colors.size());
  }
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI() {
}