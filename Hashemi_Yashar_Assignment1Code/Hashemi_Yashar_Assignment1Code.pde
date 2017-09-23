  //Yashar Hashemi
  //Assignment1
   
   void setup() {
       size(400, 400);
       stroke(0); 
     }
      
     void draw() {
      background(0); //sets background to black
      textSize(16); //sets text size to 16
      fill(255); // sets color of text object below with a greyscale value 
      text("click the mouse to move a 2-d table ", 10, 30); //creates text object at (10,30)
      fill(0, 102, 255); //sets to color of the text object below to an RGB value 
      text("press 'l' to view 3-d table legs", 10, 60); //creates text object at (10,60)
      fill(0, 255, 153);//sets to color of the text object below to an RGB value 
      text("press 't' to view 3-d table top", 10, 90); //creates text object at (10,90)
      fill(225, 102, 153);//sets to color of the text object below to an RGB value 
      text("press 'w' to view the whole 3-d table ", 10, 120); //creates text object at (10,120)
       
      //creates a movable two dimensional table using primative shapes if the user holds their mouse button
      if (mousePressed == true) {
          rectMode(CORNERS); // rect() takes two coordinates as params (x1, y1, x2, y2) 
          background(0); 
          cursor(HAND); // sets the symbol of the cursor to a hand 
          
          //front right leg
          fill(255); 
          rect(mouseX, mouseY, mouseX+20, mouseY+100); // creates a table leg that follows the mouse position
                  
                          
          // front left leg  
          fill(255); //greyscale coloring
          rect(mouseX-180, mouseY, mouseX-160, mouseY+100);// creates a table leg that follows the mouse position
                                            
          
          //table top
          fill(255);
          rect(mouseX-180, mouseY-30, mouseX+20, mouseY);  // creates a table top that follows the mouse position
          
        //table legs
      } if ((keyPressed == true) && (key == 'l')){ //if the '1' key is pressed then:     
        
          rectMode(CORNERS); // creates rectangles using two coordinates eg. rect(x1, y1, x2, y2) 
          background(0);  //set background color to black
          
          //front right leg
          fill(255); 
          rect(230, 230, 250, 330); 
          //front right leg right side
          fill(225); 
          quad(250, 330, 250, 230, 260, 200, 260, 316); 
          
          // front left leg  
          fill(255); //greyscale coloring
          rect(50, 230, 70, 330);
          //front left leg right side
          fill(225);
          quad(70, 330, 70, 230, 80, 230, 80, 316); // creates at quadrelateral with corner 1 @coordinates(70, 330), corner 2@(70, 230), 3@(80, 230), 4@(80, 316)
          
          //back right leg
          fill(200);
          rect(273, 150, 290, 300);
          //back right leg right side 
          fill(200); 
          quad(290, 300, 290, 150, 300, 150, 300, 286); //creates a quadrelateral with the coordinates of its four courners as parameters 
          
          //back left leg
          fill(175); 
          rect(103, 230, 120, 300);
          //back left leg right side
          fill(125);
          quad(120, 300, 120, 150, 130, 150, 130, 286);//creates a quadrelateral with the coordinates of its four courners as parameters 
      
      
      //table top
      }  if ((keyPressed == true) && (key == 't')){ //if the 't' key is pressed then: 
        
          //table top
          fill(225); 
          quad(50, 200, 100, 150, 300, 150, 250, 200);//creates a quadrelateral with the coordinates of its four courners as parameters 
          
          //table front
          fill(255);
          rect(50, 200, 250, 230);   
          
          //table right edge 
          fill(200); 
          quad(250, 230, 250, 200, 300, 150, 300, 180); //creates a quadrelateral with the coordinates of its four courners as parameters 
          
                
        //whole table 
        }if ((keyPressed == true) && (key == 'w')){ //if the 'w' key is pressed then : 
            rectMode(CORNERS); // create rectangles using two coordinates eg. rect(x1, y1, x2, y2) 
            background(0);  //set background color to black
            
            //front right leg
            fill(255); 
            rect(230, 230, 250, 330); 
            //front right leg right side
            fill(225); 
            quad(250, 330, 250, 230, 260, 200, 260, 316); 
            
            // front left leg  
            fill(255); 
            rect(50, 230, 70, 330);
            //front left leg right side
            fill(225);
            quad(70, 330, 70, 230, 80, 230, 80, 316); 
            
            //back right leg
            fill(200);
            rect(273, 150, 290, 300);
            //back right leg right side 
            fill(200); 
            quad(290, 300, 290, 150, 300, 150, 300, 286);
            
            //back left leg
            fill(175); 
            rect(103, 230, 120, 300);
            //back left leg right side
            fill(125);
            quad(120, 300, 120, 150, 130, 150, 130, 286);
             
            //table top
            fill(225); 
            quad(50, 200, 100, 150, 300, 150, 250, 200);// creates at quad with corner 1 @coordinates(50,200), 2@(100, 150), 3@(300, 150), 4@(250, 200)
            
            //table front
            fill(255);
            rect(50, 200, 250, 230);  
            
            //table right edge 
            fill(200); 
            quad(250, 230, 250, 200, 300, 150, 300, 180); // creates at quad with corner 1 @(250,230), 2@(250, 200), 3@(300, 150), 4@(300,180)
        }
        
        
      
      
      
     }