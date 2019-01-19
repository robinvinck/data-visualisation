//adding font https://www.youtube.com/watch?v=QmRbb-_d_vI
PFont font;


//declaration of var
float[] values = new float[180];
JSONArray data;
//changes year from data
int counter;
int jaar;
int rep;
int dem;
int ind;
int widthCircle= 10;
int heightCircle=5;
int w;
int h;
int aantalRijen;
Boolean isRepublik;
boolean isInArray = true;

void setup() {
  //load font
  font = loadFont("Museo-500-48.vlw");
  textFont(font);

  size(750, 800);
  counter = 0;
  w = widthCircle;
  h = heightCircle;
  aantalRijen = 1;

  //set default year
  jaar = 116;

  for (int i=0; i<values.length; i++) {
    values[i] = 1;
  }
}


void draw() {
  background(255);
  textSize(16);
  textAlign(CENTER, TOP);

  //create legende
  fill(0, 0, 360);
  ellipse(width/3 - 50, 706, w, w);
  text("Democrats", width/3, 700);
  //create legende
  fill(360, 0, 0);
  ellipse(width/3*1.5 - 55, 706, w, w);
  text("Republikans", width/3*1.5, 700);
  //create legende
  fill(0, 0, 0);
  ellipse(width/3*2 - 53, 706, w, w);
  text("Independant", width/3*2 +5, 700);
  
  //Increase rows, from 1 -> 2, 2 -> 4, 4 -> 6
  if (aantalRijen == 1) {
    text("US REPRESENTATIVES "+ jaar +" Senate", width/2, 60);
    //if year < 104 array out of bounds
    if (jaar < 104) {
      isInArray = false;
    }
  } else if (aantalRijen == 2) {
    //create text for second year indication
    int nyear = int(jaar)+ 1;
    text("US REPRESENTATIVES "+ jaar +" and " + nyear +" Senate", width/2, 60);
   //if year < 104 array out of bounds
    if (jaar < 104) {
      isInArray = false;
    }
  } else if (aantalRijen == 3) {
    int year = int(jaar)+ 3;
    text("REPRESENTATIVES "+ jaar +" to " + year +" Senate", width/2, 60);
     //if year < 104 array out of bounds
    if (jaar < 104) {
      isInArray = false;
    }
  } else if (aantalRijen == 4) {
    int year = int(jaar)+ 6;
    text("REPRESENTATIVES "+ jaar +" to " + year +" Senate", width/2, 60);
    if (jaar < 104) {
      isInArray = false;
    }
  }
  
  //translate to this point to create ellipses on that place
  translate(width/2, height/3*2);
  noStroke();

  int internalCounter = 0;

  //boolean is set to true if value is in range (104 - 116)
  if (isInArray) {

    if (aantalRijen == 1) {
      //loaddata with counter (counter is set to index of array val)
      //loaddata from that index
      loadData(counter);
      //create an ellipse that is based on these values 
      //internalCounter is just a counter that is used in checkcounter()
      //to manage colors based on party (reps, democrats and indp.)
      createEllipses(internalCounter, 15, 11.25, 10.5882353, 7.826, 6.6667, 100, 0);
    } else if (aantalRijen == 2) {
      loadData(counter);
      createEllipses(internalCounter, 6, 5, 5, 3.8, 3.2, 100, 0);
      //mirror other side
      scale(-1, 1);
      loadData(counter+1);
      createEllipses(internalCounter, 6, 5, 5, 3.8, 3.2, 100, 0);
    } else if (aantalRijen == 3) {
      //rechts
      loadData(counter);
      createEllipses(internalCounter, 6, 5, 5, 3.8, 3.2, 100, 0);
      loadData(counter+2);
      createEllipses(internalCounter, 2.5, 2, 2, 1.6, 1.4, 250, 0);
      scale(-1, 1);
      //links
      loadData(counter+1);
      createEllipses(internalCounter, 6, 5, 5, 3.8, 3.2, 100, 0);
      loadData(counter+3);
      createEllipses(internalCounter, 2.5, 2, 2, 1.6, 1.4, 250, 0);
    } else if (aantalRijen == 4) {
      //rechts
      loadData(counter);
      createEllipses(internalCounter, 6, 5, 5, 3.8, 3.2, 100, 0);
      loadData(counter+2);
      createEllipses(internalCounter, 2.5, 2, 2, 1.6, 1.4, 250, 0);
      loadData(counter+5);
      createEllipses(internalCounter, 2.5, 2, 2, 1.6, 1.4, 250, 95);
      scale(-1, 1);
      //links
      loadData(counter+1);
      createEllipses(internalCounter, 6, 5, 5, 3.8, 3.2, 100, 0);
      loadData(counter+3);
      createEllipses(internalCounter, 2.5, 2, 2, 1.6, 1.4, 250, 0);
      loadData(counter+6);
      createEllipses(internalCounter, 2.5, 2, 2, 1.6, 1.4, 250, 95);
    }

    noStroke();
  }
}

