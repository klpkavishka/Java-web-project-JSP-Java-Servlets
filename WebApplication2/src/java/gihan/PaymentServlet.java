package gihan;

import com.paypal.api.payments.*;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class PaymentServlet extends HttpServlet {

    private static final String CLIENT_ID = "AaHjEFlpjbI-yTYdPo-Ie8G2mflUtokSRGeuryc6TCSGRAwe6ue-CV9OAfGkgTkoRg_RPiemzrsZYXQy";
    private static final String CLIENT_SECRET = "EBpBq-BHMLd-wRaHj4_axEHmfw7llZFaKPcNlSqPduJ2uyWizmXkDIT6fjIymHdZEySpdJZfPQ-DHjp_";
    private static final String MODE = "sandbox";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Create API context with client ID, client secret, and mode (sandbox/production)
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

        String total_para = request.getParameter("total");
System.out.println("Total parameter: " + total_para); // Check if 'total' is being received correctly


        // Handle invalid amount input gracefully
        if (total_para == null || total_para.isEmpty()) {
            response.getWriter().write("Error: Amount is required.");
            return;
        }

        double totalAmount = 0.0;
        try {
            totalAmount = Double.parseDouble(total_para);
        } catch (NumberFormatException e) {
            response.getWriter().write("Error: Invalid amount format.");
            return;
        }

        // Format amount to two decimal places
        String formattedAmount = String.format("%.2f", totalAmount);

        // Set up the payment amount
        Amount amount = new Amount();
        amount.setCurrency("USD");
        amount.setTotal(formattedAmount); // Payment amount

        // Set up the transaction
        Transaction transaction = new Transaction();
        transaction.setDescription("Payment Description");
        transaction.setAmount(amount);

        // Create a list of transactions
        List<Transaction> transactions = new ArrayList<>();
        transactions.add(transaction);

        // Set up payer details (PayPal as the payment method)
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");

        // Set up the payment object
        Payment payment = new Payment();
        payment.setIntent("sale");
        payment.setPayer(payer);
        payment.setTransactions(transactions);

        // Set up redirect URLs (for success and cancel actions)
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:8080/yourproject/cancel");
        redirectUrls.setReturnUrl("http://localhost:8080/yourproject/success");
        payment.setRedirectUrls(redirectUrls);

        try {
            // Create the payment and get approval URL
            Payment createdPayment = payment.create(apiContext);
            for (Links link : createdPayment.getLinks()) {
                if (link.getRel().equals("approval_url")) {
                    response.sendRedirect(link.getHref()); // Redirect to PayPal for approval
                    return;
                }
            }
        } catch (PayPalRESTException e) {
            // Log exception details and send error response
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}