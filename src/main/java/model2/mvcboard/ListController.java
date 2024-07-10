package model2.mvcboard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.BoardPage;

/* 게시판 목록을 위한 컨트롤러 (서블릿 클래스),
매핑은 web.xml에 처리했다. */
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 목록으로 진입은 get 방식이므로 doGet() 메서드 오버라이딩
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
										throws ServletException, IOException {
		
		// 커넥션풀을 이용한 DB 연결
		MVCBoardDAO dao = new MVCBoardDAO();
		
		// 게시물의 구간 및 검색어 관련 파라미터 저장을 위한 Map 계열의 컬렉션 생성
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 검색어 파라미터가 있는 경우 값을 받은 후 Map에 저장한다.
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		if (searchWord != null) {
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		
		// 게시물의 갯수를 카운트, 검색어가 있다면 where절이 추가된다.
		int totalCount = dao.selectCount(map);

		/*************** 페이징 관련 코드 추가 ***************/
		
		/* 모델2 방식의 게시판에서는 요청을 서블릿이 먼저 받으므로
		내장객체 사용을 위해선 반드시 아래와 같이 메서드를 통해 객체를 얻어온 후 사용해야 한다. */
		ServletContext application = getServletContext();
//		ServletContext application = this.getServletContext(); 	// this는 생략 가능하다.
		
		// web.xml에 저장한 컨텍스트 초기화 파라미터를 얻어온다.
		// 한 페이지에 출력할 게시물의 갯수
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		// 한 블럭 당 출력할 페이지 번호의 갯수
		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));

		// 현재 페이지 번호 설정 (처음 접속 시 무조건 1페이지로 설정)
		int pageNum = 1;
		String pageTemp = req.getParameter("pageNum");
		if (pageTemp != null && !pageTemp.equals("")) {
			pageNum = Integer.parseInt(pageTemp);
		}

		// 목록에 출력할 게시물의 범위를 계산하여 Map에 저장한다.
		int start = (pageNum - 1) * pageSize + 1;
		int end = pageNum * pageSize;
		map.put("start", start);
		map.put("end", end);
		
		/***********************************************/
		
		// 해당 페이지에 출력할 게시물을 List로 얻어온다.
		List<MVCBoardDTO> boardLists = dao.selectListPage(map);
		dao.close();
		
		// 페이지 번호를 String으로 반환
		String pagingImg = BoardPage.pagingStr(totalCount, pageSize,
										blockPage, pageNum, "../mvcboard/list.do");
		
		// 페이지 번호
		map.put("pagingImg", pagingImg);
		// 전체 게시물의 갯수
		map.put("totalCount", totalCount);
		// 한 페이지에 출력할 게시물의 갯수
		map.put("pageSize", pageSize);
		// 현재 페이지 번호
		map.put("pageNum", pageNum);
		
		// View(JSP 페이지)로 전달할 데이터를 request 영역에 저장
		req.setAttribute("boardLists", boardLists);
		req.setAttribute("map", map);
		// 포워드
		req.getRequestDispatcher("/14MVCBoard/List.jsp").forward(req, resp);
	}
}
