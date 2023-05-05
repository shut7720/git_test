<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  



<%@include file="../include/header.jsp" %>

<script>
$(function(){
	
	var result = '<c:out value="${result}"/>';
	
	//checkModal(result);

	function checkModal(result) {
		if (result == "") {
			return;
		}
		
		if (parseInt(result) > 0) {
			$(".modal-body").html("게시글 " + parseInt(result) + "번이 등록 되었습니다.");
		}
		
		$("#modal-lg").modal("show");
	}
});



</script>



  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>게시판 목록</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">DataTables</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-12">

          <div class="card">
            <div class="card-header">
          	  <a href="boardReg" class="btn btn-primary">등록</a>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>작성일</th>
                  <th>수정일</th>
                </tr>
                </thead>
                <tbody>
                
		 		<c:forEach items="${list}" var="board">
					<tr>
						<td><c:out value="${board.bno}"/></td>
						<td>
							<a class="move" href='boardView?bno=${board.bno}&pageNum=${pageMaker.cri.pageNum}'>
								<c:out value="${board.title}"/>
							</a>
						</td>
						<td><c:out value="${board.writer}"/></td>
		                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate}"/></td>
		                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${board.updatedate}"/></td>
					</tr>
				</c:forEach>               
                
                </tbody>
                <tfoot>

                </tfoot>
              </table>
              

              
            </div>
            <!-- /.card-body -->
            
                          
           	 	<div class="col-sm-12 col-md-7">
           	 		<div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">
           	 			<ul class="pagination">
           	 			
           	 			<!-- 이전페이지 버튼 -->
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button page-item previous">
								<a href="?pageNum=${pageMaker.startPage-1}" class="page-link">Previous</a>
							</li>
						</c:if>
						
						<!-- 각 번호 페이지 버튼 -->
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<li class="paginate_button page-item ${pageMaker.cri.pageNum == num ? "active":"" }">
								<a href="boardList?pageNum=${num}" class="page-link">${num}</a>
							</li>
						</c:forEach>
						
						<!-- 다음페이지 버튼 -->
						<c:if test="${pageMaker.next}">
							<li class="paginate_button page-item next">
								<a href="?pageNum=${pageMaker.endPage + 1 }" class="page-link">Next</a>
							</li>
						</c:if>	
						
           	 			
           	 			<!-- 
           	 				<li class="paginate_button page-item previous disabled" id="example2_previous">
           	 					<a href="#" aria-controls="example2" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
           	 				</li>
           	 				<li class="paginate_button page-item active">
           	 					<a href="#" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">1</a>
           	 				</li>
           	 				<li class="paginate_button page-item ">
           	 					<a href="#" aria-controls="example2" data-dt-idx="2" tabindex="0" class="page-link">2</a>
           	 				</li>
           	 				<li class="paginate_button page-item ">
           	 					<a href="#" aria-controls="example2" data-dt-idx="3" tabindex="0" class="page-link">3</a>
           	 				</li>
           	 				<li class="paginate_button page-item ">
           	 					<a href="#" aria-controls="example2" data-dt-idx="4" tabindex="0" class="page-link">4</a>
           	 				</li>
           	 				<li class="paginate_button page-item ">
           	 					<a href="#" aria-controls="example2" data-dt-idx="5" tabindex="0" class="page-link">5</a>
           	 				</li>
           	 				<li class="paginate_button page-item ">
           	 					<a href="#" aria-controls="example2" data-dt-idx="6" tabindex="0" class="page-link">6</a>
           	 				</li>
           	 				<li class="paginate_button page-item next" id="example2_next">
           	 					<a href="#" aria-controls="example2" data-dt-idx="7" tabindex="0" class="page-link">Next</a>
           	 				</li>
           	 				 -->
           	 			</ul>
           	 		</div>
           	 	</div>
            
            
            
            
          
            
            
            
            
            
            
            
            
            
          </div>
          <!-- /.card -->
          
             
          
          
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
    
    
      
         <div class="card-body">
    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-lg">
                  Launch Large Modal
                </button>
		</div>

      <div class="modal fade" id="modal-lg">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Large Modal</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <p>One fine body&hellip;</p>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary">Save changes</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
  
    
    
    
    
    
    
    
    
  </div>
  <!-- /.content-wrapper -->
  
  
  
  
  

  
  
  
  
  
  
  
  <%@include file="../include/footer.jsp" %>
  
 



