package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.protocol.Resultset;

import common.DbCon;
import dto.ProductDTO;

// 상품
public class ProductDAO {
	// 상품 등록
	public void insertProduct(ProductDTO dto) throws Exception {
		String sql = "insert into product(category, name, content, price, images) " + "values(?, ?, ?, ?, ?)";
		try (Connection conn = DbCon.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql);) {
			pstmt.setString(1, dto.getCategory());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPrice());
			pstmt.setString(5, dto.getImages());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception();
		}
	}

	// 상품 전체 조회
	public List<ProductDTO> getAllProduct() {
		List<ProductDTO> lists = new ArrayList<ProductDTO>();
		String sql = "select * from product";
		ResultSet rs = null;
		try (Connection conn = DbCon.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql);) {
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setCategory(rs.getString("category"));
				dto.setName(rs.getString("name"));
				dto.setContent(rs.getString("content"));
				dto.setPrice(rs.getString("price"));
				dto.setImages(rs.getString("images"));
				lists.add(dto);
			}
			return lists;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return lists;
	}

	// 상품 개별 조회 (이름검색기능)
	public List<ProductDTO> productRetrieve(String name) {
		String sql = "select * from product where name like '%" + name + "%'";
		List<ProductDTO> products = new ArrayList<ProductDTO>();
		ResultSet rs = null;
		try(Connection conn = DbCon.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql);) {
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setCategory(rs.getString("category"));
				dto.setName(rs.getString("name"));
				dto.setContent(rs.getString("content"));
				dto.setPrice(rs.getString("price"));
				dto.setImages(rs.getString("images"));
				products.add(dto);
			}
			return products;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}
	
	//상품 개별 조회(상품 디테일)
	public ProductDTO productNameContent(String name, String content) {
		String sql = "select * from product where name = ? and content = ?";
		ResultSet rs = null;
		ProductDTO dto = null;
		try(Connection conn = DbCon.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql);) {
			pstmt.setString(1, name);
			pstmt.setString(2, content);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new ProductDTO();
				dto.setCategory(rs.getString("category"));
				dto.setName(rs.getString("name"));
				dto.setContent(rs.getString("content"));
				dto.setPrice(rs.getString("price"));
				dto.setImages(rs.getString("images"));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
			}catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return dto;
	}
	
	// 상품 개별 조회 (카테고리)
		public List<ProductDTO> productByCategory(String category) {
			String sql = "select * from product where category = ?";
			List<ProductDTO> products = new ArrayList<ProductDTO>();
			ResultSet rs = null;
			try(Connection conn = DbCon.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql);) {
				pstmt.setString(1, category);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					ProductDTO dto = new ProductDTO();
					dto.setCategory(rs.getString("category"));
					dto.setName(rs.getString("name"));
					dto.setContent(rs.getString("content"));
					dto.setPrice(rs.getString("price"));
					dto.setImages(rs.getString("images"));
					products.add(dto);
				}
				return products;
			}catch (Exception e) {
				e.printStackTrace();
			}
			return products;
		}
	
	// 상품 삭제
	public int deleteByName(String name, String content) {
		String sql = "delete from product where name = ? and content = ?";
		try (Connection conn = DbCon.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql);) {
			pstmt.setString(1, name);
			pstmt.setString(2, content);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
}
