package GameFG;

public class Customer {

    private int customerID;
    private String dateRegistered;
    private String birthDate;
    private String phoneNo;
    private String email;
    private String name;
    private String password;

    public Customer(int customerID, String dateRegistered, String birthDate,
                    String phoneNo, String email, String name, String password) {

        this.customerID = customerID;
        this.dateRegistered = dateRegistered;
        this.birthDate = birthDate;
        this.phoneNo = phoneNo;
        this.email = email;
        this.name = name;
        this.password = password;
    }

    public int getCustomerID() { return customerID; }
    public String getDateRegistered() { return dateRegistered; }
    public String getBirthDate() { return birthDate; }
    public String getPhoneNo() { return phoneNo; }
    public String getEmail() { return email; }
    public String getName() { return name; }
    public String getPassword() { return password; }
}