<%@page import="com.VO.memberVO"%>
<%@page import="com.VO.golfVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%// 변수 선언
   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;
   ArrayList<golfVO> list = new ArrayList<golfVO>();
   String uid = "cgi_4_1";
   String pwd = "smhrd1";
   String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:XE";
   String sql = "select * from golfinfo";%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Golf_0816</title>

    <!-- 스타일 시트 -->
    <link href="css/index.css" rel="stylesheet">

    <!-- js -->
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="js/index.js"></script>
</head>

<body>
<%
	//데이터 세션 부분
	ArrayList<golfVO> arr = (ArrayList<golfVO>)session.getAttribute("golf_session");
	memberVO loginvo = (memberVO)session.getAttribute("login_session");
%>
<%
	//초기 메인 페이지에 바로 뿌려줄 리스트 메인페이지 jsp에 저장하였습니다.
    try {
          Class.forName("oracle.jdbc.driver.OracleDriver");
          conn = DriverManager.getConnection(url, uid, pwd);
          stmt = conn.createStatement();
          rs = stmt.executeQuery(sql);
          while (rs.next()) {
           	golfVO gvo = new golfVO();
           	gvo.setGolf_id(rs.getInt(1));
    		gvo.setGolf_name(rs.getString(2));
    		gvo.setLat(rs.getFloat(11));
    		gvo.setLag(rs.getFloat(12));
    		gvo.setGolf_img(rs.getString(13));
    		gvo.setGolf_holes(rs.getString(5));
    		gvo.setGolf_section(rs.getString(4));
    		gvo.setGolf_caddy(rs.getString(8));
    		list.add(gvo);
    		}
    	} catch (Exception e) {
    		e.printStackTrace();
    	} finally {
    		try {
    	if (rs != null) {
    		rs.close();
    	}
    	if (stmt != null) {
    		stmt.close();
    	}
    	if (conn != null) {
    		conn.close();
    	}
    		} catch (Exception e) {
    	e.printStackTrace();
    		}
    	}
%>



