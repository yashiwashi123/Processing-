class CellularAutomata {
  int[][] grid;
  int columns;
  int rows;
  static final int resolution = 10;

  CellularAutomata(int columns, int rows) {
    this.columns = columns;
    this.rows = rows;
    grid = new int[columns][rows];    
    for (int x = 0; x < columns; x++) {
      for (int y = 0; y <rows; y++) {
        grid[x][y] = int(random(2));
      }
    }
  }

  void update() {
    int[][] next = new int[columns][rows];
    for (int x = 1; x < columns - 1; x++) {
      for (int y = 1; y < rows - 1; y++) {
        int neighbors = 0;
        for (int i = -1; i <=1; i++) {
          for (int j = -1; j <= 1; j++) {
            neighbors += grid[x+i][y+j];
          }
        }
        neighbors -= grid[x][y];

        if ((grid[x][y] == 1) && (neighbors <2)) {
          next[x][y] =0;
        } else if  ((grid[x][y] == 1) && (neighbors > 3)) {
          next[x][y] =0;
        } else if ((grid[x][y] == 0) && (neighbors == 3)) {
          next[x][y] =1;
        } else next[x][y] = grid[x][y];
      }
    }
    grid = next;
  }
  
  PVector magic(PVector position) {
    position.x/=resolution;
    position.y/=resolution;
    
    if(grid[(int)position.x][(int)position.y] == 0){
      PVector alive  = new PVector(-1,-1);
     alive.normalize(); 
     return alive;
    } else {
      PVector dead =  new PVector(1,1);
      dead.normalize(); 
      return dead; 
    }
  }

  void display() {
    for (int x = 0; x < columns; x++) {
      for (int y = 0; y <rows; y++) {
        if (grid[x][y] ==1) {
          fill(0);
        } else fill(255);
        stroke(0);

        rect(x*resolution, y*resolution, resolution, resolution);
      }
    }
  }
}