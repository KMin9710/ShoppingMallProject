package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.DbCon;
import dto.OrderDTO;

//장바구니 등록, 조회, 삭제
/*
 * private String catego;
	private String ordername;
	private String content;
	private String price;
	private String images;
 */

public class OrderDAO {
	public void insertOrder(OrderDTO dto) throws Exception {
		String sql = "insert into orderlist(catego, ordername, content, price, images) values(?, ?, ?, ?, ?)";
		try(Connection conn = DbCon.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);) {
			pstmt.setString(1, dto.getCatego());
			pstmt.setString(2, dto.getOrdername());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPrice());
			pstmt.setString(5, dto.getImages());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			throw new Exception();
		}
	}
	
	//상품 조회
		public List<OrderDTO> getAllOrder() {
			List<OrderDTO> lists = new ArrayList<OrderDTO>();
			String sql = "select * from orderlist";
			ResultSet rs = null;
			try(Connection conn = DbCon.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql);) {
				rs = pstmt.executeQuery();
				while(rs.next()) {
					OrderDTO dto = new OrderDTO();
					dto.setCatego(rs.getString("catego"));
					dto.setOrdername(rs.getString("ordername"));
					dto.setContent(rs.getString("content"));
					dto.setPrice(rs.getString("price"));
					dto.setImages(rs.getString("images"));
					lists.add(dto);
				}return lists;
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			return lists;
		}
		
		//상품 삭제
		public int deleteByNameContent(String ordername, String content) {
			String sql = "delete from orderlist where ordername = ? and content = ?";
			try(Connection conn = DbCon.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql);) {
				pstmt.setString(1, ordername);
				pstmt.setString(2, content);
				return pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}return 0;
		}
	
}

