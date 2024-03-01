import de.bezier.guido.*;
//Declare and initialize constants NUM_ROWS and NUM_COLS = 20
public static final int numRows = 10;
public static final int numCols = 10;
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> mines; //ArrayList of just the minesweeper buttons that are mined
void setup (){
    size(400, 400);
    textAlign(CENTER,CENTER);
    Interactive.make( this );
    buttons = new MSButton[numRows][numCols];
    for(int i = 0; i < numRows; i++){
      for(int j = 0; j < numCols; j++){
        buttons[i][j] = new MSButton(i, j);
      }
    }
    mines = new ArrayList <MSButton>();
    setMines();
}
public void setMines(){
    int row = (int) (Math.random()+(numRows-1));
    int col = (int) (Math.random()+(numCols-1));
    if(!mines.contains(buttons[row][col])){
      mines.add(buttons[row][col]);
    }
}
public void draw(){
    background( 0 );
    if(isWon() == true)
        displayWinningMessage();
}
public boolean isWon(){
    //your code here
    return false;
}
public void displayLosingMessage(){
    //your code here
}
public void displayWinningMessage(){
    //your code here
}
public boolean isValid(int r, int c){
  if(r < numRows && c < numCols && r >= 0 && c >= 0){
    return true;
  } 
  return false;
}
public int countMines(int row, int col){
    int numMines = 0;
    for(int i = row-1; i < row+2; i++){
      for(int j = col-1; j < col+2; j++){
        if(isValid(i, j)){
          if(mines.contains(buttons[i][j]) && row == i && col == j){
            numMines+=0;
          } else if(mines.contains(buttons[i][j])){
            numMines++;
          }
        }
      }
    }
    return numMines;
}
public class MSButton{
    private int myRow, myCol;
    private float x,y, width, height;
    private boolean clicked, flagged;
    private String myLabel;
    public MSButton(int row, int col){
        width = 400/numCols;
        height = 400/numRows;
        myRow = row;
        myCol = col; 
        x = myCol*width;
        y = myRow*height;
        myLabel = "";
        flagged = clicked = false;
        Interactive.add( this ); // register it with the manager
    }
    // called by manager
    public void mousePressed(){
        clicked = true;
        if(){
          if(flagged == false){
            clicked = false;
          }
          flagged = !clicked;
        } else if(mines.contains(buttons[myRow][myCol])){
          displayLosingMessage();
        }
    }
    public void draw(){    
        if(flagged){
          fill(0);
        } else if(clicked && mines.contains(this)) {
          fill(255,0,0);
        } else if(clicked){
          fill(200);
        } else{
          fill(100);
        }
        rect(x, y, width, height);
        fill(0);
        text(myLabel,x+width/2,y+height/2);
    }
    public void setLabel(String newLabel){
        myLabel = newLabel;
    }
    public void setLabel(int newLabel){
        myLabel = ""+ newLabel;
    }
    public boolean isFlagged(){
        return flagged;
    }
}
