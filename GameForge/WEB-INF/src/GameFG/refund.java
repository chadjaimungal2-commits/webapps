public class refund {
    private int refundID;
    private String OrderItemID;
    private String employeeID;
    private String RefundReason;
    private String RefundStatus;
    private String RefundDate;

    public refund(int refundID, String OrderItemID, String employeeID, String RefundReason, String RefundStatus, String RefundDate) {
        this.refundID = refundID;
        this.OrderItemID = OrderItemID;
        this.employeeID = employeeID;
        this.RefundReason = RefundReason;
        this.RefundStatus = RefundStatus;
        this.RefundDate = RefundDate;
    }

    public int getRefundID() {
        return refundID;
    }

    public String getOrderItemID() {
        return OrderItemID;
    }

    public String getEmployeeID() {
        return employeeID;
    }

    public String getRefundReason() {
        return RefundReason;
    }

    public String getRefundStatus() {
        return RefundStatus;
    }

    public String getRefundDate() {
        return RefundDate;
    }
    
}
