package org.skt.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class BoardControllerTests {

	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	//@Test
	public void testList() throws Exception {
		log.info("+++++++++ : " +
			mockMvc.perform(MockMvcRequestBuilders.get("/board/boardList"))
				   .andReturn()
				   .getModelAndView()
				   .getModelMap()
			
			
			);
	}
	
	
	//@Test
    public void testRegister() throws Exception {
		
      String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/boardReg")
						               .param("title", "목업 제목") 
						               .param("content", "목업 내용")
						               .param("writer", "mockup"))
				            .andReturn()
				            .getModelAndView()
				            .getViewName();
            
      	log.info("****: " + resultPage );
	}
	
    
	//@Test
    public void testGet() throws Exception {
		log.info("+++++++++ : " +
				mockMvc.perform(MockMvcRequestBuilders.get("/board/boardView")
					   .param("bno", "6")) 
					   .andReturn()
					   .getModelAndView()
					   .getModelMap()
				
				);		
	}
    
    
    
	//@Test
    public void testModify() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/boardMod")
								   .param("bno", "7")
					               .param("title", "목업 제목 수정") 
					               .param("content", "목업 내용 수정")
					               .param("writer", "홍길동")) 
							     .andReturn()
							     .getModelAndView()
							     .getViewName();
		
		log.info("****: " + resultPage );	
	}
    
    
	//@Test
    public void testRemove() throws Exception {
    	
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.get("/board/boardDel")
					   .param("bno", "6")) 
					   .andReturn()
					   .getModelAndView()
					   .getViewName();
				
		log.info("****: " + resultPage );	
    	
	}
	
	@Test
    public void testListPaging() throws Exception {
		log.info("+++++++++ : " +
				mockMvc.perform(MockMvcRequestBuilders.get("/board/boardList")
					   .param("pageNum", "1")
					   .param("amount", "50")) 
					   .andReturn()
					   .getModelAndView()
					   .getModelMap()
				
				);		
	}
	
	
	
}
