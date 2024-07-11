package model2.mvcboard;

import java.io.IOException;

import fileupload.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/mvcboard/download.do")
public class DownloadController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
											throws ServletException, IOException {
		
		// 파일 다운로드 링크를 통해 전달되는 3개의 파라미터 받기
		String ofile = req.getParameter("ofile");	// 원본 파일명
		String sfile = req.getParameter("sfile");	// 저장된 파일명
		String idx = req.getParameter("idx");		// 게시물 일련번호
		
		// 다운로드 메서드 호출 및 파일 다운로드
		FileUtil.download(req, resp, "/Uploads", sfile, ofile);
		
		// 다운로드 완료 후 카운트 증가
		MVCBoardDAO dao = new MVCBoardDAO();
		dao.downCountPlus(idx);
		dao.close();
	}
}
