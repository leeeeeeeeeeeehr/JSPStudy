package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/* web.xml에 매핑을 하는 대신
@WebServlet 어노테이션을 사용하여 요청명에 대한 매핑을 한다. */

@WebServlet("/12Servlet/AnnoMapping.do")
public class AnnoMapping extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
										throws ServletException, IOException {
		// request 영역에 속성을 저장한 후 JSP로 포워드 한다.
		req.setAttribute("message", "@WebServlet으로 매핑");
		req.getRequestDispatcher("/12Servlet/AnnoMapping.jsp").forward(req, resp);
	}

}
