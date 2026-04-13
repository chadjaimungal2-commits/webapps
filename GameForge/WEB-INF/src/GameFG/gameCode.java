public class gameCode {
    private int gameCodeID;
    private String gameID;
    private String OrderitemID;
    private String codeValue;
    private Boolean isRedeemed;

    public gameCode(int gameCodeID, String gameID, String OrderitemID, String codeValue, Boolean isRedeemed) {
        this.gameCodeID = gameCodeID;
        this.gameID = gameID;
        this.OrderitemID = OrderitemID;
        this.codeValue = codeValue;
        this.isRedeemed = isRedeemed;
    }

    public int getGameCodeID() {
        return gameCodeID;
    }

    public String getGameID() {
        return gameID;
    }

    public String getOrderitemID() {
        return OrderitemID;
    }

    public String getCodeValue() {
        return codeValue;
    }

    public Boolean getIsRedeemed() {
        return isRedeemed;
    }

}
