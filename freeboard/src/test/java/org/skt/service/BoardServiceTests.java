package org.skt.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.skt.domain.BoardDTO;
import org.skt.domain.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {
	
	@Setter(onMethod_ = {@Autowired})
	private BoardService service;
	
	//@Test
	public void testExist() {
		assertNotNull(service);
		log.info("+++++++"+service);
	}

	//@Test
	public void testRegister() {
		BoardDTO dto = new BoardDTO();
		dto.setTitle("스프링 등록");
		dto.setContent("스프링 서비스 등록 호출");
		dto.setWriter("홍길동");
		dto.setWriter("홍길동");
		
		service.register(dto);
		
		log.info("++++ 생성된 게시물 고유번호 :" + dto.getBno());
	}
	
	
	//@Test
	public void testGetList() {
		
		//for ( BoardDTO tmp : service.getList()) {
		//	log.info("++++ 생성된 게시물 :" +tmp);
		//}
		
		//람다식
		service.getList(new Criteria(2, 10)).forEach(tmp -> log.info("++++ 생성된 게시물 :" +tmp));
		
	}
	
	//@Test
	public void testGet() {
		log.info("++++ 생성된 게시물 6번 정보 :" + service.get(6L));
	}
	
	
	//@Test
	public void testModify() {
		BoardDTO dto = new BoardDTO();
		dto.setBno(6L);
		dto.setTitle("스프링 서비스 제목 수정");
		dto.setContent("서비스 내용 수정-----------------");
		dto.setWriter("홍길동");
		
		service.modify(dto);
		
		log.info("++++ 수정된 게시물 고유번호 :" + dto.getBno());
	}
	
	
	//@Test
	public void testRemove() {
		BoardDTO dto = new BoardDTO();
		
		service.remove(6L);
		
		log.info("++++ 삭제된 게시물 고유번호 :" + dto.getBno());
	}
	
}
