package org.skt.controller;

import org.skt.domain.BoardDTO;
import org.skt.domain.Criteria;
import org.skt.domain.PageDTO;
import org.skt.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	
	@Autowired
	private BoardService boardservice;
	
	/*게시판 목록*/
	@GetMapping("/boardList")
	public void boardListGET(Criteria cri, Model model) {
		
		log.info("게시판 목록 페이지 진입 :" + cri);
		
		model.addAttribute("list", boardservice.getList(cri));
		
		long total = boardservice.getTotal(cri);
		//int total = 230;
		PageDTO pageMake = new PageDTO(cri, total);
		
		model.addAttribute("pageMaker", pageMake);
	}

	
	/* 게시판 등록 페이지 접속 */
	@GetMapping("/boardReg")
	public void register() {
		log.info("게시판 등록 페이지 진입");
	}
	
	
	/*게시판 등록 */
	@PostMapping("/boardReg")
	public String register(BoardDTO dto, RedirectAttributes rttr) {
		
		log.info("**** /boardReg : " + dto);
		
		boardservice.register(dto);
		rttr.addFlashAttribute("result", dto.getBno());
		
		return "redirect:/board/boardList";
		
	}
	
	

	/* 게시판 조회 */
	@GetMapping({"/boardView", "/boardMod"})
	public void get(long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("**** /boardView or boardMod: " + bno +  cri);
		
		model.addAttribute("dto", boardservice.get(bno));
		
		//PageDTO pageMake = new PageDTO(cri, 1);
		//model.addAttribute("pageMaker", pageMake);
		
	}
	
	
	
	/* 수정 페이지 이동 */
	@PostMapping("/boardMod")
	public String modify(BoardDTO dto, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("**** /modify : " + dto + "**** /cri : " + cri);
		
		if (boardservice.modify(dto)) {
			
			log.info("DDDD="+cri.getPageNum());
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		
		return "redirect:/board/boardList";
	}
	
	
	
	/* 게시판 삭제 */
	@GetMapping("/boardDel")
	public String remove(long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("**** /remove : " + bno);
		
		boardservice.remove(bno);
		
		rttr.addFlashAttribute("result", "success");
		rttr.addAttribute("pageNum", cri.getPageNum());
		
		return "redirect:/board/boardList";
	}
	
}