<!------------------------------------------------------------------------ 모달창 -->
    <div id="modalbox"></div> <!-- 모달박스 -->

    <!----------------------------------------------------------- 모달창_1 : 로그인 -->
        <div id="loginModalcontent">
            <div id="loginX">
                <img src="img/x.png">
            </div>
            <div id="loginbox">
                <div id="loginLogobox">
                    <img id="loginLogoimg" src="img/golf_list.png">
                    <p>Any Golf</p>
                </div>
                <form id="loginForm" action="login.do">
                            <input class="loginInput" type="text" name="loginId" placeholder="아이디">
                            <input class="loginInput" type="text" name="loginPw" placeholder="비밀번호">
                            <input class="loginButton" id="loginButton" type="submit" value="로그인">
                            <input class="loginButton" id="findeButton" type="submit" value="아이디/비밀번호 찾기">
                </form>
            </div>
        </div>

    <!----------------------------------------------------------- 모달창_2 : 회원가입 -->
    <div id="joinModalcontent">
        <div id="joinX">
            <img src="img/x.png">
        </div>
        <div id="joinbox">
            <div id="joinLogobox">
                <img id="joinLogoimg" src="img/golf_list.png">
                <p>회원가입</p>
            </div>
            <!-- <form name="formName" method="post" enctype="multipart/form-data"> -->
            <form id="joinForm" action="join.do">
                <table id="joinTable">
                    <tr>
                        <td><h5>이름</h5></td>
                        <td><input class="joinInput" type="text" name="joinName" placeholder="이름"></td>
                    </tr>
                    <tr>
                        <td><h5>아이디</h5></td>
                        <td><input class="joinInput" type="text" name="joinid" placeholder="아이디"></td>
                    </tr>
                    <tr>
                        <td><h5>패스워드</h5></td>
                        <td><input class="joinInput" type="text" name="joinPw" placeholder="비밀번호"></td>
                    </tr>
                    <tr>
                        <td><h5>패스워드확인</h5></td>
                        <td><input class="joinInput" type="text" name="joinPwCheck" placeholder="비밀번호"></td>
                    </tr>
                    <tr>
                        <td><h5>전화번호</h5></td>
                        <td><input class="joinInput" type="text" name="joinCall" placeholder="전화번호('-' 없이)"></td>
                    </tr>                    
                    <tr>
                        <td><h5>닉네임</h5></td>
                        <td><input class="joinInput" type="text" name="joinNick" placeholder="닉네임"></td>
                    </tr>
                    <tr>
                        <td><h5>관계자선택</h5></td>
                        <td>
                        <select class="joinInput" name="joinselect">
                            <option value="1">일반</option>
                            <option value="2">캐디</option>
                            <option value="3">운영자</option>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td><h5>관계자확인</h5></td>
                        <td id="filetd"><input id="joinInputFile" type="file" name="inputfile"></td>
                    </tr>
                    <tr>
                        <td><h5>근무골프장</h5></td>
                        <td>
                            <select class="joinInput" name="joingolf">
                                <option value="none">선택없음</option>
                                <option value="푸른솔장성cc">푸른솔골프cc</option>
                                <option value="나주cc">나주cc</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><h5>거주지역</h5></td>
                        <td>
                            <select class="joinInput" name="joinarea">
                                <option value="호남권">호남권</option>
                                <option>지역1</option>                          
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><h5>생년월일</h5></td>
                        <td><input class="joinInput" type="date" name="joinBirth" placeholder="아이디"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input class="joinButton" id="joinButton" type="submit" value="회원가입신청"></td>
                    </tr>
                </table>     
            </form>
        </div>
    </div>        


    <!----------------------------------------------------------- 모달창_3 : mypage_나의정보 -->
    <div id="mypageModalcontent">
        <div id="mypageX">
            <img src="img/x.png">
        </div>
        <div id="mypagebox">
            <div id="mypageLogobox">
                <img id="mypageLogoimg" src="img/golf_list.png">
                <p>My page</p>
            </div>

            <form id="mypageForm" action="updata.do">
                <table id="mypageTable">
                    <tr>
                        <td><h5>이름</h5></td>
                        <td id="mypageTableName" name="updataId">본인이름</td>
                    </tr>
                    <tr>
                        <td><h5>아이디</h5></td>
                        <td id="mypageTableId">본인아이디</td>
                    </tr>
                     <tr>
                         <td><h5>패스워드</h5></td>
                        <td><input class="mypageInput" type="password" name="updataPw" placeholder="비밀번호"></td>
                    </tr>
                    <tr>
                        <td><h5>패스워드확인</h5></td>
                        <td><input class="mypageInput" type="password" name="updataPw" placeholder="비밀번호"></td>
                    </tr>
                    <tr>
                        <td><h5>전화번호</h5></td>
                        <td id="mypageInputcall"><input class="mypageInput" type="text" name="updataCall" placeholder="전화번호('-' 없이)"></td>
                    </tr>                    
                    <tr>
                        <td><h5>닉네임</h5></td>
                        <td id="mypageInputnick"><input class="mypageInput" type="text" name="updataNick" placeholder="닉네임"></td>
                    </tr>
                    <tr>
                        <td><h5>거주지역</h5></td>
                        <td>
                            <select class="mypageInput" name="updataArea">
                                <option value="호남권">호남권</option>
                                <option>거주지역2</option>
                                <option>거주지역3</option>
                                </select>
                        </td>
                    </tr>
                    <tr>
                        <td><h5>생년월일</h5></td>
                        <td id="mypageInputbirth"><input class="mypageInput" type="date" name="updataBirth"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input id="mypageButton" type="submit" value="정보수정완료" onclick="showupdata()"></td>
                    </tr>
                </table>     
            </form> 

        </div>
    </div>



    <!----------------------------------------------------------- 모달창_4 : jjim_찜목록 -->
    <div id="jjimModalcontent">
        <div id="jjimX">
            <img src="img/x.png">
        </div>
        <div id="jjimbox">
            <div id="jjimLogobox">
                <img id="jjimLogoimg" src="img/golf_list.png">
                <p> My List </p>
            </div>

            <div id="jjimForm">
                    <ul class="jjimListBox">
                        <li class="jjimimg"><img src="img/mainBack.jpg"></li>
                        <li class="jjimGolfjang">
                            <ul>
                                <li>골프장이름!!!!</li>
                                <li>몇홀</li>
                                <li>기본</li>
                                <li>캐디</li>
                            </ul>
                        </li>
                        <li class="jjimDeleteBT"><p>찜삭제</p></td>
                    </ul> 

                    <ul class="jjimListBox">
                        <li class="jjimimg"><img src="img/mainBack.jpg"></li>
                        <li class="jjimGolfjang">
                            <ul>
                                <li>골프장이름!!!!</li>
                                <li>몇홀</li>
                                <li>기본</li>
                                <li>캐디</li>
                            </ul>
                        </li>
                        <li class="jjimDeleteBT"><p>찜삭제</p></td>
                    </ul> 
            </div> 

        </div>
    </div>



    <!----------------------------------------------------------- 모달창_5 : golfmember(골프장관리자) -->

    <div id="golfmemberModalcontent">
        <div id="golfmemberX">
            <img src="img/x.png">
        </div>
        <div id="golfmemberbox">
            <div id="golfmemberLogobox">
                <img id="golfmemberLogoimg" src="img/golf_list.png">
                <p>골프장운영자</p>
            </div>


            <form id="golfmemberForm">
                <table id="golfmemberTable">
                    <tr>
                        <td><h5>골프장</h5></td>
                        <td>골프장 이름</td>
                    </tr>
                    <tr>
                        <td><h5>지역</h5></td>
                        <td>
                            <select class="golfmemberInput">
                                <option>수도권</option>
                                <option>강원도</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><h5>구분</h5></td>
                        <td>
                            <select class="golfmemberInput">
                                <option>회원제</option>
                                <option>대중제</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><h5>몇홀</h5></td>
                        <td>
                            <select class="golfmemberInput">
                                <option>홀수</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><h5>캐디</h5></td>
                        <td>
                            <select class="golfmemberInput">
                                <option>캐디Y</option>
                                <option>캐디N</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><h5>주소</h5></td>
                        <td><input class="golfmemberInput" type="text" name="joinName"></td>
                    </tr>                   
                    <tr>
                        <td><h5>전화번호</h5></td>
                        <td><input class="golfmemberInput" type="text" name="joinName"></td>
                    </tr>                    
                    <tr>
                        <td><h5>가격</h5></td>
                        <td>
                        <ul id="golfmemberPrice">
                            <li>
                                <Select class="golfmemberInput" id="golfmemberInput1">
                                    <option> 0 </option>
                                </select><span> ~ </span>
                                <select class="golfmemberInput" id="golfmemberInput2">
                                    <option> 0 </option>
                                </select> 원
                            </li>
                        </ul>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2"><input id="golfmemberButton" type="submit" value="정보수정완료"></td>
                    </tr>
                </table>     
            </form> 

        </div>
    </div>

