package org.skt.service;

import java.util.List;

import org.skt.domain.BoardDTO;
import org.skt.domain.Criteria;
import org.skt.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BoardServicImpl implements BoardService {
	@Setter(onMethod_ = {@Autowired})
	private BoardMapper mapper;

	@Override
	public void register(BoardDTO dto) {
		mapper.insertSelectKey(dto);
		log.info("++++ register :" + dto);
	}

	@Override
	public BoardDTO get(long bno) {
		log.info("++++ get :");
		return mapper.getOne(bno);
	}

	@Override
	public boolean modify(BoardDTO dto) {
		log.info("++++ modify :");
		return mapper.update(dto) == 1;
	}

	@Override
	public boolean remove(long bno) {
		log.info("++++ remove :");
		return mapper.delete(bno) == 1;
	}

	@Override
	public List<BoardDTO> getList(Criteria cri) {
		//log.info("++++ register :" + getList());
		return mapper.getListWithPaging(cri);
	}


	/* 게시물 총 갯수 */
	@Override
	public long getTotal(Criteria cri) {
		return mapper.getTotalCnt(cri);
	}	
	
	
}
