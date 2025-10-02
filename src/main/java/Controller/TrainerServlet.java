package Controller;

import DAO.TrainerDAO;
import POJO.Trainer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/trainer")
public class TrainerServlet extends HttpServlet {
    private TrainerDAO trainerDAO;

    @Override
    public void init() throws ServletException {
        trainerDAO = new TrainerDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        List<Trainer> trainers = null;
		try {
			trainers = trainerDAO.getAllTrainers();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        request.setAttribute("trainers", trainers);
        request.getRequestDispatcher("trainer.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("actionType");

        try {
            if ("delete".equals(action)) {
                int empId = Integer.parseInt(request.getParameter("empId"));
                trainerDAO.deleteTrainer(empId);
            } else {
                String name = request.getParameter("name");
                String subject = request.getParameter("subject");

                Trainer trainer = new Trainer();
                trainer.setName(name);
                trainer.setSubject(subject);

                trainerDAO.addTrainer(trainer);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("trainer");
    }
}