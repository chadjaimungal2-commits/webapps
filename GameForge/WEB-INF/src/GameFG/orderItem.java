public class orderItem {
    private String orderItemID;
    private String orderID;
    private String gameID;
    private int quantity;
    private Double priceAtPurchase;

    public orderItem(String orderItemID, String orderID, String gameID, int quantity, Double priceAtPurchase) {
        this.orderItemID = orderItemID;
        this.orderID = orderID;
        this.gameID = gameID;
        this.quantity = quantity;
        this.priceAtPurchase = priceAtPurchase;
    }

    public String getOrderItemID() {
        return orderItemID;
    }

    public String getOrderID() {
        return orderID;
    }

    public String getGameID() {
        return gameID;
    }

    public int getQuantity() {
        return quantity;
    }

    public Double getPriceAtPurchase() {
        return priceAtPurchase;
    }
    
}