<!--------------------------------------------------------------- 체크박스 -->
<div id="checkBox">
        <form action="front.do">
            <ul id="checkTitle">
                <li>
                    <ul id="checkTitleList">
                        <li><h3>지역 ▼</h3></li>
                        <li><h3>구분 ▼</h3></li>
                        <li><h3>캐디 ▼</h3></li>
                        <li><h3>금액 ▼</h3></li>
                        <li><h3>내위치</h3></li>
                    </ul>
                    <ul id="checkTitleBtbox">
                        <li id="checkTitleBt"><input type="submit" value="검색"></li>
                    </ul>

                    <ul id="checkMenuList">
                        <li>
                            <ul class="checkList">
                                <li><input type="checkbox" name="sudo"> 수도권</li>
                                <li><input type="checkbox" name="sudo"> 강원도</li>
                                <li><input type="checkbox" name="sudo"> 충천권</li>
                                <li><input type="checkbox" name="sudo"> 대경권</li>
                                <li><input type="checkbox" name="sudo" value="호남권"> 호남권</li>
                                <li><input type="checkbox" name="sudo"> 동남권</li>
                                <li><input type="checkbox" name="sudo"> 제주권</li>
                            </ul>
                            <ul class="checkList">
                                <li><input type="checkbox" name="member" value="회원"> 회원제</li>
                                <li><input type="checkbox" name="member" value="대중"> 대중제</li>
                            </ul>
                            <ul class="checkList">
                                <li><input type="checkbox" name="caddy" value="Y"> Y</li>
                                <li><input type="checkbox" name="caddy" value="N"> N</li>
                                <li><input type="checkbox" name="caddy" value="선택제"> 선택제</li>
                            </ul>
                            <ul class="checkList" id="checkList4">
                                <li>
                                    <Select>
                                        <option> 0 </option>
                                    </select><span> ~ 원</span>
                                    <select>
                                        <option> 0 </option>
                                    </select> 원
                                </li>
                            </ul>
                        </li>
                        <li id="checkboxUp">
                            ▲
                        </li>
                    </ul>
                </li>
            </ul>
        </form>
    </div>  


