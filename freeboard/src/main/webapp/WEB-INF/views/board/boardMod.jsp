<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@include file="../include/header.jsp" %>


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>게시판 수정</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">게시판 수정</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-6">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Quick Example</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form role="form" action="/board/boardMod" method="post">
               <input type="hidden" id="bno" name="bno" value="${dto.bno}">
               <input type="hidden" id="pageNum" name="pageNum" value="${cri.pageNum}">
                <div class="card-body">
                  <div class="form-group">
                    <label for="title">제목</label>
                    <input type="text" class="form-control" id="title" name="title" value="${dto.bno}" placeholder="Enter title">
                  </div>
                  <div class="form-group">
                    <label for="writer">작성자</label>
                    <input type="text" class="form-control" id="writer" name="writer" value="${dto.title}" placeholder="Enter writer">
                  </div>
                   <!-- textarea -->
                   <div class="form-group">
                     <label>내용</label>
                     <textarea class="form-control" rows="3" id="content" name="content" placeholder="Enter content">${dto.content}</textarea>
                   </div>
                  
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">수정</button>
                  <button type="button" onclick="chkDel('${dto.bno}', '${cri.pageNum}'); return false;" class="btn btn-danger">삭제</button>
                   <a href="boardList?pageNum=${cri.pageNum}" class="btn btn-success">목록</a>
                </div>
           
              </form>
            </div>
            <!-- /.card -->
          </div>
          <!--/.col (right) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  
  <script>
  /********************************
  삭제
  ********************************/
 function chkDel(idx, pageNum){
	  alert(idx);


     //삭제시작
     if(!confirm("한번 삭제한 자료는 복구할 방법이 없습니다.\n\n정말 삭제하시겠습니까?"))   {
         return;
     }  else {
    	location.href='boardDel?bno='+idx+'&pageNum='+pageNum;
     }
     //삭제끝
 }

  
  </script>

  <%@include file="../include/footer.jsp" %>