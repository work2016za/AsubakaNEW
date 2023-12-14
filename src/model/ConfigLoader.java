
package model;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import jakarta.servlet.ServletContext;

public class ConfigLoader {

    private static final String PROPERTIES_FILE = "/WEB-INF/config.properties";
    private static final Properties PROPERTIES = new Properties();

    public static void init(ServletContext context) {
        try {
            InputStream in = context.getResourceAsStream(PROPERTIES_FILE);
            if (in == null) {
                throw new FileNotFoundException("Property file " + PROPERTIES_FILE + " not found");
            }
            PROPERTIES.load(in);
        } catch (IOException e) {
            throw new RuntimeException("Failed to load properties", e);
        }
    }

    public static String getApiKey() {
        return PROPERTIES.getProperty("catapi.apikey");
    }
}