<!----------------------------------------- 사이드바 슬라이드_ 1 _ 리스트박스(sideListContain) + 상세페이지(sidePageContain) -->  
<div id="slideSidebox">
    <!-- 골프장기본정보리스트박스-->
    <div id="sideListContain">
    <% if( arr == null) { %>
    	<% for(int i = 0; i < list.size(); i++) { %>
    	<% String str = list.get(i).getGolf_name(); %>
        <div class="golfList" id="<%= i %>" onclick="getInfo()">
            <ul class="golfListGolfjang" >
                <li class="golfListimg" ><img src="<%=list.get(i).getGolf_img() %>" id="<%= i %>"></li>
                <li class="golfListText">
                    <ul>
                        <li><%= list.get(i).getGolf_name() %></li>
                        <li>홀 : <%= list.get(i).getGolf_holes() %></li>
                        <li>기본 : <%= list.get(i).getGolf_section() %></li>
                        <li>캐디 : <%= list.get(i).getGolf_caddy() %></li>
                    </ul>
                </li>
            </ul>     
        </div>
	<% } %>
	<% }else{ %>
		<% for(int i = 0; i < arr.size(); i++) { %>
    	<% String str = arr.get(i).getGolf_name(); %>
    	<div class="golfList" id="<%= i %>" onclick="getInfo()">
            <ul class="golfListGolfjang">
                <li class="golfListimg" ><img src="<%=arr.get(i).getGolf_img() %>" id="<%= i %>"></li>
                <li class="golfListText">
                    <ul>
                        <li><%= arr.get(i).getGolf_name() %></li>
                        <li>홀 : <%= arr.get(i).getGolf_holes() %></li>
                        <li>기본 : <%= arr.get(i).getGolf_section() %></li>
                        <li>캐디 : <%= arr.get(i).getGolf_caddy() %></li>
                    </ul>
                </li>
            </ul>     
        </div>
     	<% } %>
    <% } %>

    </div> <!-- sideListContain _ 사이드 리스트 슬라이드 내부 -->
    
    <!-- 골프장 상세페이지 박스-->
    <div id="sidePageContain">
        <div id="sidePageContainClose">
            <img src="img/x.png">
        </div>
        <div id="golfinfoPage">
            <div id="golfImg">
                <img id="golfinfoimg" src="img/mainBack.jpg">
            </div>
            <div id="golfTitle">
                <ul>
                    <li id="golfjangName"><h2 id="golfName">골프장 이름!</h2></li>
                    <li id="reviewStar">☆☆☆☆☆</li>
                    <li id="golfSimpleInfo">
                        <ul>
                            <li id="golfjanggibon">기본</li>
                            <li id="golfjanghole">홀</li>
                            <li id="golfjangcaddy">캐디</li>
                        </ul>
                        <ul>
                            <li>주소</li>
                            <li>전화</li>
                            <li>가격</li>
                        </ul>
                        <ul>
                            <li id="golfjangaddr">해당골프장주소블라블라블라</li>
                            <li id="golfjangcall">000)000-0000</li>
                            <li>0~99999999</li>
                        </ul>
                    </li>
                </ul>
            </div>

            <div>
                <ul id="golfInfoMenu">
                    <li id="information">골프장 정보</li>
                    <li id="review" onclick="getReview()">리뷰</li>
                    <li id="serch">주변명소</li>
                </ul>
            </div>

            <div id="golfInfoBox">
                <!-- 골프장 정보, 리뷰, 명소 들어갈 div박스 -->
                <div id=""></div>
                <div id=""></div>
                <div id=""></div>
                
            </div>
        </div>
    </div> <!--sidePageContain _ 사이드 상세페이지 슬라이드 내부 박스 2--> 

    <!-- 골프장 사이드바 닫기 화살표 -->
    <div id="sideContainClose"> <p>◀</p> </div>

