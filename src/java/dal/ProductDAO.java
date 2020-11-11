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
import java.util.HashMap;
import java.util.Map;
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

    public Product getProductByID(int id) {
        try {
            String sql = "SELECT p.pid, p.pname, p.price, p.pshortdesc, p.pdesc, p.available, p.pthumbnail, ISNULL(c.cid, -1) cid, c.cname, ISNULL(pi.imgid, -1) imgid, pi.imageURL FROM dbo.Products p LEFT OUTER JOIN dbo.Product_Categories pc ON pc.pid = p.pid LEFT OUTER JOIN dbo.Categories c ON c.cid = pc.cid  LEFT OUTER JOIN dbo.Product_Images pi ON pi.pid = p.pid WHERE p.pid = ?";
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
                    product.setThumbnail(rs.getString("pthumbnail"));
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

    public ArrayList<Product> get4LatestProducts() {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT TOP 4 * FROM dbo.Products ORDER BY pid DESC";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("pid"));
                product.setName(rs.getString("pname"));
                product.setPrice(rs.getFloat("price"));
                product.setThumbnail(rs.getString("pthumbnail"));
                products.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public ArrayList<Product> getStoreProducts(int pageIndex, int pageSize) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "WITH r AS (SELECT ROW_NUMBER() OVER (ORDER BY pid DESC) rownum, pid, pname, price, pthumbnail FROM Products) SELECT * FROM r WHERE r.rownum >= (? - 1) * ? + 1 AND r.rownum <= ? * ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pageIndex);
            st.setInt(2, pageSize);
            st.setInt(3, pageIndex);
            st.setInt(4, pageSize);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("pid"));
                product.setName(rs.getString("pname"));
                product.setPrice(rs.getFloat("price"));
                product.setThumbnail(rs.getString("pthumbnail"));
                products.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public int getTotalProducts() {
        int cnt = 0;
        try {
            String sql = "SELECT COUNT(*) total FROM Products";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                cnt = rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cnt;
    }

    public ArrayList<Product> getProductsByCID(int cid, int pageIndex, int pageSize) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "WITH r AS (SELECT ROW_NUMBER() OVER (ORDER BY p.pid DESC) rownum, p.pid, p.pname, p.price, p.pthumbnail  FROM dbo.Product_Categories pc INNER JOIN dbo.Products p ON p.pid = pc.pid WHERE pc.cid = ?) SELECT * FROM r WHERE r.rownum >= (? - 1) * ? + 1 AND r.rownum <= ? * ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            st.setInt(2, pageIndex);
            st.setInt(3, pageSize);
            st.setInt(4, pageIndex);
            st.setInt(5, pageSize);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("pid"));
                product.setName(rs.getString("pname"));
                product.setPrice(rs.getFloat("price"));
                product.setThumbnail(rs.getString("pthumbnail"));
                products.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public int getTotalProductsByCID(int cid) {
        int cnt = 0;
        try {
            String sql = "SELECT COUNT(*) total FROM dbo.Product_Categories WHERE cid = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                cnt = rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cnt;
    }

    public ArrayList<Product> getProductsByKeyword(String keyword, int pageIndex, int pageSize) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "WITH r AS (SELECT ROW_NUMBER() OVER (ORDER BY pid) rownum, * FROM Products WHERE pname LIKE '%' + ? + '%') SELECT * FROM r WHERE r.rownum >= (? - 1) * ? + 1 AND r.rownum <= ? * ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, keyword);
            st.setInt(2, pageIndex);
            st.setInt(3, pageSize);
            st.setInt(4, pageIndex);
            st.setInt(5, pageSize);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("pid"));
                product.setName(rs.getString("pname"));
                product.setPrice(rs.getFloat("price"));
                product.setThumbnail(rs.getString("pthumbnail"));
                products.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public int getTotalProductsByKeyword(String keyword) {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) total FROM Products WHERE pname LIKE '%' + ? + '%'";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, keyword);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public ArrayList<Product> getProductsByOrder(int orderID) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT p.pname, p.price, p.pthumbnail, od.quantity FROM dbo.OrderDetails od INNER JOIN dbo.Products p ON od.productID = p.pid WHERE od.orderID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setName(rs.getString("pname"));
                product.setPrice(rs.getFloat("price"));
                product.setQuantity(rs.getInt("quantity"));
                product.setThumbnail(rs.getString("pthumbnail"));
                products.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public ArrayList<Product> filterProduct(String keyword, int cateid, float priceFrom, float priceTo, int pageIndex, int pageSize) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "WITH r AS (SELECT ROW_NUMBER() OVER (ORDER BY p.pid DESC) rownum, p.pid, pname, price, pthumbnail, pc.cid FROM dbo.Products p INNER JOIN dbo.Product_Categories pc ON pc.pid = p.pid WHERE 1 = 1";
            int paramCount = 0;
            HashMap<Integer, Object[]> parameters = new HashMap<>();
            if (keyword != null && !keyword.trim().isEmpty()) {
                sql += " AND p.pname LIKE '%' + ? + '%'";
                ++paramCount;
                Object[] params = new Object[2];
                params[0] = "STRING";
                params[1] = keyword;
                parameters.put(paramCount, params);
            }
            if (cateid != -1) {
                sql += " AND cid = ?";
                ++paramCount;
                Object[] params = new Object[2];
                params[0] = "INT";
                params[1] = cateid;
                parameters.put(paramCount, params);
            }
            if (priceFrom >= 0) {
                sql += " AND p.price >= ?";
                ++paramCount;
                Object[] params = new Object[2];
                params[0] = "FLOAT";
                params[1] = priceFrom;
                parameters.put(paramCount, params);
            }
            if (priceTo >= 0) {
                sql += " AND p.price <= ?";
                ++paramCount;
                Object[] params = new Object[2];
                params[0] = "FLOAT";
                params[1] = priceTo;
                parameters.put(paramCount, params);
            }
            sql += ") SELECT * FROM r WHERE r.rownum >= (? - 1) * ? + 1 AND r.rownum <= ? * ?";
            PreparedStatement st = connection.prepareStatement(sql);
            for (Map.Entry<Integer, Object[]> values : parameters.entrySet()) {
                Integer index = values.getKey();
                Object[] value = values.getValue();
                switch (value[0].toString()) {
                    case "STRING":
                        st.setString(index, value[1].toString());
                        break;
                    case "INT":
                        st.setInt(index, Integer.parseInt(value[1].toString()));
                        break;
                    case "FLOAT":
                        st.setFloat(index, Float.parseFloat(value[1].toString()));
                        break;
                }
            }
            st.setInt(++paramCount, pageIndex);
            st.setInt(++paramCount, pageSize);
            st.setInt(++paramCount, pageIndex);
            st.setInt(++paramCount, pageSize);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("pid"));
                product.setName(rs.getString("pname"));
                product.setPrice(rs.getFloat("price"));
                product.setThumbnail(rs.getString("pthumbnail"));
                products.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public int getTotalFilterProducts(String keyword, int cateid, float priceFrom, float priceTo) {
        try {
            String sql = "SELECT COUNT(*) total FROM dbo.Products p INNER JOIN dbo.Product_Categories pc ON pc.pid = p.pid WHERE 1 = 1";
            int paramCount = 0;
            HashMap<Integer, Object[]> parameters = new HashMap<>();
            if (keyword != null && !keyword.trim().isEmpty()) {
                sql += " AND p.pname LIKE '%' + ? + '%'";
                ++paramCount;
                Object[] params = new Object[2];
                params[0] = "STRING";
                params[1] = keyword;
                parameters.put(paramCount, params);
            }
            if (cateid != -1) {
                sql += " AND cid = ?";
                ++paramCount;
                Object[] params = new Object[2];
                params[0] = "INT";
                params[1] = cateid;
                parameters.put(paramCount, params);
            }
            if (priceFrom >= 0) {
                sql += " AND p.price >= ?";
                ++paramCount;
                Object[] params = new Object[2];
                params[0] = "FLOAT";
                params[1] = priceFrom;
                parameters.put(paramCount, params);
            }
            if (priceTo >= 0) {
                sql += " AND p.price <= ?";
                ++paramCount;
                Object[] params = new Object[2];
                params[0] = "FLOAT";
                params[1] = priceTo;
                parameters.put(paramCount, params);
            }
            PreparedStatement st = connection.prepareStatement(sql);
            for (Map.Entry<Integer, Object[]> values : parameters.entrySet()) {
                Integer index = values.getKey();
                Object[] value = values.getValue();
                switch (value[0].toString()) {
                    case "STRING":
                        st.setString(index, value[1].toString());
                        break;
                    case "INT":
                        st.setInt(index, Integer.parseInt(value[1].toString()));
                        break;
                    case "FLOAT":
                        st.setFloat(index, Float.parseFloat(value[1].toString()));
                        break;
                }
            }
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
}
