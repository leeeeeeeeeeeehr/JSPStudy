package el;

public class MyELClass {
	
	// 주민번호로 성별을 판단하는 메서드
	public String getGender(String jumin) {
		String returnStr = "";
		// 매개변수로 전달된 값에서 '-'의 위치를 찾아 1을 더한다.
		int beginIdx = jumin.indexOf("-") + 1;
		// 주민번호에서 성별에 해당하는 문자를 추출한다.
		String genderStr = jumin.substring(beginIdx, beginIdx + 1);
		// 추출한 문자를 정수로 변환한다.
		int genderInt = Integer.parseInt(genderStr);
		// 변환한 정수로 성별을 판단한다.
		if (genderInt == 1 || genderInt == 3) {
			returnStr = "남자";
		}
		else if (genderInt == 2 || genderInt == 4) {
			returnStr = "여자";
		}
		else {
			returnStr = "주민번호 오류입니다.";
		}
		// 판단한 결과를 반환한다.
		return returnStr;
	}
	
	// 구구단을 출력하는 메서드, static으로 선언되어 클래스명을 직접 호출할 수 있다.
	public static String showGugudan(int limitDan) {
		/* 반환할 문자열의 변화가 많은 경우에는 String보다 메모리를 절약할 수 있다.
		문자열이 추가될 때 기존의 메모리를 확장하여 저장한다. */
		StringBuffer sb = new StringBuffer();
		// limitDan까지 구구단을 출력하여 테이블로 만든 후 반환한다.
		try {
			sb.append("<table border = '1'>");
			for (int i = 2; i <= limitDan; i++) {
				sb.append("<tr>");
				for (int j = 1; j<= 9; j++) {
					sb.append("<td>" + i + "*" + j + "=" + (i * j) + "</td>");
				}
				sb.append("</tr>");
			}
			sb.append("</table>");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return sb.toString();
	}
}
