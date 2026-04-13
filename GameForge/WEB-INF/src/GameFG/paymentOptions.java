public class paymentOptions {
        private int PaymentID;
        private String OrderID;
        private String PaymentMethod;
        private String PaymentDate;
        private Double Amount;
        private String PaymentStatus;

        public paymentOptions(int PaymentID, String OrderID, String PaymentMethod, String PaymentDate, Double Amount, String PaymentStatus) {
            this.PaymentID = PaymentID;
            this.OrderID = OrderID;
            this.PaymentMethod = PaymentMethod;
            this.PaymentDate = PaymentDate;
            this.Amount = Amount;
            this.PaymentStatus = PaymentStatus;
        }
        public int getPaymentID() {
            return PaymentID;
        }   
        
        public String getOrderID() {
            return OrderID;
        }

        public String getPaymentMethod() {
            return PaymentMethod;
        }

        public String getPaymentDate() {
            return PaymentDate;
        }

        public Double getAmount() {
            return Amount;
        }

        public String getPaymentStatus() {
            return PaymentStatus;
        }

}
