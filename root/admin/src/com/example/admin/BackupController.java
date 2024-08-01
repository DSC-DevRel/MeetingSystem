package com.example.admin;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BackupController
 */
@WebServlet("/BackupController")
public class BackupController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public BackupController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//コンテンツタイプの設定
		request.setCharacterEncoding("UTF8");
		response.setContentType("text/html; charset=UTF8");
		//HttpSession session = request.getSession(false);

		try {
			// シェルコマンドを実行するディレクトリ
            File directory = new File("/usr/shell");

            // コマンドを実行するためのプロセスビルダーを作成
            ProcessBuilder pb = new ProcessBuilder("/bin/bash", "-c", "/usr/shell/shell_pgback.sh");
            pb.directory(directory);

            // プロセスを開始
            Process process = pb.start();

            // コマンドの出力を読み取る
            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
            }

            // プロセスの終了を待機
            int exitCode = process.waitFor();
            String result = "Exited with error code " + exitCode;
            if (exitCode == 0) {
            	result = "バックアップに成功しました。 終了コード：" + exitCode;
            } else {
            	result = "バックアップに失敗しました。 終了コード：" + exitCode;
            }

            RequestDispatcher dispatcher =  request.getRequestDispatcher("/backup.jsp");
			request.setAttribute("err", result );
			//フォワードの実行
			dispatcher.forward(request, response);

		} catch (Exception e) {
			String result = "何らかのエラー" + e;

			RequestDispatcher dispatcher =  request.getRequestDispatcher("/backup.jsp");
			request.setAttribute("err", result );
			//フォワードの実行
			dispatcher.forward(request, response);
		}
	}

}