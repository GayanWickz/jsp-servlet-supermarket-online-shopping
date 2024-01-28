
package com.mycompany.supermarket;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

@WebServlet("/create_order")
public class create_order extends HttpServlet {

    // Replace with your actual PayPal sandbox credentials
    private final String clientId = "AZovmUB7eg8d5w4cgxO3AbgrZYDASxGOOiPcPasso9CDNARErdnzBkRN97snU5_kPSsy_Jh8tsV1iNPm";
    private final String clientSecret = "YEN-uB5W6eJLooKwyVGmSeRClKPdeCbCxsFqJ0T8ZvPBEH1xV6Fhuz5sr_P2VDVfn_GJgzriG6BdYatiE";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
          
            double total = Double.parseDouble(request.getParameter("total"));

            
            URL url = new URL("https://api.sandbox.paypal.com/v2/checkout/orders");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setRequestProperty("Authorization", "Basic " + getEncodedCredentials());

            
            String requestBody = "{\"intent\":\"CAPTURE\",\"purchase_units\":[{\"amount\":{\"currency_code\":\"USD\",\"value\":\"" + total + "\"}}]}";

           
            connection.setDoOutput(true);
            OutputStream os = connection.getOutputStream();
            os.write(requestBody.getBytes());
            os.flush();
            os.close();

            
            int responseCode = connection.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_CREATED) {
               
                response.getWriter().write(connection.getHeaderField("PayPal-Request-Id"));
            } else {
                
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } catch (Exception e) {
          
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    private String getEncodedCredentials() {
       
        String credentials = clientId + ":" + clientSecret;
        return java.util.Base64.getEncoder().encodeToString(credentials.getBytes());
    }
}