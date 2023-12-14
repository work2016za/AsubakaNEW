package test;

import static org.junit.Assert.*;

import org.junit.Test;

import model.CatApi;

public class CatApiTest {

    @Test
    public void testGetRandomCatImage() {
        CatApi catApi = new CatApi();

        try {
            String imageUrl = catApi.getRandomCatImage();
            assertNotNull(imageUrl);
            assertTrue(imageUrl.startsWith("http")); // URLが"http"で始まることを
        } catch (Exception e) {
            fail("Exception thrown: " + e.getMessage());
        }
    }
}
