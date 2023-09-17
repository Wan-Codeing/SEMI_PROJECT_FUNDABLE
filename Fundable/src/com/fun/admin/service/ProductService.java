package com.fun.admin.service;

import static com.fun.common.JDBCTemplate.close;
import static com.fun.common.JDBCTemplate.commit;
import static com.fun.common.JDBCTemplate.getConnection;
import static com.fun.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.fun.common.model.dao.MainDao;
import com.fun.common.model.vo.PageInfo;
import com.fun.product.model.dao.ProductDao;
import com.fun.product.model.vo.Image;
import com.fun.product.model.vo.Option;
import com.fun.product.model.vo.Product;

public class ProductService {

    public int selectFListCount() {

        Connection conn = getConnection();

        int listCount = new ProductDao().selectFListCount(conn);

        close(conn);

        return listCount;

    }

    public ArrayList<Product> selectFList(PageInfo pi) {
        Connection conn = getConnection();

        ArrayList<Product> list = new ProductDao().selectFList(conn, pi);

        close(conn);

        return list;

    }

    public int denyFunding(int productNo) {

        Connection conn = getConnection();

        int result = new ProductDao().denyFunding(conn, productNo);

        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }

        close(conn);

        return result;
    }

    public int accessFunding(int productNo) {

        Connection conn = getConnection();

        int result = new ProductDao().accessFunding(conn, productNo);

        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }

        close(conn);

        return result;
    }

    public int selectPListCount() {

        Connection conn = getConnection();

        int listCount = new ProductDao().selectPListCount(conn);

        close(conn);

        return listCount;

    }

    public ArrayList<Product> selectPList(PageInfo pi) {
        Connection conn = getConnection();

        ArrayList<Product> list = new ProductDao().selectPList(conn, pi);

        close(conn);

        return list;

    }

    public int searchPListCount(int category, String keyword) {

        Connection conn = getConnection();

        int listCount = new ProductDao().searchPListCount(conn, category, keyword);

        close(conn);

        return listCount;

    }

    public ArrayList<Product> searchPList(PageInfo pi, int category, String keyword) {

        Connection conn = getConnection();

        ArrayList<Product> list = new ProductDao().searchPList(conn, pi, category, keyword);

        close(conn);

        return list;

    }

    public Product selectProduct(int productNo) {

        Connection conn = getConnection();

        Product p = new ProductDao().selectProduct(conn, productNo);

        close(conn);

        return p;

    }

    public Option selectOption(int optionNo) {
        Connection conn = getConnection();

        Option option = new ProductDao().selectOption(conn, optionNo);

        close(conn);

        return option;
    }
    
    public ArrayList<Image> selectProductImg(){
    	Connection conn = getConnection();
		
		ArrayList<Image> list = new ProductDao().selectProductImg(conn);
		
		close(conn);
		
		return list;
    }

	public int deleteProduct(int productNo) {
		Connection conn = getConnection();

        int result = new ProductDao().deleteProduct(conn, productNo);

        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }

        close(conn);

        return result;
	}

}
