package com.fun.product.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.fun.product.model.service.ProductService;
import com.fun.product.model.vo.Image;
import com.fun.product.model.vo.Product;

/**
 * Servlet implementation class InputProductImgServlet
 */
@WebServlet("/ipi.bo")
public class inputProductImgServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public inputProductImgServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      
      String yn = request.getParameter("yn");
      
      
      
      ArrayList<Image> list = new ProductService().inputImg();
      ArrayList<Image> sList = new ProductService().inputSlideImg();

      request.setAttribute("list",list);
      request.setAttribute("sList",sList);
      
      
      if(yn.equals("y")) {   
         request.getRequestDispatcher("/views/product/fundingtest.jsp").forward(request,response);
      }else if(yn.equals("n")) {
         request.getRequestDispatcher("/views/product/opens.jsp").forward(request,response);
      }
   
      
      
      
      
      
      
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

          doGet(request,response);
          
          
         
          
           
           
     
   
           
           
           
           
          
       }

}