//func to create ellipses
void createEllipses(int internalCounter, float rij1, float rij2, float rij3, float rij4, float rij5, int wegVanMidden, float graad) {
  
  //get first row
  //based on vals given bij parameters
  for (int i=0; i<13; i++) {
    checkCounter(internalCounter);
    ellipse(cos(radians(-(graad+i*rij1)))*(wegVanMidden), sin(radians(-(graad+i*rij1)))*(wegVanMidden), w, w);
    internalCounter += 1;
  }
  
  //get second row
  for (int i=0; i<17; i++) {
    checkCounter(internalCounter);
    ellipse(cos(radians(-(graad+i*rij2)))*(wegVanMidden+20), sin(radians(-(graad+i*rij2)))*(wegVanMidden+20), w, w);
    internalCounter += 1;
  } 


  //get thirt row
  for (int i=0; i<18; i++) {
    checkCounter(internalCounter);
    ellipse(cos(radians(-(graad+i*rij3)))*(wegVanMidden+40), sin(radians(-(graad+i*rij3)))*(wegVanMidden+40), w, w);
    internalCounter += 1;
  }


  //get fourth row
  for (int i=0; i<24; i++) {
    checkCounter(internalCounter);
    ellipse(cos(radians(-(graad+i*rij4)))*(wegVanMidden+60), sin(radians(-(graad+i*rij4)))*(wegVanMidden+60), w, w);
    internalCounter += 1;
  }

  //get fifth row
  for (int i=0; i<28; i++) {
    checkCounter(internalCounter);
    ellipse(cos(radians(-(graad+i*rij5)))*(wegVanMidden+80), sin(radians(-(graad+i*rij5)))*(wegVanMidden+80), w, w);
    internalCounter += 1;
  }
}


//check the counter function and capture how many 
//independents, republikans and democrats
//used to fill the color of circles
void checkCounter(int count) {
  
  //math solution
  
  //gives democrats
  if (count <= 100-rep-ind) {
    isRepublik = true;
    fill(0, 0, 360);
  } else if (count > 100-rep) 
  {  
    //gives republ.
    isRepublik = false;
    fill(360, 0, 0);
  } else if (100 != count) {
    //gives independants
    fill(0, 0, 0);
  }
}



//loadData from json file
void loadData(int getal) {
  
  //check if value is in array
  if (isInArray) {
    data = loadJSONArray("data.json");

    JSONObject val = data.getJSONObject(getal); 

    jaar = val.getInt("id");
    dem = val.getInt("dem");
    rep = val.getInt("rep");
    ind = val.getInt("ind");
  }
}


//change data (jaren)
void changeCounter(String keyP) {
  if (counter < 1) {
    if (keyP == "DOWN") {
    } else {
      counter = counter +1;
    }
  } else {
    if (keyP == "DOWN") {
      counter = counter -1;
    } else {
      counter = counter +1;
    }
  }
  loadData(counter);
}

//change rows that are displayed
void changeRows(String keyP) {

  if (aantalRijen < 2) {
    if (keyP == "LEFT") {
      aantalRijen = 1;
    } else {
      aantalRijen = aantalRijen +1;
    }
  } else {
    if (keyP == "LEFT") {
      aantalRijen = aantalRijen -1;
    } else {

      if (aantalRijen < 4) {
        aantalRijen = aantalRijen +1;
      }
    }
  }
  draw();
}


//capture keyPress
public void keyPressed()
{

  if (keyCode == 38)
  {
    int count = jaar - 1;
    if (count < 104) {
    } else {
      changeCounter("UP");
    }
  } else if (keyCode == DOWN)
  {
    isInArray = true;
    changeCounter("DOWN");
  } else if (keyCode == LEFT)
  {
    changeRows("LEFT");
  } else if (keyCode == RIGHT)
  {
    changeRows("RIGHT");
  }
}
