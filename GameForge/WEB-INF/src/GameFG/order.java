public class order {
    private String orderID;
    private String customerID;
    private String orderDate;
    private String TotalAmount;
    private String orderStatus;

    public order(String orderID, String customerID, String orderDate, String TotalAmount, String orderStatus) {
        this.orderID = orderID;
        this.customerID = customerID;
        this.orderDate = orderDate;
        this.TotalAmount = TotalAmount;
        this.orderStatus = orderStatus;
    }

    public String getOrderID() {
        return orderID;
    }

    public String getCustomerID() {
        return customerID;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public String getTotalAmount() {
        return TotalAmount;
    }

    public String getOrderStatus() {
        return orderStatus;
    }
    
}