</div> <!-- slideSidebox _1_ 사이드 외부 전체 박스 -->




<!----------------------------------------- 사이드바 슬라이드_ 2 _ 조인게시판리스트박스(sideListContain) + 상세페이지(sidePageContain) -->  
<div id="joinslideSidebox"> <!-- 조인 슬라이드 전체박스 -->
    <!-- 조인게시판리스트박스-->
    <div id="joinsideListContain"> <!-- 조인리스트 전체박스-->
        <div id="joinBoardSearch"> <!-- 조인리스트 검색전체박스-->
            
                <ul id="joinBoardMenu">
                    <li>
                        <select class="joinListSearch">
                            <option>호남권</option>
                        </select>
                    </li>
                    <li><input type="text"></li>
                    <li><input type="submit" value="검색"></li>
                    <li><button id="writeBT">글쓰기</button></li>
                </ul>
            
        </div>
        <div class="joinBoardList"> <!-- 조인리게시글 리스트 박스-->
            <ul class="joinList">
                <li class="joinList1"> 0001</li>
                <li class=joinList2> 말머리 </li>
                <li class="joinList3"> 글제목이지요 </li>
                <li class="joinList4"> 2021-08-09 </li>
            </ul>
        </div>
    </div> <!-- sideListContain _ 사이드 리스트 슬라이드 내부 -->
    
    <!-- 조인게시판 상세페이지 박스-->
    <div id="joinsidePageContain">
        <div id="joinsidePageContainClose">
            <img src="img/x.png">
        </div>
        <div id="joininfoPage">

            <!-- 조인게시판 페이지 삽입장소  -->



        </div>
    </div> <!--sidePageContain _ 사이드 상세페이지 슬라이드 내부 박스 2--> 

    <!-- 골프장 사이드바 닫기 화살표 -->
    <div id="joinsideContainClose"> <p>◀</p> </div>

</div> <!-- slideSidebox _2_ 사이드 외부 전체 박스 -->


<!--------------------------------------------------------------- main 전체박스 -->
<div id="fullbox">
    <!---------------------------------------------------------- 상단박스 -->
    <div id="contain1">
        <!-------------------------- 로고박스-->
        <div id="logobox">Any ♨ Golf</div>

        <!-------------------------- 로그인메뉴박스 -->
        <div id="memberbox">
                <li class="membermenu" id="golfmember">골프운영자</li>
                <li class="membermenu" id="jjim"> 찜 </li>
                <li class="membermenu" id="mypage" onclick="getloginInfo()">나의정보</li>
                <%if(loginvo==null){ %>
                <li class="membermenu" id="join">회원가입</li>
                <li class="membermenu" id="login">로그인</li>
                <%}else{ %>
                <li class="membermenu"><%=loginvo.getMember_nick()%></li>
                <li class="membermenu" id="logout"><a id="logouta" href="logout.do">로그아웃</a></li>
                <%} %>
            </ul>
        </div>

    </div>

    <!----------------------------------------------------------- 하단박스 -->
    <div id="contain2">
        <!-------------------------- 사이드 메뉴 박스 -->
        <div id="sidebox">
            
            <ul id="sidemenulist">
                <il class="sidemenu" id="list">
                    <img class="sidemenuicon" src="img/golf_list.png">
                    <p class="sidemenutext">골프장</p>
                </il>
                <il class="sidemenu" id="comm">
                    <img class="sidemenuicon" src="img/list.png">
                    <p class="sidemenutext">게시판</p>
                </il>
                <il class="sidemenu" id="commcaddy">
                    <img class="sidemenuicon" src="img/list.png">
                    <p class="sidemenutext">캐디</p>
                </il>
            </ul>
            
        </div><!--지도메뉴박스 -->
        <div id="mapbox">
        <!-- 지도를 표시할 div 입니다 -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6d1ce6f8899e60fa17f31b2756fe009a"></script>
		<script>
			var mapContainer = document.getElementById('mapbox'), // 지도를 표시할 div 
    		mapOption = { 
        	center: new kakao.maps.LatLng(35.684981, 128.021940), // 지도의 중심좌표
        	level: 13 // 지도의 확대 레벨
    		};
			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			var map = new kakao.maps.Map(mapContainer, mapOption);
			//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			var zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			// 지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
			kakao.maps.event.addListener(map, 'zoom_changed', function() {            
			    // 지도의 현재 레벨을 얻어옵니다
			    var level = map.getLevel();
			   	map.setMaxLevel(13);	    
			});
			//마커가 표시될 위치입니다 
			<% if( arr == null) { %>
			<% for(int i = 0; i < list.size(); i++) { %>
			   var markerPosition  = new kakao.maps.LatLng(<%= list.get(i).getLat()%>, <%= list.get(i).getLag()%>);
			   // 마커를 생성합니다
			   var marker = new kakao.maps.Marker({
			       position: markerPosition
			   });
			   // 마커가 지도 위에 표시되도록 설정합니다
			   marker.setMap(map);
			   <% } %>
			   <% }else{ %>
			   <% for(int i=0; i< arr.size(); i++) { %>
			   var markerPosition  = new kakao.maps.LatLng(<%= arr.get(i).getLat()%>, <%= arr.get(i).getLag()%>);
			   // 마커를 생성합니다
			   var marker = new kakao.maps.Marker({
			       position: markerPosition
			   });
			   // 마커가 지도 위에 표시되도록 설정합니다
			   marker.setMap(map);
			   <% } %>
			   <% } %>
		</script>
        </div>
    </div>


