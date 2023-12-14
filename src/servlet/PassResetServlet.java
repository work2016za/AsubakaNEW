package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.DBUtility;

public class PassResetServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mail = request.getParameter("mail");
        String name = request.getParameter("name");

        String pass = retrievePassword(mail, name); // データベースからパスワードを取得

        if (pass != null) {
            request.setAttribute("pass", pass);
        } else {
            request.setAttribute("message", "一致するユーザーが見つかりませんでした。");
        }

        request.getRequestDispatcher("PassForget.jsp").forward(request, response);
    }

    private String retrievePassword(String mail, String name) {
        String pass = null;
        Connection connection = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(DBUtility.JDBC_URL, DBUtility.DB_USER, DBUtility.DB_PASSWORD);

            String sql = "SELECT pass FROM account WHERE mail = ? AND name = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, mail);
            statement.setString(2, name);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                pass = resultSet.getString("pass");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace(); 
            }
        }

        return pass;
    }
}
