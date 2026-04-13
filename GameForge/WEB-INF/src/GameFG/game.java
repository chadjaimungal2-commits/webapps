package GameFG;

public class game {
     private String gameID;
     private String gameTitle;
     private String gameDescription;
     private double gamePrice;
     private String gameReleaseDate;
     private Boolean isDigital;
     private String gameGenre;
     private String gameImage;
     private String DeveloperConsole;

     public game(String gameID,String gameTitle, String gameDescription, double gamePrice, String gameReleaseDate, Boolean isDigital, String gameGenre, String gameImage, String DeveloperConsole) 
     {
         this.gameID = gameID;
         this.gameTitle = gameTitle;
         this.gameDescription = gameDescription;
         this.gamePrice = gamePrice;
         this.gameReleaseDate = gameReleaseDate;
         this.isDigital = isDigital;
         this.gameGenre = gameGenre;
         this.gameImage = gameImage;
         this.DeveloperConsole = DeveloperConsole;
     }
     public String getGameID() {
         return gameID;
     }

     public String getGameTitle() {
         return gameTitle;
     }
     

     public String getGameDescription() {
         return gameDescription;
     }

     public double getGamePrice() {
         return gamePrice;
     }

     public String getGameReleaseDate() {
         return gameReleaseDate;
     }

     public Boolean getIsDigital() {
         return isDigital;
     }

     public String getGameGenre() {
         return gameGenre;
     }

     public String getGameImage() {
         return gameImage;
     }

     public String getDeveloperConsole() {
         return DeveloperConsole;
     }
}