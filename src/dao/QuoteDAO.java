package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import utils.DBUtility;

public class QuoteDAO {
    // データベース接続に使用する情報
//    private final String JDBC_URL = "jdbc:mysql://172.16.0.178:3306/Asubaka";
//    private final String DB_USER = "sa";
//    private final String DB_PASS = "";
//    
//	private final String url = DBUtility.JDBC_URL;
//	private final String user = DBUtility.DB_USER;
//	private final String password = DBUtility.DB_PASSWORD;

    public String getRandomQuoteAndAuthor() {
        try (Connection connection = DriverManager.getConnection(DBUtility.JDBC_URL, DBUtility.DB_USER, DBUtility.DB_PASSWORD)) {
            String query = "SELECT quotes, author FROM quotes ORDER BY RAND() LIMIT 1";
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String quote = resultSet.getString("quotes");
                String author = resultSet.getString("author");
                return quote + " - " + author;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "名言が見つかりませんでした。";
    }
}
