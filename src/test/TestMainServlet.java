package test;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/TestMainServlet")
public class TestMainServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String daysParam = request.getParameter("days");
        int days = 0;  // デフォルト値
        if (daysParam != null && !daysParam.isEmpty()) {
            try {
                days = Integer.parseInt(daysParam);
            } catch (NumberFormatException e) {
                // 適切なエラー処理を行う
            }
        }
            
        boolean isCompleted = false;
        if (days >= 66) {
            isCompleted = true;
            // 以下、RewardServletのロジック
            String reward = request.getParameter("reward");
            request.setAttribute("reward", reward);
            request.getRequestDispatcher("reward.jsp").forward(request, response);
            return;
        }

        // データをリクエスト属性に設定
        request.setAttribute("name", name);
        request.setAttribute("days", days);
        request.setAttribute("isCompleted", isCompleted);  // 66日を超えたかどうかの情報を渡す

        // main.jspにフォワード
        request.getRequestDispatcher("main.jsp").forward(request, response);
    }
}
