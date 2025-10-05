package Controller;

import java.io.IOException;

import DAO.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/forgotPassword")
public class ForgotPasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");

        UserDAO userDAO = new UserDAO();

        if (userDAO.isEmailExists(email)) {
            userDAO.updatePassword(email, newPassword);
            request.setAttribute("message", "✅ Password updated! You can now log in.");
        } else {
            request.setAttribute("error", "❌ Email not found. Please try again.");
        }

        request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
    }
}
