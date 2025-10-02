package Controller;

import java.io.IOException;
import java.util.List;
import DAO.SubjectDAO;
import POJO.Subject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/subject")
public class SubjectServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private SubjectDAO sdao;

    @Override
    public void init() throws ServletException {
        sdao = new SubjectDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String name = req.getParameter("name");

        if (name != null && !name.trim().isEmpty()) {
            Subject subject = new Subject();
            subject.setName(name.trim());
            try {
                sdao.addSubject(subject);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        res.sendRedirect("subject");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            List<Subject> subjectList = sdao.getAllSubjects();
            req.setAttribute("subjects", subjectList);
            req.getRequestDispatcher("subject.jsp").forward(req, res);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
