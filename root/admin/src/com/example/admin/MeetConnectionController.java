package com.example.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MenuController
 */
@WebServlet("/MeetConnectionController")
public class MeetConnectionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MeetConnectionController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF8");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		//コンテンツタイプの設定
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession(false);

		String reqDate = request.getParameter("date");

		String reqId = request.getParameter("id");
		String reqName = request.getParameter("name");
		String[] sqldata = {reqId,reqDate};

		String[] result = PostgresConect.employeeMeetDateSelect(sqldata);

		int count = result.length; // resultの長さを取得するコード
		String countString = Integer.toString(count); // intをStringに変換

		//String resID = "";
		String resDate = "";
		String resSituation = "";
		String resOpinion = "";
		String resTransfer = "";
		String resAnalysis = "";
		String resCheck_1_1 = "";
		String resCheck_1_2 = "";
		String resCheck_1_3 = "";
		String resCheck_2_1 = "";
		String resCheck_2_2 = "";
		String resCheck_2_3 = "";
		String resCheck_3_1 = "";
		String resCheck_3_2 = "";
		String resCheck_3_3 = "";
		String resCheck_4_1 = "";
		String resCheck_4_2 = "";
		String resCheck_4_3 = "";
		String resCheck_5_1 = "";
		String resCheck_5_2 = "";
		String resCheck_5_3 = "";
		String resCheck_6_1 = "";
		String resCheck_6_2 = "";
		String resCheck_6_3 = "";

		String tmp = "";
		String[] tmpSplit = new String[24];

		// SQL中身を成形
		for (int i = 0; i < count; i++) {
			tmp = result[i];
			tmpSplit = tmp.split(",");

			//resID = tmpSplit[0];
			resDate = tmpSplit[1];
			resSituation = tmpSplit[2];
			resOpinion = tmpSplit[3];
			resTransfer = tmpSplit[4];
			resAnalysis = tmpSplit[5];
			resCheck_1_1 = tmpSplit[6];
			resCheck_1_2 = tmpSplit[7];
			resCheck_1_3 = tmpSplit[8];
			resCheck_2_1 = tmpSplit[9];
			resCheck_2_2 = tmpSplit[10];
			resCheck_2_3 = tmpSplit[11];
			resCheck_3_1 = tmpSplit[12];
			resCheck_3_2 = tmpSplit[13];
			resCheck_3_3 = tmpSplit[14];
			resCheck_4_1 = tmpSplit[15];
			resCheck_4_2 = tmpSplit[16];
			resCheck_4_3 = tmpSplit[17];
			resCheck_5_1 = tmpSplit[18];
			resCheck_5_2 = tmpSplit[19];
			resCheck_5_3 = tmpSplit[20];
			resCheck_6_1 = tmpSplit[21];
			resCheck_6_2 = tmpSplit[22];
			resCheck_6_3 = tmpSplit[23];

		}

		empListData[] jsonData = empListData.empJson();
		request.setAttribute("jsonData", jsonData);

		request.setAttribute("count", Integer.valueOf(countString));
		request.setAttribute("resID", reqId);
		request.setAttribute("resDate", resDate);
		request.setAttribute("resName", reqName);
		request.setAttribute("resSituation", resSituation);
		request.setAttribute("resOpinion", resOpinion);
		request.setAttribute("resTransfer", resTransfer);
		request.setAttribute("resAnalysis", resAnalysis);
		request.setAttribute("resCheck_1_1", resCheck_1_1);
		request.setAttribute("resCheck_1_2", resCheck_1_2);
		request.setAttribute("resCheck_1_3", resCheck_1_3);
		request.setAttribute("resCheck_2_1", resCheck_2_1);
		request.setAttribute("resCheck_2_2", resCheck_2_2);
		request.setAttribute("resCheck_2_3", resCheck_2_3);
		request.setAttribute("resCheck_3_1", resCheck_3_1);
		request.setAttribute("resCheck_3_2", resCheck_3_2);
		request.setAttribute("resCheck_3_3", resCheck_3_3);
		request.setAttribute("resCheck_4_1", resCheck_4_1);
		request.setAttribute("resCheck_4_2", resCheck_4_2);
		request.setAttribute("resCheck_4_3", resCheck_4_3);
		request.setAttribute("resCheck_5_1", resCheck_5_1);
		request.setAttribute("resCheck_5_2", resCheck_5_2);
		request.setAttribute("resCheck_5_3", resCheck_5_3);
		request.setAttribute("resCheck_6_1", resCheck_6_1);
		request.setAttribute("resCheck_6_2", resCheck_6_2);
		request.setAttribute("resCheck_6_3", resCheck_6_3);

		RequestDispatcher dispatcher =  request.getRequestDispatcher("/meet.jsp");
		request.setAttribute("name", (String) session.getAttribute("name"));
		//フォワードの実行
		dispatcher.forward(request, response);


	}

}