</div> <!-- fullbox : 전체화면 -->

<script>
		function getInfo() {
			var id_num = $(event.srcElement).attr("id")
			console.log(id_num)
			$.ajax({
				//요청할 서버 페이지
				url : "GetSrcList",
				//응답 데이터 타입
				dataType : "json",
				success : function(data){
					$("#golfName").html(data[id_num].golf_name);
					$("#golfinfoimg").attr("src", data[id_num].golf_img);
					$("#golfjanggibon").html(data[id_num].golf_section);
					$("#golfjanghole").html(data[id_num].golf_holes);
					$("#golfjangcaddy").html(data[id_num].golf_caddy);
					$("#golfjangaddr").html(data[id_num].golf_address);
					$("#golfjangcall").html(data[id_num].golf_call);
					//$("#golftitlehole").html(data[id_num].golf_hole);
					//$("#golftitlelocation").html(data[id_num].golf_area);
					//$("#imgex").attr("src", data[id_num].caddy);					
				},
				error : function() {
					alert("실패!")
				}
			});	
		}
		function getloginInfo() {
			var id_num = $(event.srcElement).attr("id")
			console.log(id_num)
			$.ajax({
				//요청할 서버 페이지
				url : "GetUserInfo",
				//응답 데이터 타입
				dataType : "json",
				success : function(data){
					$("#mypageTableName").html(data[0].member_name);
					$("#mypageTableId").html(data[0].member_id);
					$("#mypageInputcall input").attr('placeholder', data[0].member_call);
					$("#mypageInputnick input").attr('placeholder', data[0].member_nick);			
				},
				error : function() {
					alert("실패!")
				}
			});	
		}
		function showupdata(){
			
			
			$("#loginButton").click();
			alert("회원정보가 갱신되었습니다 다시 로그인해주세요 ^^");
			$("#logouta").click();
			
		}
		
		function getReview() {
			$.ajax({
				//요청할 서버 페이지
				url : "GetReivew",
				//응답 데이터 타입
				dataType : "json",
				success : function(data){
					for(var i in data){
						//console.log(data[i].member_nick);
						//var ri = "<div id="golfChangeBox">";
						//ri += "<div class="golfinfoInner">";
						//ri += "<h3>"+data[i].member_nick+"</h3>"; 
						//ri += "</div>";
						//ri += "</div>";
						//$('#golfInfoBox').append(ri);
						var h1 = "<h1>"+data[i].member_nick+"</h1>";
						$('#golfInfoBox').append(h1);
					}	
				},
				error : function() {
					alert("실패!")
				}
			});	
		}
		
		
</script>

</body>
</html>