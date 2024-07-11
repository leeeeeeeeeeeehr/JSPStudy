package model2.mvcboard;

import java.io.IOException;

import fileupload.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.JSFunction;

/* 글쓰기를 위한 서블릿 클래스는 doGet()과 doPost()를 둘 다 오버라이딩 한다.
글쓰기 페이지로 진입할 때는 get 방식의 요청이고
전송(submit)을 눌러 폼값을 서버로 전송할 떄는 post 방식으로 요청하게 된다. */
public class WriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 글쓰기 페이지로 진입할 때는 다른 로직 없이 포워드만 진행한다.
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
										throws ServletException, IOException {
		
		req.getRequestDispatcher("/14MVCBoard/Write.jsp").forward(req, resp);
	}
	
	// 글쓰기는 post 방식의 전송이므로 doPost()에서 요청을 처리한다.
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
										throws ServletException, IOException {

		/* 1 ) 파일 업로드 처리 */
		
		// 업로드 디렉터리의 물리적 경로 확인
		String saveDirectory = req.getServletContext().getRealPath("/Uploads");
		
		// 파일 업로드
		String originalFileName = "";
		try {
			// 업로드가 정상적으로 완료되면 원본 파일명을 변환한다.
			originalFileName = FileUtil.uploadFile(req, saveDirectory);
		}
		catch (Exception e) {
			e.printStackTrace();
			/* 파일 업로드 시 오류가 발생되면 경고창을 띄운 후 작성 페이지로 이동한다. */
			JSFunction.alertLocation(resp, "파일 업로드 오류입니다.", "../mvcboard/write.do");
			return;
		}
		
		/* 2 ) 파일 업로드 외 처리 */
		
		// 파일 외 폼값을 DTO에 저장한다.
		MVCBoardDTO dto = new MVCBoardDTO();
		dto.setName(req.getParameter("name"));
		dto.setTitle(req.getParameter("title"));
		dto.setContent(req.getParameter("content"));
		dto.setPass(req.getParameter("pass"));
		
		// 원본 파일명과 저장된 파일 이름 설정
		// 첨부파일이 정상적으로 등록되어 원본 파일명이 반환되었다면
		if (originalFileName != "") {
			// 파일명 변경
			// 파일명을 '날짜_시간.확장자' 형식으로 변경하고
			String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);
			// 원본 파일명과 저장된 파일명을 DTO에 저장한다.
			dto.setOfile(originalFileName);		// 원래 파일 이름
			dto.setSfile(savedFileName);		// 서버에 저장된 파일 이름
		}
		
		// DAO를 통해 DB에 게시 내용 저장
		MVCBoardDAO dao = new MVCBoardDAO();
		int result = dao.insertWrite(dto);
		dao.close();
		
		// 글쓰기 성공
		// insert에 성공한 경우에는 목록으로 이동하고
		if (result == 1) {
			resp.sendRedirect("../mvcboard/list.do");
		}
		// 글쓰기 실패
		// insert에 실패한 경우에는 쓰기 페이지로 이동한다.
		else {
			JSFunction.alertLocation(resp, "글쓰기에 실패했습니다.", "../mvcboard/write.do");
		}
	}
}
