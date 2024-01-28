/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.supermarket;

import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;


/**
 *
 * @author Gayan Wickz
 */
@WebServlet(name = "Email_Servlet", urlPatterns = {"/Email_Servlet"})
public class Email_Servlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

      
        String TO_Email = request.getParameter("email");

      
        if (TO_Email != null && !TO_Email.isEmpty()) {
          
            String from = "greenmartnsbm@gmail.com";

            
            String to = TO_Email;

           
            String password = "iwco zltd hqaa tazf ";

           
            Properties properties = new Properties();
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.starttls.enable", "true");
            properties.put("mail.smtp.host", "smtp.gmail.com");
            properties.put("mail.smtp.port", "587");

            // Get the Session object
            Session session = Session.getInstance(properties, new jakarta.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(from, password);
                }
            });

            try {
              
                MimeMessage message = new MimeMessage(session);

              
                message.setFrom(new InternetAddress(from));

               
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

              
                message.setSubject("Thanks For purchase ");

               
                message.setText("Hello, Thank you for your recent purchase. We are honored to gain you as a customer and hope to serve you for a long time.!");

              
                Transport.send(message);

                System.out.println("Sent message successfully...");

            } catch (MessagingException mex) {
                mex.printStackTrace();
            }
        } else {
           
            System.out.println("Invalid email address");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    public String getServletInfo() {
        return "Email Servlet";
    }
}
