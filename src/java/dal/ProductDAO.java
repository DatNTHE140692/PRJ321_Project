/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Comment;
import model.Image;
import model.Product;

/**
 *
 * @author #Panda
 */
public class ProductDAO extends BaseDAO {

    public ArrayList<Product> getProducts() {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT p.pid, p.pname, p.price, p.pshortdesc, p.pdesc, p.available, ISNULL(c.cid, -1) cid, c.cname, ISNULL(pi.imgid, -1) imgid, pi.imageURL FROM dbo.Products p LEFT OUTER JOIN dbo.Product_Categories pc ON pc.pid = p.pid LEFT OUTER JOIN dbo.Categories c ON c.cid = pc.cid  LEFT OUTER JOIN dbo.Product_Images pi ON pi.pid = p.pid";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            Product product = new Product();
            product.setId(-1);
            Category category = new Category();
            category.setId(-1);
            Image image = new Image();
            image.setId(-1);
            while (rs.next()) {
                int pid = rs.getInt("pid");
                if (product.getId() != pid) {
                    product = new Product();
                    product.setId(pid);
                    product.setName(rs.getString("pname"));
                    product.setPrice(rs.getFloat("price"));
                    product.setShortDesc(rs.getString("pshortdesc"));
                    product.setDesc(rs.getString("pdesc"));
                    product.setAvailable(rs.getBoolean("available"));
                    products.add(product);
                }
                int cateid = rs.getInt("cid");
                if (cateid != category.getId() && cateid != -1) {
                    category = new Category();
                    category.setId(cateid);
                    category.setName(rs.getString("cname"));
                    product.getCategories().add(category);
                }
                int imgid = rs.getInt("imgid");
                if (imgid != image.getId() && imgid != -1) {
                    image = new Image();
                    image.setId(imgid);
                    image.setImgSrc(rs.getString("imageURL"));
                    product.getImages().add(image);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public Product getProductByID(int id) {
        try {
            String sql = "SELECT p.pid, p.pname, p.price, p.pshortdesc, p.pdesc, p.available, ISNULL(c.cid, -1) cid, c.cname, ISNULL(pi.imgid, -1) imgid, pi.imageURL FROM dbo.Products p LEFT OUTER JOIN dbo.Product_Categories pc ON pc.pid = p.pid LEFT OUTER JOIN dbo.Categories c ON c.cid = pc.cid  LEFT OUTER JOIN dbo.Product_Images pi ON pi.pid = p.pid WHERE p.pid = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            Product product = new Product();
            product.setId(-1);
            Category category = new Category();
            category.setId(-1);
            Image image = new Image();
            image.setId(-1);
            Comment comment = new Comment();
            comment.setId(-1);
            while (rs.next()) {
                int pid = rs.getInt("pid");
                if (product.getId() != pid) {
                    product = new Product();
                    product.setId(pid);
                    product.setName(rs.getString("pname"));
                    product.setPrice(rs.getFloat("price"));
                    product.setShortDesc(rs.getString("pshortdesc"));
                    product.setDesc(rs.getString("pdesc"));
                    product.setAvailable(rs.getBoolean("available"));
                }
                int cateid = rs.getInt("cid");
                if (cateid != category.getId() && cateid != -1) {
                    category = new Category();
                    category.setId(cateid);
                    category.setName(rs.getString("cname"));
                    product.getCategories().add(category);
                }
                int imgid = rs.getInt("imgid");
                if (imgid != image.getId() && imgid != -1) {
                    image = new Image();
                    image.setId(imgid);
                    image.setImgSrc(rs.getString("imageURL"));
                    product.getImages().add(image);
                }
            }
            return product;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
