package fileupload;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/13FileUpload/MultiProcess.do")
@MultipartConfig (
		maxFileSize = 1024 * 1024 * 1,
		maxRequestSize = 1024 * 1024 * 10
)
public class MultipleProcess extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
										throws ServletException, IOException {
		
		try {
			// 업로드 디렉토리의 물리적 경로
			String saveDirectory = getServletContext().getRealPath("/Uploads");
			// 선택한 파일 업로드
			ArrayList<String> listFileName = FileUtil.multipleFile(req, saveDirectory);
			// List에 저장된 파일의 갯수만큼 반복하여 파일명 변경
			for (String originalFileName : listFileName) {
				String saveFileName = FileUtil.renameFile(saveDirectory, originalFileName);;
			}
			// 업로드가 완료되면 목록으로 아ㅏ욺=
			resp.sendRedirect("FileList.jsp");
		}
		catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("errorMessage", "파일 업로드 오류");
			req.getRequestDispatcher("MultiUploadMain.jsp").forward(req, resp);
		}
	}
}
