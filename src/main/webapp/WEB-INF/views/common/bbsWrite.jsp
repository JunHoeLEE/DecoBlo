<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notice</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link type="text/css" rel="stylesheet" href="pixelarity/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"/>
<link rel="stylesheet" href="decoblo/css/bbsWrite.css" />
<style>

	header#header.top-menu {
		position: relative;
		background-color: #000;
	}
	.table-wrapper {
		width: 100%;
 		text-align: center;
		
	}
	.table-inwrapper{
		 display: inline-block;
	}
	
</style>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<script src="resources/library/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function bbsList() { 	// 글목록으로 이동
	location.href = "${pageContext.request.contextPath}/bbsList";
}

function bbsCheck(){	// 글쓰기 유효성 검사
	var bbsTitle = $('#bbsTitle').val();
	var bbsContent = CKEDITOR.instances.bbsContent.getData()
	
	alert(bbsTitle);
	alert(bbsContent);
	
	if (bbsTitle == '' || bbsContent == ''){
		alert('제목과 내용을 입력하세요.');
		return false;
	}
	
	return true;
}


</script>
</head>
<body class="landing">

<!-- Header -->
	<jsp:include page="header.jsp"></jsp:include>
<!-- 소개 사진 -->
<section id="intro-photo" class="wrapper">
	<div id="article">
	</div>
</section>
	
<section id="main">
<form action="writeBbs" method="post">
<!-- 게시글작성 게시판번호 넘겨주기 -->
<input type="hidden" name="boardNo" id="boardNo" value="7"/>
<input type="hidden" name="bbsParent" id="bbsParent" value="${bbsParent}"/>
<input type="hidden" name="type" id="type" value="${type}"/>

	<div class="table-wrapper" >
	<div class="table-inwrapper">
	
	<table class="board" border="1" style="width: 1200px;">
		<tr>
			<td><input type="text" name="bbsTitle" id="bbsTitle" value="${bbs.bbsTitle}" placeholder="제목"></td>
		</tr>

<!-- 	<tr>
			<th>첨부파일</th>
			<td><input type="file" name="upload"></td>
		</tr> -->
		<tr>
			<td><textarea rows="100" cols="50" name="bbsContent" id="bbsContent" class="bbsContent">${bbs.bbsContent}</textarea> </td>
		</tr>
		<tr>
			<td class="btn" colspan="2" align="center">
				<input type="button" value="목록" onclick="bbsList()"/>
				<input type="submit" value="등록" onclick="return bbsCheck()"> 
			</td>
		</tr>
	</table>
	<script type="text/javascript">CKEDITOR.replace('bbsContent'
									, {filebrowserImageUploadUrl:'ckeditorImageUpload', width:'1200px', height : '600px'});</script>
</div>
</div>
</form>


</section>

</body>
</html>