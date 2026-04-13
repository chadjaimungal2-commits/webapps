package GameFG;
public class Employee {
    private String employeeID;
    private String HireDate;
    private String employeeName;
    private String ContactNumber;
    private String employeeEmail;
    private String employeePassword;

    public Employee(String employeeID, String HireDate, String employeeName, String ContactNumber, String employeeEmail, String employeePassword) {
        this.employeeID = employeeID;
        this.HireDate = HireDate;
        this.employeeName = employeeName;
        this.ContactNumber = ContactNumber;
        this.employeeName = employeeName;
        this.employeeEmail = employeeEmail;
        this.employeePassword = employeePassword;
    }

    public String getEmployeeID() {
        return employeeID;
    }

    public String getHireDate() {
        return HireDate;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public String getContactNumber() {
        return ContactNumber;
    }

    public String getEmployeeEmail() {
        return employeeEmail;
    }

    public String getEmployeePassword() {
        return employeePassword;
    }

}
