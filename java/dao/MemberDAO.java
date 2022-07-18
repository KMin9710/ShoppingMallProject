package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DbCon;
import dto.MemberDTO;

//회원가입 기능 + 로그인 기능 + 로그아웃 기능
public class MemberDAO {
	// 회원가입
	public int insert(MemberDTO dto) {
		String sql = "insert into member(id, password, name, email) values(?, ?, ?, ?)";
		try (Connection conn = DbCon.getConnection(); PreparedStatement pstmt = conn.prepareCall(sql);) {
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	// 로그인
	public int login(String id, String password) {
		String sql = "select password, type from member where id = ?";
		ResultSet rs = null;
		try (Connection conn = DbCon.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql);) {
			String admin = "admin";
			String customer = "customer";
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if(rs.getString(1).contentEquals(password)) {
					if(admin.equals(rs.getString("type")))
						return 2; //관리자 로그인
					else if(customer.equals(rs.getString("type")))
						return 1; //고객 로그인
				}else 
					return 0; //비밀번호 틀림
			}return -1; //아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 예외발생
	}

	// 아이디 겹칠때
	public boolean findByMemberId(String id) {
		String sql = "select * from member where id = ?";
		try (Connection conn = DbCon.getConnection(); PreparedStatement pstmt = conn.prepareCall(sql);) {
			pstmt.setString(1, id);
			return (pstmt.executeQuery()).next();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	// 전체 고객 조회
	public List<MemberDTO> getAllMembers() {
		List<MemberDTO> lists = new ArrayList<MemberDTO>();
		String sql = "select * from member";
		ResultSet rs = null;
		try (Connection conn = DbCon.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql);) {
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				lists.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return lists;
	}

	// 회원 탈퇴
	public int deleteById(String id, String password) {
		String sql = "delete from member where id = ? and password = ?";
		try (Connection conn = DbCon.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql);) {
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

}
