package org.skt.service;

import java.util.List;

import org.skt.domain.BoardDTO;
import org.skt.domain.Criteria;

public interface BoardService {
	
	/* 게시판 등록 */
	public void register(BoardDTO dto);
	
	/* 게시판 조회 */
	public BoardDTO get(long bno);
	
	/* 게시판 수정 */
	public boolean modify(BoardDTO dto);
	
	/* 게시판 삭제 */
	public boolean remove(long bno);
	
	/* 게시판 목록 */
	//public List<BoardDTO> getList();
	public List<BoardDTO> getList(Criteria cri);
	
	/* 게시판 총 갯수 */
	public long getTotal(Criteria cri);
}
