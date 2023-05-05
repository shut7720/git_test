<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    


<%@include file="../include/header.jsp" %>


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>게시판 상세</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">게시판 상세</li>
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
              <!-- /.card-header -->
                <div class="card-body">
                  <div class="form-group">
                    <label for="title">번호</label>
                    <input type="text" class="form-control" id="title" name="title"  readonly="readonly" value="${dto.bno}">
                  </div>                
                  <div class="form-group">
                    <label for="title">제목</label>
                    <input type="text" class="form-control" id="title" name="title" readonly="readonly" value="${dto.title}">
                  </div>
                  <div class="form-group">
                    <label for="writer">작성자</label>
                    <input type="text" class="form-control" id="writer" name="writer"  readonly="readonly" value="${dto.writer}">
                  </div>
                  
                  <div class="form-group">
                    <label for="regdate">등록일</label>
                    <input type="text" class="form-control" id="regdate" name="regdate"  readonly="readonly" value="<fmt:formatDate pattern="yyyy/MM/dd" value="${dto.regdate}"/>">
                  </div>
                  
                  <div class="form-group">
                    <label for="updatedate">수정일</label>
                    <input type="text" class="form-control" id="updatedate" name="updatedate" readonly="readonly" value="<fmt:formatDate pattern="yyyy/MM/dd" value="${dto.updatedate}"/>">
                  </div>                  
                   <!-- textarea -->
                   <div class="form-group">
                     <label>내용</label>
                     <textarea class="form-control" rows="3" id="content" name="content" placeholder="Enter content">${dto.content}</textarea>
                   </div>
                  
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="button"  id="modify_btn" onclick="location.href='boardMod?bno='+${dto.bno}+'&pageNum='+${cri.pageNum}" class="btn btn-primary">수정</button>
                  <a href="boardList?pageNum=${cri.pageNum}" class="btn btn-success">목록</a>
                </div>
           
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

  <%@include file="../include/footer.jsp" %>