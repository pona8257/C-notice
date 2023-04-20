<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<script>
	function fnEdit(){
		$('#edit_screen').show();
		$('#detail_screen').hide();
	}
	function fnRemove(){
		if(confirm('공지사항을 삭제할까요?')){
			location.href = '${contextPath}/notice/remove.do?notice_no=${notice.notice_no}';
		}
	}
	function fnList(){
		location.href = '${contextPath}/notice/list.do';
	}
	function fnBack(){
		$('#edit_screen').hide();
		$('#detail_screen').show();
	}
	function fnInit(){		
		$('#edit_screen').hide();
		$('#gubun').val(${notice.gubun});
		let modifyResult = '${modifyResult}';
		if(modifyResult != '') {
			if(modifyResult == '1'){
				alert('공지사항이 수정되었습니다.');
			} else {
				alert('공지사항이 수정되지 않았습니다.');
			}
		}
	}
	$(function(){		
		fnInit();
	})
</script>
</head>
<body>

	<div id="detail_screen">
		<h1>${notice.notice_no}번 게시글 상게보기</h1>
		<c:if test="${notice.gubun == 1}">
			<div>구분 : 일반</div>
		</c:if>
		<c:if test="${notice.gubun == 2}">
			<div>구분 : 긴급</div>
		</c:if>
		<div>제목 : ${notice.title}</div>
		<div>${notice.content}</div>
		<hr>
		<div>
			<input type="button" value="편집" onclick="fnEdit()">
			<input type="button" value="삭제" onclick="fnRemove()">
			<input type="button" value="목록" onclick="fnList()">
		</div>
	</div>
	
	<div id="edit_screen">
		<div style="cursor: pointer;" onclick="fnBack()">← 뒤로 가기</div>
		<h1>공지사항 편집하기</h1>
		<form method="post" action="${contextPath}/notice/modify.do">
			<div>
				<label for="gubun" >구분</label>
				<select name="gubun" id="gubun">
					<option value="1">일반</option>
					<option value="2">긴급</option>	
				</select>
			</div>
			<div>
				<label for="title">제목</label>
				<input type="text" id="title" name="title" value="${notice.title}">
			</div>
			<div>
				<label for="content">내용</label>
				<textarea id="content" name="content">${notice.content}</textarea>
			</div>
			<div>
				<input type="hidden" name="notice_no" value="${notice.notice_no}">
				<button>수정완료</button>
				<input type="button" value="목록" onclick="fnList()">
			</div>
		</form>
	</div>
	
</body>
</html>