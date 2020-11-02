
import dal.ProductDAO;
import java.util.ArrayList;
import model.Category;
import model.Comment;
import model.Image;
import model.Product;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author #Panda
 */
public class Main {

    public static void main(String[] args) {
        ProductDAO productDB = new ProductDAO();
        Product product = productDB.getProductByID(3);
        ArrayList<Comment> comments = product.getComments();
        for (Comment c : comments) {
            System.out.println(c);
        }
    }
}
