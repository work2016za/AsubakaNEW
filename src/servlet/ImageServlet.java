package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ImageServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 画像ファイルのパスを指定
        String imagePath = "WebContent/META-INF/images/mark.png"; // 画像ファイルへのパスを指定

        // 画像ファイルを読み込んでレスポンスに書き込む
        try (InputStream is = getServletContext().getResourceAsStream(imagePath);
             OutputStream os = response.getOutputStream()) {
            if (is == null) {
                // 画像ファイルが見つからない場合、エラーメッセージを送信
                response.setContentType("text/plain");
                os.write("Image not found.".getBytes());
            } else {
                // 画像ファイルのMIMEタイプを設定
                String contentType = getServletContext().getMimeType(imagePath);
                if (contentType == null) {
                    contentType = "application/octet-stream";
                }
                response.setContentType(contentType);

                // 画像データを読み込んでクライアントに送信
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = is.read(buffer)) != -1) {
                    os.write(buffer, 0, bytesRead);
                }
            }
        }
    }
}
