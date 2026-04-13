package GameFG;
import java.util.Scanner;
import java.util.ArrayList;
public class Main {
    public static void main(String[] args) {

    	CustomerDAO dao = new CustomerDAO();

        Customer c1 = null;//= dao.getCustomer(1);

        if(c1 != null) {

            System.out.println(
                c1.getCustomerID() + " " +
                c1.getName() + " " +
                c1.getDateRegistered()
            );

        } else {
            System.out.println("Customer not found");
        }
    }
}
