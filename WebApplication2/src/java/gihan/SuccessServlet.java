package gihan;

import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class SuccessServlet extends HttpServlet {
    private static final String CLIENT_ID = "AaHjEFlpjbI-yTYdPo-Ie8G2mflUtokSRGeuryc6TCSGRAwe6ue-CV9OAfGkgTkoRg_RPiemzrsZYXQy";
    private static final String CLIENT_SECRET = "EBpBq-BHMLd-wRaHj4_axEHmfw7llZFaKPcNlSqPduJ2uyWizmXkDIT6fjIymHdZEySpdJZfPQ-DHjp_";
    private static final String MODE = "sandbox";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");

        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

        Payment payment = new Payment();
        payment.setId(paymentId);

        PaymentExecution paymentExecution = new PaymentExecution();
        paymentExecution.setPayerId(payerId);

        try {
            Payment executedPayment = payment.execute(apiContext, paymentExecution);
            response.getWriter().write("Payment successful: " + executedPayment.toJSON());
        } catch (PayPalRESTException e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}