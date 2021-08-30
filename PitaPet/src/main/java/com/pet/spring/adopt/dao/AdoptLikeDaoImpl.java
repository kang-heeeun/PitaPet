package com.pet.spring.adopt.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.pet.spring.adopt.dto.AdoptLikeDto;

@Repository
public class AdoptLikeDaoImpl implements AdoptLikeDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<AdoptLikeDto> getYCountList() {
		
		return session.selectList("adoptLike.getYCountList");
	}
	
	/*
	public List<AdoptLikeDto> getYList(AdoptLikeDto dto){
		
		return session.selectList("adoptLike.getYList", dto);
	}
	*/
	
	
	@Override
	public List<AdoptLikeDto> getIdYList(AdoptLikeDto dto) {
		
		return session.selectList("adoptLike.getIdYList", dto);
	}
	
	
	
	@Override
	public void insert(AdoptLikeDto dto) {
		session.insert("adoptLike.insert", dto);
	}

	@Override
	public void updateY(AdoptLikeDto dto) {
		session.update("adoptLike.updateY", dto);
	}

	@Override
	public void updateN(AdoptLikeDto dto) {
		session.update("adoptLike.updateN", dto);
	}

	@Override
	public AdoptLikeDto getData(AdoptLikeDto dto) {
		return session.selectOne("adoptLike.getData", dto);
	}

	@Override
	public List<AdoptLikeDto> getMyList(String id) {
		return session.selectList("adoptLike.getMyList", id);
	}

	@Override
	public int getCount(int num) {
		return session.selectOne("adoptLike.getCount", num);
	}

	@Override
	public int isExist(AdoptLikeDto dto) {
		
		return session.selectOne("adoptLike.isExist", dto);
	}

	
	
}
