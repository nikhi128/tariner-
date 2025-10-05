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
        String action = req.getParameter("action");

        try {
            if ("add".equals(action)) {
                // ✅ Add new subject
                String name = req.getParameter("name");
                if (name != null && !name.trim().isEmpty()) {
                    Subject subject = new Subject();
                    subject.setName(name.trim());
                    sdao.addSubject(subject);
                }

            } else if ("delete".equals(action)) {
                // 🗑️ Delete subject
                int id = Integer.parseInt(req.getParameter("id"));
                sdao.deleteSubject(id);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        // ✅ Redirect back to subject list page after add/delete
        res.sendRedirect("subject");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");

        try {
            // ✅ Always get all subjects first
            List<Subject> subjectList = sdao.getAllSubjects();
            req.setAttribute("subjects", subjectList);

            // 🔍 Handle search if requested
            if ("searchById".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                Subject result = sdao.getSubjectById(id);
                req.setAttribute("searchResult", result);

            } else if ("searchByName".equals(action)) {
                String name = req.getParameter("name");
                Subject result = sdao.getSubjectByName(name);
                req.setAttribute("searchResult", result);
            }

            // ✅ Forward to JSP (always with subject list ready)
            req.getRequestDispatcher("subject.jsp").forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
